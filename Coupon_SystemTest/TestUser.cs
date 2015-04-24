using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestUder
    {
        User user1;
        [TestInitialize]
        public void TestInitUser()
        {
            //making sure the table is empty
            clearAllTable();

            user1 = new User();
            user1.userName = "blabla";
            user1.password = "123";
            user1.fullName = "avi ros";
            user1.phone = "052-1111111";

        }
        [TestMethod]
        public void addUser()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users.Add(user1);
                db.SaveChanges();
            }
            clearAllTable();
        }

        [TestMethod]
        public void removeUser()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users.Add(user1);
                db.SaveChanges();
                db.Users.Remove(user1);
                db.SaveChanges();
            }
            clearAllTable();
        }
        [TestMethod]
        public void updateUser()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users.Add(user1);
                db.SaveChanges();
                db.Users.Find(user1.userName).phone = "052-123456789";
                db.SaveChanges();
            }
            clearAllTable();
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

                db.SaveChanges();
            }
        }
    }
}
