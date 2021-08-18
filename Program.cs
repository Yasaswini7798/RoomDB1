using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace RoomDB
{
    class Program
    {
        static void Main(string[] args)
        {
            Country ob = new Country();
            ob.CountryName = "India";
            string sqlCountryinsert = String.Format("insert into Countries(\"CountryName\") values('{0}')", ob.CountryName);
            Console.WriteLine("QUERY \t" + sqlCountryinsert);
            RoomModelContainer db = new RoomModelContainer();
            int res = db.Database.ExecuteSqlCommand(sqlCountryinsert);
            if (res == 1)
                Console.WriteLine("Query inserted");
            else
                Console.WriteLine("ERROR in inserting data");
            City c = new City();
            c.CountryCountryId = 1;
            c.CityName = "Hyderabad";
            string sqlCityinsert = String.Format("insert into Cities(CountryCountryId,\"CityName\") values('{0}','{1}')", c.CountryCountryId, c.CityName);
            Console.WriteLine("QUERY \t" + sqlCityinsert);

            int r = db.Database.ExecuteSqlCommand(sqlCityinsert);
            if (r == 1)
                Console.WriteLine("Query inserted");
            else
                Console.WriteLine("ERROR in inserting data");
            Address add = new Address();
            add.CityCityId = 2;
            add.Address1 = "Sai Nagar";
            add.Address2 = "Ram Nagar";
            add.Address3 = "Shanti Nagar";
            add.Postalcode = "516115";
            string sqlAddressinsert = String.Format("insert into Addresses(CityCityId,\"Address1\",\"Address2\",\"Address3\",Postalcode) values('{0}','{1}','{2}','{3}','{4}')", add.CityCityId, add.Address1, add.Address2, add.Address3, add.Postalcode);
            Console.WriteLine("QUERY \t" + sqlAddressinsert);
            res = db.Database.ExecuteSqlCommand(sqlAddressinsert);
            if (res == 1)
                Console.WriteLine("Query inserted");
            else
                Console.WriteLine("ERROR in inserting data");
            Building b = new Building();
            b.Floornumber = 12;
            b.Latitude = 10;
            b.Longitude = 12;
            b.AddressIdAddress = 1;
            string sqlBuildinsert = String.Format("insert into Buildings(Floornumber,Latitude,Longitude,AddressIdAddress) values('{0}','{1}','{2}','{3}')", b.Floornumber, b.Latitude, b.Longitude, b.AddressIdAddress);
            Console.WriteLine("QUERY \t" + sqlBuildinsert);
            res = db.Database.ExecuteSqlCommand(sqlBuildinsert);
            if (res == 1)
                Console.WriteLine("Query inserted");
            else
                Console.WriteLine("ERROR in inserting data");
            Room ro = new Room();
            ro.name = "LivingRoom";
            ro.description = "LivingRoom for relaxation";
            ro.capacity = 2;
            ro.enabled = 1;
            ro.note = "NoteRoom";
            ro.smart = 65;
            ro.floor = 2;
            ro.BuildingIdBuilding = 1;
            string sqlroominsert = String.Format("insert into Rooms(name,description,capacity,enabled,note,smart,floor,BuildingidBuilding) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", ro.name, ro.description, ro.capacity, ro.enabled,ro.note,ro.smart,ro.floor,ro.BuildingIdBuilding);
            Console.WriteLine("QUERY \t" + sqlroominsert);
            res = db.Database.ExecuteSqlCommand(sqlroominsert);
            if (res == 1)
                Console.WriteLine("Query inserted");
            else
                Console.WriteLine("ERROR in inserting data");
            Building bu = new Building();
            string sqlupdate = "update Buildings set Floornumber = @floornumber,Latitude=@latitude where IdBuilding = 1";
            List<SqlParameter> plist = new List<SqlParameter>();
            plist.Add(new SqlParameter("@floornumber", 6));
            plist.Add(new SqlParameter("@latitude", 15));
            SqlParameter[] parameters = plist.ToArray();
            res = db.Database.ExecuteSqlCommand(sqlupdate, parameters);
            if (r == 1)
                Console.WriteLine("updated");
            else
                Console.WriteLine("error");
            Room room1 = new Room();
            string sqlselectall = "select * from Rooms";
            IEnumerable<Room> roomlist = db.Rooms.SqlQuery(sqlselectall);
            Console.WriteLine("ROOMID\t\tROOMNAME\t\tDESCRIPTION\t\tCAPACITY\t\tENABLED\tNOTE\tSMART\tFLOOR\tBUILDINGID");
            foreach (Room room in roomlist)
            {
                Console.WriteLine("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}", room.IdRoom, room.name, room.description, room.capacity, room.enabled, room.note, room.smart, room.floor, room.BuildingIdBuilding);
            }
            SqlParameter p1 = new SqlParameter();
            p1.ParameterName = "@id";
            p1.Value = 1;
            p1.SqlDbType = System.Data.SqlDbType.Int;
            string sql_param = "select * from Buildings where IdBuilding=@id";
            IEnumerable<Building> builList1 = db.Buildings.SqlQuery(sql_param, p1);
            Console.WriteLine("BUILDINGID\tLATITUDE\tLONGITUDE\tADDRESSID");
            foreach (Building d in builList1)
            {
                Console.WriteLine("{0}\t\t{1}\t\t{2}\t\t{3}", d.IdBuilding, d.Latitude, d.Longitude, d.AddressIdAddress);
            }            var buillist2 = db.Database.SqlQuery<MyClass>("select IdBuilding,floornumber,latitude,longitude from Buildings");
            Console.WriteLine("non entity ");
            foreach (MyClass m in buillist2)
            {
                Console.WriteLine("{0}\t{1}\t{2}\t{3}", m.IdBuilding, m.floornumber, m.latitude, m.longitude);
            }
        }
    }
}
