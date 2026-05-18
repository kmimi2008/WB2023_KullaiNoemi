using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace hegyek
{
    internal class Program
    {
        class Hegy
        {
            public string Nev { get; set; }
            public string Hegyseg { get; set; }
            public int Magas { get; set; }

            public Hegy(string sor)
            {
                string[] darabok = sor.Split(';');
                Nev = darabok[0];
                Hegyseg = darabok[1];
                Magas = int.Parse(darabok[2]);
            }
        }
        static void Main(string[] args)
        {
            List<Hegy> hegyek = new List<Hegy>();
            string[] sorok = File.ReadAllLines("hegyekMO.txt");

            for (int i = 1; i < sorok.Length; i++)
            {
                Hegy h = new Hegy(sorok[i]);
                hegyek.Add(h);
            }

            Console.WriteLine($"Hegycsúcsok száma {hegyek.Count}");

            int osszeg = 0;

            foreach (var h in hegyek)
            {
                osszeg += h.Magas;
            }

            double atlag = (double)osszeg / hegyek.Count;
            Console.WriteLine($"A hegyek magasságának átlaga {atlag}");

            Hegy max = hegyek[0];

            foreach (var h in hegyek)
            {
                if (h.Magas > max.Magas)
                {
                    max = h;
                }
            }

            Console.WriteLine(max.Nev);
            Console.WriteLine(max.Hegyseg);
            Console.WriteLine(max.Magas);

            Console.WriteLine("Írjon be egy magasságot: ");
            int magas = int.Parse(Console.ReadLine());

            bool van = false;

            foreach (var h in hegyek)
            {
                if (h.Magas > magas && h.Hegyseg == "Börzsöny")
                {
                    van = true;
                    break;
                }
            }

            if (van)
            {
                Console.WriteLine("Van ennél nagyobb.");
            }
            else
            {
                Console.WriteLine("Nincs ennél nagyobb.");
            }

            double lab = 3.280839895;
            int db = 0;

            foreach (var h in hegyek)
            {
                if (h.Magas * lab > 3000)
                {
                    db++;
                }
            }

            Console.WriteLine($"A 3000 lábnál nagyobb hegyek száma: {db}");

            HashSet<string> hegysegek = new HashSet<string>();
            foreach (var h in hegyek)
            {
                hegysegek.Add(h.Hegyseg);
            }


            foreach (var hegyseg in hegysegek)
            {
                db = 0;
                foreach (var h in hegyek)
                {
                    if (h.Hegyseg == hegyseg)
                    {
                        db++;
                    }
                }
                Console.WriteLine($"{hegyseg} - {db}");
            }

            StreamWriter sw = new StreamWriter("bukk-videk.txt");
            sw.WriteLine("Hegycsúcs neve; Magasság láb");
            foreach (var h in hegyek)
            {
                if (h.Hegyseg == "Bükk-vidék")
                {
                    sw.WriteLine($"{h.Nev};{h.Magas * lab:0.0}");
                }
            }

            sw.Close();
        }
    }
}
