using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rimp_India_Site.Models
{
    public class AdminOrderViewmodel
    {
        public int Order_ID { get; set; }
        public string Order_No { get; set; }
        public DateTime? OrderDate { get; set; }
        public string OrderType { get; set; }
        public string OrderStatus { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
    }

}