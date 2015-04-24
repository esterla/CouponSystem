using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestBuisness
    {
        Buisness b1;
        Users_BuisnessOwner ub;
        User u1;
        Category c1;
        [TestInitialize]
        public void TestInitBuisness()
        {
            //making sure the table is empty
            clearAllTable();

            u1= new User();
            c1 = new Category();
            b1 = new Buisness();
            ub = new Users_BuisnessOwner();
            b1.buisAddress = "Aharom Meskin 13";
            b1.buisCity = "Beer-Sheva";
            b1.buisName = "JAPANIKA";
            u1.userName="userName";
            c1.catName= "food";
            ub.User = u1;
            b1.Users_BuisnessOwner = ub;
            b1.Category = c1;

        }

        [TestMethod]
        public void addBuisness()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Buisnesses.Add(b1);
                db.SaveChanges();
            }
            clearAllTable();
        }
        [TestMethod]
        public void removeBuisness()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Buisnesses.Add(b1);
                db.Buisnesses.Remove(b1);
                db.SaveChanges();
            }
            clearAllTable();
        }
        [TestMethod]
        public void updateBuisness()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Buisnesses.Add(b1);
                db.Buisnesses.Find(b1.buisName).buisCity="Ashkelon";
                db.SaveChanges();
            }
            clearAllTable();
        }


        public void clearAllTable()
        {
            using (var db = new CS_DBEntities3())
            {
                var query1 = from b in db.Buisnesses
                             select b;
                foreach (var item in query1)
                {
                    db.Buisnesses.Remove(item);
                }

                var query2 = from b in db.Users
                             select b;
                foreach (var item in query2)
                {
                    db.Users.Remove(item);
                }

                var query3 = from b in db.Categories
                             select b;
                foreach (var item in query3)
                {
                    db.Categories.Remove(item);
                }

                var query4 = from b in db.Users_BuisnessOwner
                             select b;
                foreach (var item in query4)
                {
                    db.Users_BuisnessOwner.Remove(item);
                }

                db.SaveChanges();
            }

        }
    }
}
