using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tömbök_gyak
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] seb = new int[100];
            int i = 0;
            int s = 0;
            do
            {
                Console.WriteLine("Írd be a sebességeket:");
                s = Convert.ToInt32(Console.ReadLine());
                seb[i] = s;
                i++;

            } while (s != 0 && i < seb.Length);

            // Hány darab gyosrhajtó volt irányonként? (90 km/h óra felett)
            int poz = 0;
            int neg = 0;
            for (i =  0; seb[i] != 0; i++)
            {
                if (seb[i] > 90)
                {
                    poz++;
                }
                if (seb[i] < -90)
                {  
                    neg++;
                }
            }
            Console.WriteLine($"Kecskemét felé {poz}, Félegyháza felé {neg}");
            Console.WriteLine("--------------------------------------------------------------------------");
            //-Mennyi volt irányonként az átlagsebesség?
            int osszpoz = 0;
            int osszneg = 0;
            int dbpoz = 0;
            int dbneg = 0;

            for ( i = 0; seb[i] != 0; i++)
            {
                if (seb[i] > 0)
                {
                    osszpoz += seb[i];
                    dbpoz++;
                }
                else
                {
                    osszneg += seb[i];
                    dbneg++;
                }

            }

            double atlagpoz = (double) osszpoz / dbpoz;
            double atlagneg = (double) -osszneg / dbneg ;
            Console.WriteLine($"Kecsó felöl az átlag { atlagpoz: 0.00}, félegyháza felöl az átlag {atlagneg: 0.00}");

            Console.WriteLine("--------------------------------------------------------------------------");
            //-Hányadik autós ment a leggyorsabban?
            int maxke = 0;
            int maxike = 0;
            int maxki = 0;
            int maxiki = 0;
            for (i = 0;seb[i] != 0 ; i++)
            {
                if (seb[i] > maxke)
                {
                    maxke = seb[i];
                    maxike = i;

                }
                if (seb[i] < maxki)
                {
                    maxki = seb[i];
                    maxiki = i;
                }
            }
            Console.WriteLine($"Kecskemét felöl a leggyorsabb {maxke +1} és a {maxike}.ik, Félegyháza felöl a leggyorsabb {maxki +1} és a {maxiki}.ik");




        }
    }
}
