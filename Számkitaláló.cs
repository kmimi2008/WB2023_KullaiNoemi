using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Szamkitalalo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int e = 1; // intervallum eleje
            int u = 1000; // intervallum vége
            int k = (e + u) / 2; //intervallum közepe
            int lepes = 0;
            Console.WriteLine($"Gondolj egy számra{e} és {u} között");
            while (true)
            {
                Console.WriteLine($"A gondolt szám a {k} (i/n)");
                string valasz = Console.ReadLine();
                valasz = valasz.ToLower(); // kisbetűs
                lepes++;
                if ( lepes > 10 )
                {
                    Console.WriteLine("Hazudsz te köcsög");
                    break;
                }

                if (valasz == "i" || valasz == "igen")
                {
                    Console.WriteLine($"Kitaláltam HAHAHAHAHHA, a szám {k} ");
                    break;
                }
                else 
                {
                    Console.WriteLine($"A gondolt szám nagyobb mint {k} (i/n)");
                    valasz = Console.ReadLine().ToLower();
                    if (valasz == "i" || valasz == "igen")
                    {
                        e = k + 1;
                    }
                    else
                    {
                        u = k - 1;
                    }
                    k = (e + u) / 2;

                }

            }
        }
    }
}
