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
    
    public partial class GetLastProduct_Result
    {
        public int Product_ID { get; set; }
        public string Product_Title { get; set; }
        public string Product_short_description { get; set; }
        public string Product_long_description { get; set; }
        public Nullable<System.DateTime> Created_date { get; set; }
        public Nullable<System.DateTime> Updated_date { get; set; }
        public Nullable<int> Category_ID { get; set; }
        public Nullable<int> SubCategory_ID { get; set; }
        public Nullable<int> ThirdCategory_ID { get; set; }
        public Nullable<decimal> Product_Price { get; set; }
        public string Category_Name { get; set; }
        public string SubCategory_Name { get; set; }
        public string ThirdCategory_Name { get; set; }
        public int Procut_image_ID { get; set; }
        public byte[] Product_image { get; set; }
        public string Image_name { get; set; }
    }
}
