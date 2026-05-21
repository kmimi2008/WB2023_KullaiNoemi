using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace másodfokú
{
    internal class Program
    {
        static void Main(string[] args)

        {
            Console.WriteLine(" Írja be a másodkfokú egyenlet együtthatóit!");
            Console.Write("a:");
            double a = Convert.ToDouble(Console.ReadLine());
            Console.Write("b:");
            double b = Convert.ToDouble(Console.ReadLine());
            Console.Write("c:");
            double c = Convert.ToDouble(Console.ReadLine());

            double disz = b * b - 4 * a * c;
            if (disz < 0)
            {
                Console.WriteLine("Az egyenletnek nincs valós gyöke.");
            }
            else if (disz == 0)
            {
                Console.WriteLine("Az egyenletnek 1 valós gyöke van");
                double x = -b / (2 * a);
                Console.WriteLine($"x = {x}");


            }
            else
            {
                Console.WriteLine(" AZ egyenletnek 2 valós gyöke van");
                double x1 = (-b + Math.Sqrt(disz)) / (2 * a);
                double x2 = (-b - Math.Sqrt(disz)) / (2 * a);
                Console.WriteLine($"x1 = {x1}");
                Console.WriteLine($"x2 = {x2}");
            }
        }
    }
}
