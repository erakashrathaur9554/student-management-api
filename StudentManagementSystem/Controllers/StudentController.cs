using DataAccessLayer.Common;
using DataAccessLayer.Contract;
using DataAccessLayer.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace StudentManagementSystem.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class StudentController : ControllerBase
    {
        private readonly IStudentRepository _service;
        private readonly ILogger<StudentController> _logger;
        public StudentController(IStudentRepository service, ILogger<StudentController> logger)
        {
            _service = service;
            _logger = logger;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("add")]
        public async Task<IActionResult> Add(StudentRequestModel model)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
            _logger.LogInformation("Adding student");
            int result = await _service.Add(model);
            if (result > 0)
            {
                return Created("",new ApiResponse<object>
                {
                    Success = true,
                    Message = "Student added successfully"
                });
            }
            return BadRequest(new ApiResponse<object>
            {
                Success = false,
                Message = "Failed to add student"
            });
        }

        [HttpPatch("update/{id}")]
        public async Task<IActionResult> Update(int id,StudentUpdateRequestModel model)
        {
            if (id <= 0)
            {
                return BadRequest(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Invalid student id"
                });
            }

            if (!ModelState.IsValid)
                return BadRequest(ModelState);
            _logger.LogInformation("Updating student");
            if(model.Name == null && model.Age == null && model.Email == null && model.Course == null)
            {
                return BadRequest(new ApiResponse<object>
                {
                    Success = false,
                    Message = "At least one field must be provided for update"
                });

            }
            int result = await _service.Update(id,model);
            if (result > 0)
            {
                return Ok(new ApiResponse<object>
                {
                    Success = true,
                    Message = "Student updated successfully"
                });
            }
            return BadRequest(new ApiResponse<object>
            {
                Success = false,
                Message = "Failed to update student"
            });
        }

        [HttpPut("update/{id}")]
        public async Task<IActionResult> Update(int id, StudentRequestModel model)
        {
            if (id <= 0)
            {
                return BadRequest(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Invalid student id"
                });
            }

            if (!ModelState.IsValid)
                return BadRequest(ModelState);
            _logger.LogInformation("Updating student");
            int result = await _service.Update(id,model);
            if (result > 0)
            {
                return Ok(new ApiResponse<object>
                {
                    Success = true,
                    Message = "Student updated successfully"
                });
            }
            return BadRequest(new ApiResponse<object>
            {
                Success = false,
                Message = "Failed to update student"
            });
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Invalid student id"
                });
            }
            _logger.LogInformation("Deleting student");
            var result = await _service.Delete(id);

            if (result > 0)
            {
                return Ok(new ApiResponse<object>
                {
                    Success = true,
                    Message = "Student deleted successfully"
                });
            }

            return BadRequest(new ApiResponse<object>
            {
                Success = false,
                Message = "Failed to delete student"
            });
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("list")]
        public async Task<IActionResult> GetAllStudents()
        {
            _logger.LogInformation("Fetching student list");

            var result = await _service.StudentList();

            if (result == null || !result.Any())
            {
                return NotFound(new ApiResponse<object>
                {
                    Success = false,
                    Message = "No students found",
                    Data = null
                });
            }

            return Ok(new ApiResponse<object>
            {
                Success = true,
                Message = "Student list fetched successfully",
                Data = result
            });
        }

        [HttpGet("details/{id}")]
        public async Task<IActionResult> GetStudentById(int id)
        {
            if (id <= 0)
            {
                return BadRequest(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Invalid student id"
                });
            }

            _logger.LogInformation($"Fetching student with id {id}");

            var result = await _service.StudentDetailsById(id);

            if (result == null || result.Id <= 0)
            {
                return NotFound(new ApiResponse<object>
                {
                    Success = false,
                    Message = "Student not found"
                });
            }

            return Ok(new ApiResponse<object>
            {
                Success = true,
                Message = "Student fetched successfully",
                Data = result
            });
        }

        
    }
}
