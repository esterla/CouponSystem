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
    
    public partial class Users_Customer
    {
        public Users_Customer()
        {
            this.CatalogCoupons_SocialNetworkCoupon = new HashSet<CatalogCoupons_SocialNetworkCoupon>();
            this.Categories = new HashSet<Category>();
        }
    
        public Nullable<short> age { get; set; }
        public string gender { get; set; }
        public Nullable<double> Location_latitude { get; set; }
        public Nullable<double> Location_longitude { get; set; }
        public string userName { get; set; }
    
        public virtual ICollection<CatalogCoupons_SocialNetworkCoupon> CatalogCoupons_SocialNetworkCoupon { get; set; }
        public virtual Location Location { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Category> Categories { get; set; }
    }
}
