using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    public class TestCategories
    {
        Category cat1;
        Category cat2;
        Category cat3;
        [TestInitialize]
        public void TestInitCategory()
        {
            //making sure the table is empty
            clearAllTable();

            cat1 = new Category();
            cat2 = new Category();
            cat3 = new Category();
            cat1.catName = "food";
            cat2.catName = "sport";
            cat3.catName = "Entertaiment";
        }

        [TestMethod]
        public void addCategory()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Categories.Add(cat1);
                db.SaveChanges();
            }
            clearAllTable();

        }
        [TestMethod]
        public void removeCategory()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Categories.Add(cat2);
                db.SaveChanges();
                db.Categories.Remove(cat2);
                db.SaveChanges();
            }
            clearAllTable();
        }
        [TestMethod]
        public void pullCategory()
        {
            using (var db = new CS_DBEntities3())
            {
                Category tmpCat = new Category();
                db.Categories.Add(cat3);
                db.SaveChanges();
                tmpCat = db.Categories.Find("Entertaiment");
                db.SaveChanges();
            }
            clearAllTable();
        }

        public void clearAllTable()
        {
            using (var db = new CS_DBEntities3())
            {
                var query1 = from b in db.Categories
                             select b;
                foreach (var item in query1)
                {
                    db.Categories.Remove(item);
                }

            }
        }
    }
}
