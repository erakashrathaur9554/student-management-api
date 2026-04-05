using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccessLayer.Entities
{
    public class AuthResponseModel
    {
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public DateTime Expiry { get; set; }
        public string expiryReadable { get; set; }
    }
}
