using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace alapokValtozokMegMinden
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Hello");
            Console.WriteLine("Hello");

            // string, int/long/uint, double/float, boole, char

            string szoveg = "Béla";
            Console.WriteLine($"Helló, {szoveg}!");

            Console.Write("Kérek egy nevet: ");
            szoveg = Console.ReadLine();

            Console.WriteLine($"Helló, {szoveg}!");

            int kor = 0;
            do
            {
                Console.Write($"Kérem {szoveg} korát: ");
                try
                {
                    kor = int.Parse(Console.ReadLine());
                    //int kor2 = Convert.ToInt32(Console.ReadLine()); //ugyanaz a kettő
                }
                catch (Exception)
                {
                    Console.WriteLine("Hibás adat.");
                }
            } while (kor < 1 || kor > 21);

            Console.WriteLine($"{szoveg} {kor} éves.");


            Console.ReadKey();
        }
    }
}
