using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace DataAccessLayer.Entities
{
    public class RegisterUserRequestModel
    {
        [Required(ErrorMessage = "User Name is required")]
        [StringLength(256, MinimumLength = 2, ErrorMessage = "User Name must be between 2 and 256 characters")]
        public string? UserName { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [StringLength(256, MinimumLength = 2, ErrorMessage = "Password must be between 2 and 256 characters")]
        public string? PasswordHash { get; set; }

        [Required(ErrorMessage = "Role Id is required")]
        [Range(1, 150, ErrorMessage = "Role Id must be greater than 1")]
        public int? RoleId { get; set; }
    }
}
