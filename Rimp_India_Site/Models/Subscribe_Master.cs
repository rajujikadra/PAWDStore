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
    
    public partial class Subscribe_Master
    {
        public int Subscribe_ID { get; set; }
        public string EmailID { get; set; }
        public Nullable<int> Email_Group_ID { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    
        public virtual Email_Group_Master Email_Group_Master { get; set; }
    }
}
