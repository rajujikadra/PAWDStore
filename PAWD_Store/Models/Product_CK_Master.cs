//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PAWD_Store.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_CK_Master
    {
        public int Product_CK_ID { get; set; }
        public Nullable<int> Product_ID { get; set; }
        public string CK_Title { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> Created_date { get; set; }
        public Nullable<System.DateTime> Updated_date { get; set; }
    
        public virtual Product_Master Product_Master { get; set; }
    }
}
