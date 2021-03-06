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
    
    public partial class AdminLoginMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AdminLoginMaster()
        {
            this.UserDetails_Master = new HashSet<UserDetails_Master>();
            this.User_Address_Master = new HashSet<User_Address_Master>();
            this.Cart_Master = new HashSet<Cart_Master>();
            this.Order_Master = new HashSet<Order_Master>();
        }
    
        public int User_ID { get; set; }
        public string EmailID { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }
        public bool IsAdmin { get; set; }
        public Nullable<System.DateTime> JoinDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserDetails_Master> UserDetails_Master { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<User_Address_Master> User_Address_Master { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart_Master> Cart_Master { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order_Master> Order_Master { get; set; }
    }
}
