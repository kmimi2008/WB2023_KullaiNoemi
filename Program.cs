using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace _0305
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[,] szamok = new int[10, 10];
            Random rnd = new Random();

            for (int i = 0; i < 10; i++)
            {
                for (int j = 0; j < 10; j++)
                {
                    szamok[i, j] = rnd.Next(1, 100);
                }
            }

            Console.WriteLine("Eredeti számok:");
            for (int i = 0; i < 10; i++)
            {
                for (int j = 0; j < 10; j++)
                {
                    Console.Write(szamok[i, j].ToString().PadLeft(3) + " ");
                }
                Console.WriteLine();
            }
            Console.WriteLine();

           
            for (int k = 1; k <= 4; k++)
            {
                int[,] elforgatott = new int[10, 10];

                for (int i = 0; i < 10; i++)
                {
                    for (int j = 0; j < 10; j++)
                    {
                        elforgatott[j, 9 - i] = szamok[i, j];
                    }
                }

                szamok = elforgatott;

                

                Console.WriteLine($"{k}. elforgatás:");
                for (int i = 0; i < 10; i++)
                {
                    for (int j = 0; j < 10; j++)
                    {
                        Console.Write(szamok[i, j].ToString().PadLeft(3) + " ");
                    }
                    Console.WriteLine();
                }
                Console.WriteLine();
            }



            Console.ReadKey();
        }
    }
}
