using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ciklusok
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // írjuk ki 1-10 ig a számokat
            for (int i = 1; i <= 10; i ++ ) 
            {
                Console.WriteLine(i);
            }


            Console.WriteLine("______________________________________________________________________________________");


            // írjuk ki  2-től 100ig a páros számokat

            for (int i = 2; i <= 100; i += 2 ) 
            {
                Console.WriteLine(i);
            }
            Console.WriteLine("______________________________________________________________________________________");


            // írjuk ki 50 től 0 ig csökkenő sorrendben a számokat

            for (int i = 50; i >= 0; i -- )
            {
                Console.WriteLine(i);
            }
            Console.WriteLine("______________________________________________________________________________________");

            //olvassunk be egy egész számot és írjuk ki az osztóit:
            Console.WriteLine("Írjon be egy számot: ");

            int szam = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("A szám osztói:");
            Console.Write("1, ");
            for (int i = 2; i <= szam / 2; i ++)
            {
                if (szam % i == 0)
                    { 
                        Console.Write($"{i}, "); 
                    }   
            }
            Console.Write(szam);
            Console.WriteLine();


            Console.WriteLine("______________________________________________________________________________________");

            // olvassunk be számokat addig míg 6 ot nem írnak
            Console.WriteLine(" Írj be egy számot: ");
            szam = Convert.ToInt32(Console.ReadLine());
            while (szam != 6) 
            {
                Console.WriteLine(" Írj be egy számot: ");
                szam = Convert.ToInt32(Console.ReadLine());

            }
            Console.WriteLine("Eltaláltad!");

            Console.WriteLine("______________________________________________________________________________________");

            // ugyan ez hátul tesztelő ciklussal
            do
            {
                Console.WriteLine(" Írj be egy számot: ");
                szam = Convert.ToInt32(Console.ReadLine());
            } while (szam != 6);
            Console.WriteLine("Eltaláltad!");
            Console.WriteLine("______________________________________________________________________________________");











        }
    }
}
