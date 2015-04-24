using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestOrderedCoupon
    {
        OrderedCoupon od1;
        [TestInitialize]
        public void TestInitOrderedCoupon()
        {
            //making sure the table is empty
            clearAllTable();

            od1 = new OrderedCoupon();
            od1.serialKey = "a123";
            od1.rank = 4;

        }
        [TestMethod]
        public void addOrderedCoupon()
        {
            using (var db = new CS_DBEntities3())
            {
                db.OrderedCoupons.Add(od1);
                db.SaveChanges();
            }
            clearAllTable();
        }

        [TestMethod]
        public void removeOrderedCoupon()
        {
            using (var db = new CS_DBEntities3())
            {
                db.OrderedCoupons.Add(od1);
                db.SaveChanges();
                db.OrderedCoupons.Remove(od1);
                db.SaveChanges();
            }
            clearAllTable();
        }
        [TestMethod]
        public void updateOrderedCoupon()
        {
            using (var db = new CS_DBEntities3())
            {
                db.OrderedCoupons.Add(od1);
                db.SaveChanges();
                db.OrderedCoupons.Find(od1.serialKey).rank = 10 ;
                db.SaveChanges();
            }
            clearAllTable();
        }

        public void clearAllTable()
        {
            using (var db = new CS_DBEntities3())
            {
                var query1 = from b in db.OrderedCoupons
                             select b;
                foreach (var item in query1)
                {
                    db.OrderedCoupons.Remove(item);
                }
              
                db.SaveChanges();
            }
        }
    }
}
