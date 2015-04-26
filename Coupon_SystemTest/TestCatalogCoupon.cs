using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestCatalogCoupon
    {
        CatalogCoupon cat1;
        Location l1;

       [TestInitialize]
        public void TestInitCatalogCoupon()
        {
            //making sure the table is empty
            TestBuisness.clearAllTable();

            cat1 = new CatalogCoupon();
            l1 = new Location();
            l1.latitude = 1;
            l1.latitude = 2;
            cat1.catalogID = 123;
            cat1.CouponName = "free resert";
            cat1.Location = l1;

        }
        [TestMethod]
        public void addCatalogCoupon()
        {
            using (var db = new CS_DBEntities3())//adding user and category for test
            {
                db.CatalogCoupons.Add(cat1);
                db.SaveChanges();
            }
            TestBuisness.clearAllTable();
        }

        [TestMethod]
        public void removeCatalogCoupon()
        {
            using (var db = new CS_DBEntities3())//adding user and category for test
            {
                db.CatalogCoupons.Add(cat1);
                db.SaveChanges();
                db.CatalogCoupons.Remove(cat1);
                db.SaveChanges();
            }
            TestBuisness.clearAllTable();
        }

        [TestMethod]
        public void updateCatalogCoupon()
        {
            using (var db = new CS_DBEntities3())//adding user and category for test
            {
                Location l2 = new Location();
                l2.latitude = 2;
                l2.longitude = 3;
                l2.city = "blabla";
                db.CatalogCoupons.Add(cat1);
                db.SaveChanges();
                db.CatalogCoupons.Find(cat1.catalogID).Location=l2;
                db.SaveChanges();
            }
            TestBuisness.clearAllTable();
        }




        public void clearAllTable()
        {
            using (var db = new CS_DBEntities3())
            {
                var query1 = from b in db.CatalogCoupons
                             select b;
                foreach (var item in query1)
                {
                    db.CatalogCoupons.Remove(item);
                }

                var query2 = from b in db.Locations
                             select b;
                foreach (var item in query2)
                {
                    db.Locations.Remove(item);
                }

                db.SaveChanges();
            }

        }
    }
}
