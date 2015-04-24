using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestSocialNetworkCoupon
    {
        CatalogCoupon cat1;
        Users_Customer usCos;
        User user1;
        CatalogCoupons_SocialNetworkCoupon socCoup;

        [TestInitialize]
        public void TestInitSocialCoupon()
        {
            //making sure the table is empty
            clearAllTable();

            user1 = new User();
            cat1 = new CatalogCoupon();
            socCoup = new CatalogCoupons_SocialNetworkCoupon();
            usCos = new Users_Customer();
            usCos.User = user1;
            user1.userName = "user123";
            cat1.catalogID = 123;
            socCoup.Users_Customer = usCos;
            socCoup.CatalogCoupon = cat1;

        }

        [TestMethod]
        public void addSocialNetwork()
        {
            using (var db = new CS_DBEntities3())
            {
                db.CatalogCoupons_SocialNetworkCoupon.Add(socCoup);
                db.SaveChanges();
            }
            clearAllTable();
        }


        [TestMethod]
        public void removeSocialNetwork()
        {
            using (var db = new CS_DBEntities3())
            {
                db.CatalogCoupons_SocialNetworkCoupon.Add(socCoup);
                db.SaveChanges();
                db.CatalogCoupons_SocialNetworkCoupon.Remove(socCoup);
                db.SaveChanges();

            }
            clearAllTable();
        }

        [TestMethod]
        public void updateSocialNetwork()
        {
            using (var db = new CS_DBEntities3())
            {
                User user2 = new User();
                user2.userName = "kampai";
                Users_Customer uc2 = new Users_Customer();
                uc2.User = user2;
                
                db.CatalogCoupons_SocialNetworkCoupon.Add(socCoup);
                db.SaveChanges();
                db.CatalogCoupons_SocialNetworkCoupon.Find(socCoup.catalogID).Users_Customer = uc2;
                db.SaveChanges();

            }
            clearAllTable();
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

                var query2 = from b in db.Users
                             select b;
                foreach (var item in query2)
                {
                    db.Users.Remove(item);
                }

                var query3 = from b in db.CatalogCoupons_SocialNetworkCoupon
                             select b;
                foreach (var item in query3)
                {
                    db.CatalogCoupons_SocialNetworkCoupon.Remove(item);
                }

                var query4 = from b in db.Users_Customer
                             select b;
                foreach (var item in query4)
                {
                    db.Users_Customer.Remove(item);
                }
                db.SaveChanges();
            }
        }
    }
}
