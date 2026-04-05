using DataAccessLayer.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer.Contract
{
    public interface IStudentRepository
    {
        Task<int> Add(StudentRequestModel model);
        Task<int> Update(int id,StudentUpdateRequestModel model);
        Task<int> Update(int id,StudentRequestModel model);
        Task<int> Delete(int id);
        Task<IEnumerable<StudentRequestModel>> StudentList();
        Task<StudentRequestModel> StudentDetailsById(int id);
        Task<LoginResponseModel> GetUser(string username);
        Task SaveRefreshToken(int userId, string token, DateTime expiry);
        Task<(int UserId, DateTime Expiry, bool IsRevoked, string UserName)> GetRefreshToken(string token);
        Task RevokeToken(string token);
        Task<int> Register(RegisterUserRequestModel model);
    }
}
