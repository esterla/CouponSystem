﻿

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
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class CS_DBEntities3 : DbContext
{
    public CS_DBEntities3()
        : base("name=CS_DBEntities3")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<Buisness> Buisnesses { get; set; }

    public virtual DbSet<CatalogCoupon> CatalogCoupons { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Location> Locations { get; set; }

    public virtual DbSet<OrderedCoupon> OrderedCoupons { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Users_BuisnessOwner> Users_BuisnessOwner { get; set; }

    public virtual DbSet<Users_Customer> Users_Customer { get; set; }

    public virtual DbSet<Users_SystemAdministrator> Users_SystemAdministrator { get; set; }

    public virtual DbSet<CatalogCoupons_SocialNetworkCoupon> CatalogCoupons_SocialNetworkCoupon { get; set; }

}

}

