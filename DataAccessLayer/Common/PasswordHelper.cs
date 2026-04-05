using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer.Common
{
    public class PasswordHelper
    {
        public string Hash(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password, 10);
        }

        public bool Verify(string password, string hash)
        {
            return BCrypt.Net.BCrypt.Verify(password, hash);
        }
    }
}
