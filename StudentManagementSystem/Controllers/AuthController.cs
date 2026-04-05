using DataAccessLayer.Common;
using DataAccessLayer.Contract;
using DataAccessLayer.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace StudentManagementSystem.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;
        private readonly IStudentRepository _service;
        private readonly ILogger<StudentController> _logger;

        public AuthController(IConfiguration config, IStudentRepository service, ILogger<StudentController> logger)
        {
            _config = config;
            _service = service;
            _logger = logger;
        }

        //[AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequestModel request)
        {
            var user = await _service.GetUser(request.UserName);

            if (user == null)
                return Unauthorized("User not found");

            PasswordHelper helper = new PasswordHelper();

            if (!helper.Verify(request.Password, user.PasswordHash))
                return Unauthorized("Invalid password");
            //var token = GenerateToken(user);
            //if (request.UserName != "admin" || request.Password != "1234")
            //return Unauthorized(new { message = "Invalid credentials" });

            //var expiryMinutes = Convert.ToDouble(_config["Jwt:AccessTokenExpiryMinutes"]);
            double expiryMinutes = _config.GetValue<double>("Jwt:AccessTokenExpiryMinutes");
            var refreshDays = _config.GetValue<int>("Jwt:RefreshTokenExpiryDays");
            var token = GenerateToken(user, expiryMinutes);

            var refreshToken = Guid.NewGuid().ToString();
            var refreshExpiry = DateTime.UtcNow.AddDays(refreshDays);

            await _service.SaveRefreshToken(user.Id, refreshToken, refreshExpiry);

            return Ok(new AuthResponseModel
            {
                Token = token,
                RefreshToken = refreshToken
                //Expiry = DateTime.UtcNow.AddMinutes(expiryMinutes),
                //expiryReadable = DateTime.UtcNow.AddMinutes(expiryMinutes).ToLocalTime().ToString("dd-MM-yyyy hh:mm tt"),
            });
        }

        [HttpPost("refresh")]
        public async Task<IActionResult> Refresh(TokenRequestModel model)
        {
            var data = await _service.GetRefreshToken(model.RefreshToken);

            if (data.UserId == 0 || data.IsRevoked)
                return Unauthorized("Invalid refresh token");

            if (data.Expiry < DateTime.UtcNow)
                return Unauthorized("Refresh token expired");

            var user = await _service.GetUser(data.UserName);

            var expiryMinutes = _config.GetValue<double>("Jwt:AccessTokenExpiryMinutes");

            var newAccessToken = GenerateToken(user, expiryMinutes);

            return Ok(new
            {
                token = newAccessToken
            });
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterUserRequestModel request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (string.IsNullOrWhiteSpace(request.UserName) || string.IsNullOrWhiteSpace(request.PasswordHash))
            {
                return BadRequest("Username and Password required");
            }

            PasswordHelper helper = new PasswordHelper();

            var hash = helper.Hash(request.PasswordHash);
            request.PasswordHash = hash;

            // Default role = User (2)
            int result = await _service.Register(request);

            if (result == -1)
            {
                return BadRequest(new ApiResponse<object>
                {
                    Success = false,
                    Message = "User already exists"
                });
                //return BadRequest("");
            }

            return Ok(new ApiResponse<object>
            {
                Success = true,
                Message = "User registered successfully"
            });
        }

        private string GenerateToken(LoginResponseModel user, double expiryMinutes)
        {
            var key = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(_config["Jwt:Key"])
            );

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            //    var claims = new List<Claim>
            //{
            //    new Claim(ClaimTypes.Name, username),
            //    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            //};
            var claims = new List<Claim>
    {
        new Claim(ClaimTypes.Name, user.UserName),
        new Claim(ClaimTypes.Role, user.Role),
        new Claim("UserId", user.Id.ToString())
    };

            foreach (var perm in user.Permissions)
            {
                claims.Add(new Claim("Permission", perm));
            }

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(expiryMinutes),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
