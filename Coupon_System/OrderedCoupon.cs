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
    
    public partial class OrderedCoupon
    {
        public string serialKey { get; set; }
        public Nullable<short> rank { get; set; }
        public Nullable<bool> isUsed { get; set; }
        public Nullable<System.DateTime> dateOfUse { get; set; }
        public Nullable<System.DateTime> dateOfPurchase { get; set; }
        public Nullable<System.DateTime> deadLineForUse { get; set; }
        public Nullable<int> CatalogCoupon_catalogID { get; set; }
        public string User_userName { get; set; }
    
        public virtual CatalogCoupon CatalogCoupon { get; set; }
        public virtual User User { get; set; }
    }
}
