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
    
    public partial class Users_SystemAdministrator
    {
        public Users_SystemAdministrator()
        {
            this.CatalogCoupons = new HashSet<CatalogCoupon>();
        }
    
        public string userName { get; set; }
    
        public virtual ICollection<CatalogCoupon> CatalogCoupons { get; set; }
        public virtual User User { get; set; }
    }
}
