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
    
    public partial class Cart_Master
    {
        public int Cart_ID { get; set; }
        public Nullable<int> User_ID { get; set; }
        public Nullable<int> Product_ID { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
    
        public virtual AdminLoginMaster AdminLoginMaster { get; set; }
        public virtual Product_Master Product_Master { get; set; }
    }
}
