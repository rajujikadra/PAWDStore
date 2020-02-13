using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PAWD_Store.Models
{
    public class OrderItemsViewModel
    {
        public int Order_ID { get; set; }
        public string Order_No { get; set; }
        public DateTime? OrderDate { get; set; }
        public string OrderType { get; set; }
        public string OrderStatus { get; set; }

        public int Order_Item_ID { get; set; }
        public string BName { get; set; }
        public string BEmail { get; set; }
        public string BMobile { get; set; }
        public string BAddress { get; set; }
        public string BCity { get; set; }
        public string BState { get; set; }
        public string BZipcode { get; set; }

        public string SName { get; set; }
        public string SEmail { get; set; }
        public string SMobile { get; set; }
        public string SAddress { get; set; }
        public string SCity { get; set; }
        public string SState { get; set; }
        public string SZipcode { get; set; }

        public string paymentMethod { get; set; }
        public int User_Address_ID { get; set; }

        public List<AdminOrderItemViewModel> OrderItem { get; set; }

    }

    public class AdminOrderItemViewModel
    {
        public int Order_Item_ID { get; set; }
        public int? Product_ID { get; set; }
        public string ImageName { get; set; }
        public string Product_Title { get; set; }
        public decimal? Product_Price { get; set; }
        public int? Quantity { get; set; }
        public int? Order_ID { get; set; }
        public string ProductShortDescription { get; set; }
        public string ProductSize { get; set; }
    }
}