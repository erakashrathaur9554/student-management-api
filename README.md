Assignment - Student Management System - ASP.NET Core Web API

Project Overview :- 
--------------------
This project is a Student Management System built using ASP.NET Core Web API.
It provides CRUD operations for managing student records with secure authentication.

Features  :-
---------------
1. Get All Students
2. Add Student
3. Update Student(Partialy/Full Update)
4. Delete Student
5. JWT Authentication
6. Global Exception Handling (Middleware)
7. Logging (Serilog)
8. Swagger API Documentation
9. Layered Architecture (Controller, Service, Repository)

Technologies Used : -
-----------------------
. ASP.NET Core 10
. ADO.NET
. SQL Server
. JWT Authentication
. Serilog

API Endpoints :-
 --------------------
1. POST https://localhost:7041/api/auth/register 
   Input :-
   {
    "UserName" : "Student",
    "PasswordHash" : "Student@123",
    "RoleId" : 2
   }

   {
    "UserName" : "Admin",
    "PasswordHash" : "Admin@123",
    "RoleId" : 2
   }
   OutPut :-
   {
    "success": true,
    "message": "User registered successfully",
    "data": null
  }
 
 2. POST https://localhost:7041/api/auth/login
  Input :-
  {
    "UserName" : "Admin",
    "Password" : "Admin@123"
  }
  Output :-
  {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiQWRtaW4iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsIlVzZXJJZCI6IjEiLCJQZXJtaXNzaW9uIjpbIkFkZFN0dWRlbnQiLCJVcGRhdGVTdHVkZW50IiwiRGVsZXRlU3R1ZGVudCIsIlZpZXdTdHVkZW50Il0sImV4cCI6MTc3NTM5Mjc4MCwiaXNzIjoic3R1ZGVudHBvcnRhbC5jb20iLCJhdWQiOiJzdHVkZW50cG9ydGFsLmNvbSJ9.T8rBf51Ar5ah9H3Sl8tNY__AibjtJSm3np9yPH5BEP4",
    "refreshToken": "8d5ce06b-b235-4bb7-a19f-a887518a53c7",
    "expiry": "0001-01-01T00:00:00",
    "expiryReadable": null

  }  

  3. POST https://localhost:7041/api/student/add
    Input :-
    Body :
    {
      "name": "Akash",
      "email": "rahul@gmail.com",
      "age": 25,
      "course": "Computer Science"
    }
  
    Header: Authorization: Bearer {your_token}

    Output :-
    {
    "success": true,
    "message": "Student added successfully",
    "data": null
    }

 4. GET https://localhost:7041/api/student/list
    Input :-
    Header: Authorization: Bearer {your_token}

 5. GET https://localhost:7041/api/student/details/1
   Input :-
   Header: Authorization: Bearer {your_token}

 6. DELETE https://localhost:7041/api/student/delete/2
    Input :-
    Header: Authorization: Bearer {your_token}
 
 7. PATCH https://localhost:7041/api/student/update/2
    Input :-
    {
    "Name" : "asdfasf"
    }
    Header: Authorization: Bearer {your_token}\

 8. PUT https://localhost:7041/api/student/update/2
    Input :-
    {
    "Name" : "akash",
    "Email" : "akash@gmail.com",
    "Age" : 26,
    "Course" : "IT"
    }
    Header: Authorization: Bearer {your_token}

Configuration : -
-------------------
Update connection string in: appsettings.json

How to Run the Project :-
---------------------------
1. Clone the repository: git clone https://github.com/erakashrathaur9554/student-management-api.git
2. Open solution in Visual Studio
3. Run the project: dotnet run

 Authentication :-
 -------------------
 1. Use login API to generate JWT Token
 2. Add token in header: Authorization: Bearer {your_token}

 Project Structure :-
 -----------------------
 . Controllers
 . Middleware
 . DataAccessLayer (Class Library)

 
    
      
  
