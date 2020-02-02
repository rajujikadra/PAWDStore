using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rimp_India_Site.Models
{
    public class ContactViewModel
    {
        public int Contact_ID { get; set; }
        public string Name { get; set; }
        public string Subject { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Address { get; set; }
        public string Message { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedDates { get; set; }
    }
}