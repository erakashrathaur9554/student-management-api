using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DataAccessLayer.Entities
{
    public class StudentRequestModel
    {
        public int? Id { get; set; }

        [Required(ErrorMessage = "Student Name is required")]
        [StringLength(256, MinimumLength = 2, ErrorMessage = "Name must be between 2 and 256 characters")]
        public string? Name { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email format")]
        [StringLength(256, ErrorMessage = "Email cannot exceed 256 characters")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "Age is required")]
        [Range(1, 150, ErrorMessage = "Age must be between 1 and 150")]
        public int? Age { get; set; }

        [Required(ErrorMessage = "Course is required")]
        [StringLength(256, ErrorMessage = "Course cannot exceed 256 characters")]
        public string? Course { get; set; }

    }
}
