using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestUsersCostumer
    {
        User u1;
        User u2;
        Users_Customer uc1;
        Users_Customer uc2;
        [TestInitialize]
        public void TestInitLocation()
        {
            //making sure the table is empty
            using (var db = new CS_DBEntities3())
            {
                var query1 = from b in db.Users_Customer
                            orderby b.userName
                            select b;
                foreach (var item in query1)
                {
                    db.Users_Customer.Remove(item);
                }
                db.SaveChanges();

                var query2 = from b in db.Users
                            orderby b.userName
                            select b;
                foreach (var item in query2)
                {
                    db.Users.Remove(item);
                }
                db.SaveChanges();

            }
            u1 = new User();
            u2 = new User();
            uc1 = new Users_Customer();
            uc2= new Users_Customer();
            u1.userName = "michab";
            u2.userName = "test1234";
            uc1.userName = u1.userName;
            uc1.gender = "Male";
            uc1.age = 20;
            uc2.userName = u2.userName;
            uc1.gender = "Female";
            uc1.age = 23;


            
        }

        [TestMethod]
        public void addUser()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users.Add(u1);
                db.Users.Add(u2);
                db.Users_Customer.Add(uc1);
                db.Users_Customer.Add(uc2);
                db.SaveChanges();
            }
        }

        [TestMethod]
        public void removeUser()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users.Add(u1);
                db.Users.Add(u2);
                db.Users_Customer.Add(uc1);
                db.Users_Customer.Remove(uc1);
                db.SaveChanges();
            }
        }

        [TestMethod]
        public void updateUser()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Users.Add(u1);
                db.Users.Add(u2);
                db.Users_Customer.Add(uc1);
                db.Users_Customer.Find(uc1.userName).age=16;
                db.SaveChanges();
            }
        }
    }
}
