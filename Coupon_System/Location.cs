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
    
    public partial class Location
    {
        public Location()
        {
            this.Buisnesses = new HashSet<Buisness>();
            this.CatalogCoupons = new HashSet<CatalogCoupon>();
            this.Users_Customer = new HashSet<Users_Customer>();
        }
    
        public double latitude { get; set; }
        public double longitude { get; set; }
        public string city { get; set; }
    
        public virtual ICollection<Buisness> Buisnesses { get; set; }
        public virtual ICollection<CatalogCoupon> CatalogCoupons { get; set; }
        public virtual ICollection<Users_Customer> Users_Customer { get; set; }
    }
}