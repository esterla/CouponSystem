using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Coupon_System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Coupon_SystemTest
{
    [TestClass]
    
    public class TestLocation
    {
        Location l1;
        Location l2;
        [TestInitialize]
        public void TestInitLocation()
        {
            //making sure the table is empty
            using (var db = new CS_DBEntities3())
            {
                var query = from b in db.Locations
                            orderby b.latitude
                            select b;
                foreach (var item in query)
                {
                    db.Locations.Remove(item);
                }
                db.SaveChanges();
            }
            l1 = new Location();
            l2 = new Location();
            l1.latitude = 1.11;
            l1.longitude = 1.21;
            l1.city = "Beer-Sheva";
            l2.latitude = 2.1;
            l2.longitude = 2.2;
            l2.city = "Tel-Aviv";
            
        }
        [TestMethod]
        public void addLocation()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Locations.Add(l1);
                db.SaveChanges();
            }
        }

        [TestMethod]
        public void removeLocation()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Locations.Add(l1);
                db.SaveChanges();
                db.Locations.Remove(l1);
                db.SaveChanges();
            }
        }
        [TestMethod]
        public void updateLocation()
        {
            using (var db = new CS_DBEntities3())
            {
                db.Locations.Add(l1);
                db.SaveChanges();
                db.Locations.Find(l1.latitude,l1.longitude).city="Tel-Aviv";
                db.SaveChanges();
            }
        }


    }
}
