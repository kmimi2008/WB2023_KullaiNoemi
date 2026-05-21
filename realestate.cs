using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Globalization;

namespace RealEstate
{
    class Seller
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
    }

    class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    class Ad
    {
        public int Id { get; set; }
        public int Rooms { get; set; }
        public double Lat { get; set; }
        public double Lon { get; set; }
        public int Floors { get; set; }
        public int Area { get; set; }
        public bool FreeOfCharge { get; set; }
        public DateTime CreateAt { get; set; }

        public Seller Seller { get; set; }
        public Category Category { get; set; }

        
        public static List<Ad> LoadFromCsv(string file)
        {
            var list = new List<Ad>();
            var lines = File.ReadAllLines(file).Skip(1);

            foreach (var line in lines)
            {
                var parts = line.Split(';');

                var latlon = parts[2].Split(',');

                list.Add(new Ad
                {
                    Id = int.Parse(parts[0]),
                    Rooms = int.Parse(parts[1]),
                    Lat = double.Parse(latlon[0], CultureInfo.InvariantCulture),
                    Lon = double.Parse(latlon[1], CultureInfo.InvariantCulture),
                    Floors = int.Parse(parts[3]),
                    Area = int.Parse(parts[4]),
                    FreeOfCharge = parts[6] == "1",
                    CreateAt = DateTime.Parse(parts[8]),

                    Seller = new Seller
                    {
                        Id = int.Parse(parts[9]),
                        Name = parts[10],
                        Phone = parts[11]
                    },

                    Category = new Category
                    {
                        Id = int.Parse(parts[12]),
                        Name = parts[13]
                    }
                });
            }

            return list;
        }

      
        public double DistanceTo(double lat, double lon)
        {
            double a = this.Lat - lat;
            double b = this.Lon - lon;
            return Math.Sqrt(a * a + b * b);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            var ads = Ad.LoadFromCsv("realestates.csv");



          
            var ground = ads
                .Where(a => a.Floors == 0)
                .ToList();

            double avg = ground.Average(a => a.Area);

            Console.WriteLine($"1. Földszinti ingatlanok átlagos alapterülete: {avg:F2} m2");



          
            double oviLat = 47.4164220114023;
            double oviLon = 19.06634225796986;

            var closest = ads
                .Where(a => a.FreeOfCharge)
                .OrderBy(a => a.DistanceTo(oviLat, oviLon))
                .First();

            Console.WriteLine("2. Mesevár óvodához legközelebbi tehermentes ingatlan adatai:");
            Console.WriteLine($"Eladó neve: {closest.Seller.Name}");
            Console.WriteLine($"Eladó telefonszáma: {closest.Seller.Phone}");
            Console.WriteLine($"Alapterület: {closest.Area}");
            Console.WriteLine($"Szobák száma: {closest.Rooms}");


        }
    }
}
