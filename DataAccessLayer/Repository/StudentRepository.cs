using DataAccessLayer.Contract;
using DataAccessLayer.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DataAccessLayer.Repository
{
    public class StudentRepository : IStudentRepository
    {
        private readonly string _connectionString;
        public StudentRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<int> Add(StudentRequestModel model)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Student_Add_Update_Delte_GetList_GetDetailsById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Id", model.Id);
                    cmd.Parameters.AddWithValue("@Name", model.Name);
                    cmd.Parameters.AddWithValue("@Email", model.Email);
                    cmd.Parameters.AddWithValue("@Age", model.Age);
                    cmd.Parameters.AddWithValue("@Course", model.Course);
                    cmd.Parameters.AddWithValue("@OperationType", "AddUpdate");

                    await con.OpenAsync();

                    result = await cmd.ExecuteNonQueryAsync();
                }
            }

            return result;
        }
        public async Task<int> Update(int id,StudentUpdateRequestModel model)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Student_Add_Update_Delte_GetList_GetDetailsById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", model.Name);
                    cmd.Parameters.AddWithValue("@Email", model.Email);
                    cmd.Parameters.AddWithValue("@Age", model.Age);
                    cmd.Parameters.AddWithValue("@Course", model.Course);
                    cmd.Parameters.AddWithValue("@OperationType", "AddUpdate");

                    await con.OpenAsync();

                    result = await cmd.ExecuteNonQueryAsync();
                }
            }

            return result;
        }

        public async Task<int> Update(int id,StudentRequestModel model)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Student_Add_Update_Delte_GetList_GetDetailsById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", model.Name);
                    cmd.Parameters.AddWithValue("@Email", model.Email);
                    cmd.Parameters.AddWithValue("@Age", model.Age);
                    cmd.Parameters.AddWithValue("@Course", model.Course);
                    cmd.Parameters.AddWithValue("@OperationType", "AddUpdate");

                    await con.OpenAsync();

                    result = await cmd.ExecuteNonQueryAsync();
                }
            }

            return result;
        }

        public async Task<int> Delete(int id)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Student_Add_Update_Delte_GetList_GetDetailsById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@OperationType", "Delete");

                    await con.OpenAsync();

                    result = await cmd.ExecuteNonQueryAsync();
                }
            }

            return result;
        }

        public async Task<IEnumerable<StudentRequestModel>> StudentList()
        {
            List<StudentRequestModel> list = null;

            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Student_Add_Update_Delte_GetList_GetDetailsById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;

                    cmd.Parameters.AddWithValue("@OperationType", "GetList");

                    await con.OpenAsync();

                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        list = new List<StudentRequestModel>();
                        while (await dr.ReadAsync())
                        {
                            StudentRequestModel model = new StudentRequestModel();
                            model.Id = dr["Id"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Id"]);
                            model.Name = dr["Name"] == DBNull.Value ? string.Empty : Convert.ToString(dr["Name"]);
                            model.Email = dr["Email"] == DBNull.Value ? null : Convert.ToString(dr["Email"]);
                            model.Age = dr["Age"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Age"]);
                            model.Course = dr["Course"] == DBNull.Value ? string.Empty : Convert.ToString(dr["Course"]);
                            list.Add(model);
                        }
                    }
                }
            }
            return list;
        }

        public async Task<StudentRequestModel> StudentDetailsById(int id)
        {
            StudentRequestModel model = null;
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Student_Add_Update_Delte_GetList_GetDetailsById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 120;

                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@OperationType", "GetDetailsById");
                    ;

                    await con.OpenAsync();

                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        if (await dr.ReadAsync())
                        {
                            model = new StudentRequestModel();
                            model.Id = dr["Id"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Id"]);
                            model.Name = dr["Name"] == DBNull.Value ? string.Empty : Convert.ToString(dr["Name"]);
                            model.Email = dr["Email"] == DBNull.Value ? null : Convert.ToString(dr["Email"]);
                            model.Age = dr["Age"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Age"]);
                            model.Course = dr["Course"] == DBNull.Value ? string.Empty : Convert.ToString(dr["Course"]);

                        }
                    }
                }
            }
            return model;
        }


        public async Task<LoginResponseModel> GetUser(string username)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            using SqlCommand cmd = new SqlCommand("usp_User_Login", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 120;
            cmd.Parameters.AddWithValue("@UserName", username);

            await con.OpenAsync();

            using SqlDataReader dr = await cmd.ExecuteReaderAsync();

            LoginResponseModel user = null;

            while (await dr.ReadAsync())
            {
                if (user == null)
                {
                    user = new LoginResponseModel
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        UserName = dr["UserName"].ToString(),
                        PasswordHash = dr["PasswordHash"].ToString(),
                        Role = dr["RoleName"].ToString()
                    };
                }

                if (dr["PermissionName"] != DBNull.Value)
                {
                    user.Permissions.Add(dr["PermissionName"].ToString());
                }
            }

            return user;
        }

        public async Task SaveRefreshToken(int userId, string token, DateTime expiry)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            using SqlCommand cmd = new SqlCommand("usp_InsertRefreshToken", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Token", token);
            cmd.Parameters.AddWithValue("@ExpiryDate", expiry);

            await con.OpenAsync();
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task<(int UserId, DateTime Expiry, bool IsRevoked, string UserName)> GetRefreshToken(string token)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            using SqlCommand cmd = new SqlCommand("usp_GetRefreshToken", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Token", token);

            await con.OpenAsync();

            using SqlDataReader dr = await cmd.ExecuteReaderAsync();

            if (await dr.ReadAsync())
            {
                return (
                    Convert.ToInt32(dr["UserId"]),
                    Convert.ToDateTime(dr["ExpiryDate"]),
                    Convert.ToBoolean(dr["IsRevoked"]),
                    Convert.ToString(dr["UserName"])
                );
            }

            return (0, DateTime.MinValue, true,"");
        }

        public async Task RevokeToken(string token)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            using SqlCommand cmd = new SqlCommand("usp_RevokeRefreshToken", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Token", token);

            await con.OpenAsync();
            await cmd.ExecuteNonQueryAsync();
        }

        public async Task<int> Register(RegisterUserRequestModel model)
        {
            using SqlConnection con = new SqlConnection(_connectionString);
            using SqlCommand cmd = new SqlCommand("usp_User_Register", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@UserName", model.UserName);
            cmd.Parameters.AddWithValue("@PasswordHash", model.PasswordHash);
            cmd.Parameters.AddWithValue("@RoleId", model.RoleId);

            await con.OpenAsync();

            var result = await cmd.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }
    }
}
