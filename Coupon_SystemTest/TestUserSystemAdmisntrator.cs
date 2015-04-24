using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestUserSystemAdmisntrator
    {
        User user1;
        Users_SystemAdministrator us;

        [TestInitialize]
        public void TestInitUser()
        {
            //making sure the table is empty
            clearAllTable();

            user1 = new User();
            us = new Users_SystemAdministrator();
            user1.userName = "blabla";
            user1.password = "123";
            user1.fullName = "avi ros";
            user1.phone = "052-1111111";
            us.User = user1;


        }
        [TestMethod]
        public void addUsers_SystemAdministrator()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users_SystemAdministrator.Add(us);
                db.SaveChanges();
            }
            clearAllTable();
        }

        [TestMethod]
        public void removeUsers_SystemAdministrator()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users_SystemAdministrator.Add(us);
                db.SaveChanges();
                db.Users_SystemAdministrator.Remove(us);
                db.SaveChanges();
            }
            clearAllTable();
        }
        [TestMethod]
        public void updateUsers_SystemAdministrator()
        {
            using (var db = new CS_DBEntities3())
            {

                db.Users_SystemAdministrator.Add(us);
                db.SaveChanges();
                db.Users_SystemAdministrator.Find(us.userName).User.email = "bla@bla.com";
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

                var query2 = from b in db.Users_SystemAdministrator
                             select b;
                foreach (var item in query2)
                {
                    db.Users_SystemAdministrator.Remove(item);
                }

                db.SaveChanges();
            }
        }
    }
}
