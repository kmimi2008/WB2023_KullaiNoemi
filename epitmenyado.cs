using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Epitmenyado
{
    class epitmeny
    {
        public string adoszam;
        public string utca;
        public string hazszam;
        public string adosav;
        public int terulet;
        //public int szamitottAdo;
        //public int fizetettAdo = 0;
        public epitmeny(string line, int A, int B, int C)
        {
            string[] sz = line.Split(' ');
            this.adoszam = sz[0];
            this.utca = sz[1];
            this.hazszam = sz[2];
            this.adosav = sz[3];
            this.terulet = int.Parse(sz[4]);
            /*switch (adosav)
            {
                case "A":
                    this.szamitottAdo = terulet * A;
                    break;
                case "B":
                    this.szamitottAdo = terulet * B;
                    break;
                default:
                    this.szamitottAdo = terulet * C;
                    break;
            }
            if (szamitottAdo >= 10000) fizetettAdo = szamitottAdo;*/

        }
        public int ado () // Metódus
        {
            int tmp = 0;
            switch (adosav)
            {
                case "A":
                    tmp = terulet * Program.A;
                    break;
                case "B":
                    tmp = terulet * Program.B;
                    break;
                default:
                    tmp = terulet * Program.C;
                    break;
            }
            if (tmp >= 10000) return tmp;
            return 0;
        }
    }
    internal class Program
    {
        public static int A, B, C; // Globalizálás
        static int ado(string adosav, int terulet) // Függvény
        {
            int tmp = 0;
            switch (adosav)
            {
                case "A":
                    tmp = terulet * A;
                    break;
                case "B":
                    tmp = terulet * B;
                    break;
                default:
                    tmp = terulet * C;
                    break;
            }
            if (tmp >= 10000) return tmp;
            return 0;
        }
        static void Main(string[] args)
        {
            // Adatok beolvasása
            StreamReader sr = new StreamReader("utca.txt", Encoding.UTF8);
            string[] adok = sr.ReadLine().Split(' ');
            A = int.Parse(adok[0]);
            B = int.Parse(adok[1]);
            C = int.Parse(adok[2]);
            List<epitmeny> telkek = new List<epitmeny>();
            while (!sr.EndOfStream)
            {
                telkek.Add(new epitmeny(sr.ReadLine(), A, B, C));
            }
            sr.Close();

            // 2. feladat
            Console.WriteLine($"2. feladat. A mintában {telkek.Count} telek szerepel.");

            // 3. feladat
            bool flag = false; // Nincs adat
            Console.Write($"3. feladat. Egy tulajdonos adószáma: ");
            string adoszam = Console.ReadLine();
            foreach (var item in telkek)
            {
                if (item.adoszam == adoszam)
                {
                    flag = true;
                    Console.WriteLine($"{item.utca} utca {item.hazszam}");
                }
            }
            if (!flag) Console.WriteLine("Nem szerepel az adatállományban."); // Ha nem találtam

            // 4. feladat
            Console.WriteLine(telkek[0].ado()); // Method

            Console.WriteLine(ado(telkek[0].adosav, telkek[0].terulet)); // Függvény

            // 5. feladat
            int Adb = 0, Bdb = 0, Cdb = 0;
            int Aosszeg = 0, Bosszeg = 0, Cosszeg = 0;
            SortedSet<string> utcak = new SortedSet<string>(); // 6. feladat
            HashSet<string> adoszamok = new HashSet<string>(); // 7. feladat
            foreach (var item in telkek)
            {
                utcak.Add(item.utca); // 6. feladat
                adoszamok.Add(item.adoszam); // 7. feladat
                switch (item.adosav)
                {
                    case "A":
                        Adb++;
                        Aosszeg += item.ado();
                        break;
                    case "B":
                        Bdb++;
                        Bosszeg += item.ado();
                        break;
                    default:
                        Cdb++;
                        Cosszeg += item.ado();
                        break;
                }
            }

            Console.WriteLine("5. feladat");
            Console.WriteLine($"A sávba {Adb} telek esik, az adó {Aosszeg} Ft.");
            Console.WriteLine($"B sávba {Bdb} telek esik, az adó {Bosszeg} Ft.");
            Console.WriteLine($"C sávba {Cdb} telek esik, az adó {Cosszeg} Ft.");


            // 6. feladat
            foreach (var item in utcak)
            {
                string utcaSav = "";
                foreach (var item1 in telkek)
                {
                    if (item == item1.utca && utcaSav == "") utcaSav = item1.adosav;
                    if (item == item1.utca && utcaSav != item1.adosav)
                    {
                        Console.WriteLine(item1.utca);
                        break;
                    }
                }

                // Ez ugyanaz
                HashSet<string> list = new HashSet<string>();
                foreach (var item1 in telkek)
                {
                    if (item == item1.utca) list.Add(item1.adosav);
                    if (list.Count > 1)
                    {
                        Console.WriteLine(item1.utca);
                        break;
                    }
                }

            }

            // 7. feladat
            StreamWriter sw = new StreamWriter("fizetendo.txt", false, Encoding.UTF8);
            foreach (var item in adoszamok)
            {
                int adoOssz = 0;
                foreach (var item1 in telkek)
                {
                    if (item == item1.adoszam) adoOssz += item1.ado();
                }
                    {
                        sw.WriteLine($"{item} {adoOssz}");
                     
                    }
                }

                sw.Close();



            Console.ReadKey();
        }
    }
}
