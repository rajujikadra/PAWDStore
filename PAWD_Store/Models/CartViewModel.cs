using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAWD_Store.Models
{
    public class CartViewModel
    {
        public int Cart_ID { get; set; }
        public string Product_Title { get; set; }
        public int Quantity { get; set; }
        public string ProductImage { get; set; }
        public decimal Product_Price { get; set; }
        public int? Product_ID { get; set; }
        public string Size { get; set; }
    }
}