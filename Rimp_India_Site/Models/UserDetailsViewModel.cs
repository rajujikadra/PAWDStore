using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rimp_India_Site.Models
{
    public class UserDetailsViewModel
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string EmailID { get; set; }
        public string Website { get; set; }
        public string Bio { get; set; }
        public string ProfileImage { get; set; }
        public DateTime? JoinDate { get; set; } 
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
    }
}