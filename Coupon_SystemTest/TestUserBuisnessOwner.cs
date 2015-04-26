using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestUserBuisnessOwner
    {
        User user1;
        Users_BuisnessOwner ub;
        [TestInitialize]
        public void TestInitUser()
        {
            //making sure the table is empty
            TestBuisness.clearAllTable();

            user1 = new User();
            ub = new Users_BuisnessOwner();
            user1.userName = "blabla";
            user1.password = "123";
            user1.fullName = "avi ros";
            user1.phone = "052-1111111";

            ub.User = user1;

        }
        [TestMethod]
        public void addUsers_BuisnessOwner()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users_BuisnessOwner.Add(ub);
                db.SaveChanges();
            }
            TestBuisness.clearAllTable();
        }

        [TestMethod]
        public void removeUsers_BuisnessOwner()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users_BuisnessOwner.Add(ub);
                db.SaveChanges();
                db.Users_BuisnessOwner.Remove(ub);
                db.SaveChanges();
            }
            TestBuisness.clearAllTable();
        }
        [TestMethod]
        public void updateUsers_BuisnessOwner()
        {
            using (var db = new CS_DBEntities3())
            {
               
                db.Users_BuisnessOwner.Add(ub);
                db.SaveChanges();
                db.Users_BuisnessOwner.Find(ub.userName).User.password = "2222";
                db.SaveChanges();
            }
            TestBuisness.clearAllTable();
        }

        public void clearAllTable()
        {
            using (var db = new CS_DBEntities3())
            {
                var query1 = from b in db.Users
                             select b;
                foreach (var item in query1)
                {
                    db.Users.Remove(item);
                }

                var query2 = from b in db.Users_BuisnessOwner
                             select b;
                foreach (var item in query2)
                {
                    db.Users_BuisnessOwner.Remove(item);
                }

                db.SaveChanges();
            }
        }
    }
}
