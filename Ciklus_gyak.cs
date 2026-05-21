using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ciklus_gyak
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // olvassunk be számokat, amíg 0 át nem írnak , majd írjuk ki a számok összegét
            Console.WriteLine(" Írj be egy számot: ");
            int szam = Convert.ToInt32(Console.ReadLine());
            int osszeg = szam;
             while (szam != 0)
            {
                Console.WriteLine(" Írj be egy számot: ");
                szam = Convert.ToInt32(Console.ReadLine());
                osszeg += szam;

            }
            Console.WriteLine($" A beírt számok összege: {osszeg} ");

            Console.WriteLine("_________________________________________________");
            //do while

            int ossz = 0;
            int a = 0;
            do
            {
                Console.WriteLine("Írj be egy számot: ");
                a = Convert.ToInt32(Console.ReadLine());
                ossz += a;

            } while (a != 0);
            Console.WriteLine($" A beírt számok összege: {ossz} ");


            Console.WriteLine("_________________________________________________");

            // generájunk 100 db 1 és 50 közé eső véletlen számot
            // írjuk ki hogy hány darab páros volt közöttük

            int val = 0;
            Random rnd = new Random();
            for (int i = 1;  i <= 100; i++)
            {
                
                int sz = rnd.Next(1, 51);
                Console.Write($"{sz}, ");
                if (sz % 2 == 0)
                {
                    val++;
                }


            }
            Console.WriteLine($"A generált számok között {val} darab páros szám van");

            Console.WriteLine("_________________________________________________");
            // olvassuk be egy osztály tanulóinak magasságát
            // a beolvasás végét -1 beírással jelezzük
            // írjuk ki a hanyadik tanuló a legmagasabb és hány cm magas

            int mag = 0; // magasság
            int ssz = 0; // sorszám
            int max = 0; //legnagyobb magasság
            int maxi = 0; // annak a sorszáma
            do
            {
                Console.Write("Magasság: ");
                mag = Convert.ToInt32(Console.ReadLine());
                ssz++;
                if (mag > max)
                {
                    max = mag;
                    maxi = ssz;
                }
            }while (mag != -1);

            Console.WriteLine($"A legmagasabb sorszáma {maxi} és magassága {max}");


            Console.WriteLine("_________________________________________________");

            // olvassunk be egy számot (n)
            // írjuk ki az első n db négyzet számot


            Console.WriteLine("Írj be egy számot: ");
            int n = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Az első {0} négyzetszám:", n);
            for (int i = 1; i <= n; i++)
            {
                Console.Write(i * i + " ");
            }














        }
    }
}
