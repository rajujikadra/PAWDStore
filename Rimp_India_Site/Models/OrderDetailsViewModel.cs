using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rimp_India_Site.Models
{
    public class OrderDetailsViewModel
    {
        public int Order_ID { get; set; }
        public string Order_No { get; set; }
        public DateTime? OrderDate { get; set; }
        public string OrderType { get; set; }
        public string OrderStatus { get; set; }
        public List<OrderItemViewModel> OrderItems { get; set; }
    }

    public class OrderItemViewModel
    {
        public int Order_Item_ID { get; set; }
        public int? Product_ID { get; set; }
        public string ImageName { get; set; }
        public string Product_Title { get; set; }
        public decimal? Product_Price { get; set; }
        public int? Quantity { get; set; }
        public int? Order_ID { get; set; }
        public string ProductSize { get; set; }
        public string ProductShortDescription { get; set; }
    }
}