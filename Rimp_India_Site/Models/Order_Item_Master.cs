//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Rimp_India_Site.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order_Item_Master
    {
        public int Order_Item_ID { get; set; }
        public Nullable<int> Order_ID { get; set; }
        public Nullable<int> Product_ID { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> Price { get; set; }
        public string Size { get; set; }
    
        public virtual Order_Master Order_Master { get; set; }
        public virtual Product_Master Product_Master { get; set; }
    }
}
