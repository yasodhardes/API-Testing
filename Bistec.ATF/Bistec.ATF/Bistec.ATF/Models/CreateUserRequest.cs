using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Bistec.ATF.Refit.Models
{
    public class CreateUserRequest
    {
        public String username { get; set; }
        public string password { get; set; }
        public string extra { get; set; }
    }
}
