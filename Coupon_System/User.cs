//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Coupon_System
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public User()
        {
            this.OrderedCoupons = new HashSet<OrderedCoupon>();
        }
    
        public string userName { get; set; }
        public string password { get; set; }
        public string fullName { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
    
        public virtual ICollection<OrderedCoupon> OrderedCoupons { get; set; }
        public virtual Users_BuisnessOwner Users_BuisnessOwner { get; set; }
        public virtual Users_Customer Users_Customer { get; set; }
        public virtual Users_SystemAdministrator Users_SystemAdministrator { get; set; }
    }
}
