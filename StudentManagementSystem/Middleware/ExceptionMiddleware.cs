using DataAccessLayer.Entities;
using Serilog;

namespace StudentManagementSystem.Middleware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;

        public ExceptionMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                //context.Response.StatusCode = 500;
                //await context.Response.WriteAsync(ex.Message);
                context.Response.StatusCode = StatusCodes.Status500InternalServerError;
                context.Response.ContentType = "application/json";
                var response = new ApiResponse<object>
                {
                    Success = false,
                    Message = "Something went wrong. Please try again later."
                };

                Log.Error(ex, "Unhandled Exception");

                await context.Response.WriteAsJsonAsync(response);
            }
        }
    }
}
