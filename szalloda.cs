using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace szalloda2
{
    class data
    {
        public ushort sorszam; // 0 - 65535
        public byte szobaszam; // 0 - 255
        public ushort erkNap;
        public ushort tavNap;
        public byte vendegSzam;
        public byte reggeli;
        public string azonosito;

        public data(string line)
        {
            this.azonosito = "banán";

            try
            {
                string[] sz = line.Split(' ');

                // Nap sorszáma
                ushort tmp = ushort.Parse(sz[0]);
                if (tmp > 0 && tmp <= Program.maxSsz) this.sorszam = tmp;
                else return;

                // Szoba száma
                byte tmp1 = byte.Parse(sz[1]);
                if (tmp1 > 0 && tmp1 <= 27) this.szobaszam = tmp1;
                else return;

                // Érkezés napja
                tmp = ushort.Parse(sz[2]);
                if (tmp > 0 && tmp <= Program.maxNap) this.erkNap = tmp;
                else return;

                // Távozás napja
                tmp = ushort.Parse(sz[3]);
                if (tmp >= erkNap && tmp <= Program.maxNap) this.tavNap = tmp;
                else return;

                // Vendégek száma
                tmp1 = byte.Parse(sz[4]);
                if (tmp1 > 0 && tmp1 <= 3) this.vendegSzam = tmp1;
                else return;

                // Reggeli igen/nem
                tmp1 = byte.Parse(sz[5]);
                if (tmp1 >= 0 && tmp1 <= 1) this.reggeli = tmp1;
                else return;

                // Azonosító
                azonosito = sz[6];
                return;
            }
            catch (Exception)
            {
                return;
            }
        }
    }
    internal class Program
    {
        static public ushort maxSsz = 0;
        static public ushort maxNap = 0;

        static void Main(string[] args)
        {
            string[] honapok = File.ReadAllLines("honapok.txt", Encoding.UTF8);
            string[] fileAdat = File.ReadAllLines("pitypang.txt", Encoding.UTF8);

            try
            {
                maxSsz = ushort.Parse(fileAdat[0]);
            }
            catch (Exception)
            {
                Console.WriteLine("Hiba!");
                Console.ReadKey();
                return;
            }

            ushort[,] napok = new ushort[12, 3];
            for (int i = 0; i < honapok.Length; i += 3)
            {
                napok[i / 3, 0] = ushort.Parse(honapok[i + 1]);
                napok[i / 3, 1] = ushort.Parse(honapok[i + 2]);
                napok[i / 3, 2] = ushort.Parse(((int)napok[i / 3, 0] + (int)napok[i / 3, 1] - 1).ToString());
                if (maxNap < napok[i / 3, 2]) maxNap = napok[i / 3, 2];
            }

            List<data> adatok = new List<data>();
            foreach (var item in fileAdat)
            {
                data tmp = new data(item);
                if (tmp.azonosito != "banán") adatok.Add(tmp);
            }

            Console.WriteLine("2. feladat:");
            int maxIdo = 0;
            data maxFog = null;

            foreach (data d in adatok)
            {
                int ido = d.tavNap - d.erkNap;
                if (ido > maxIdo)
                {
                    maxIdo = ido;
                    maxFog = d;
                }
            }

            Console.WriteLine("{0} ({1}) – {2}", maxFog.azonosito, maxFog.erkNap, maxIdo);

            Console.WriteLine("3. feladat:");

            StreamWriter sw = new StreamWriter("bevetel.txt");

            int teljesBevetel = 0;

            foreach (data d in adatok)
            {
                int napokSzama = d.tavNap - d.erkNap;

                // Szobaár érkezés szerint
                int szobaAr = 0;
                if (d.erkNap >= napok[0, 0] && d.erkNap <= napok[0, 2]) szobaAr = 9000; // Tavasz
                else if (d.erkNap >= napok[1, 0] && d.erkNap <= napok[1, 2]) szobaAr = 10000; // Nyár
                else szobaAr = 8000; // Ősz

                int fizet = napokSzama * szobaAr;

                // Pótágyak
                if (d.vendegSzam > 2)
                    fizet += (d.vendegSzam - 2) * 2000 * napokSzama;

                // Reggeli
                if (d.reggeli == 1)
                    fizet += d.vendegSzam * 1100 * napokSzama;

                teljesBevetel += fizet;
                sw.WriteLine("{0}:{1}", d.sorszam, fizet);
            }

            sw.Close();

            Console.WriteLine("A szálloda teljes bevétele: {0}", teljesBevetel);


            Console.ReadKey();
        }
    }
}

