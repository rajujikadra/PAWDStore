using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rimp_India_Site.Models
{
    public class OrderViewModel
    {
        public int Order_ID { get; set; }
        public string BName { get; set; }
        public string BEmail { get; set; }
        public string BMobile { get; set; }
        public string BAddress { get; set; }
        public string BCity { get; set; }
        public string BState { get; set; }
        public string BZipcode { get; set; }

        public bool IsShippindAddress { get; set; }

        public string SName { get; set; }
        public string SEmail { get; set; }
        public string SMobile { get; set; }
        public string SAddress { get; set; }
        public string SCity { get; set; }
        public string SState { get; set; }
        public string SZipcode { get; set; }

        public string paymentMethod { get; set; }
        public int User_Address_ID { get; set; }
    }
}