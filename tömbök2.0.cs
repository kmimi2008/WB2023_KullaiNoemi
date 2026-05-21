using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tömbök2._0
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] szamok = new int[50];
            Random rnd = new Random();
            for(int i = 0; i < szamok.Length; i++)
            {
                szamok[i] = rnd.Next(-60,101);
                Console.Write($"{szamok[i]}, ");
            }
            Console.WriteLine();

            long szorzat = 1;
            for(int i = 0; i < szamok.Length; i++)
            {
                szorzat *= szamok[i];
            }
            Console.WriteLine($"1.feladat: {szorzat}");

            Console.WriteLine("2.feladat: ");
            for(int i = 0;i < szamok.Length -1; i++)
            {
                if (szamok[i] % 5 == 0 || szamok[i] % 7  == 0)
                {
                    Console.WriteLine($"Az utolsó 5-tel vagy 7-tel osztható indexe:{i}");
                    break;
                }
            }
            Console.WriteLine("3.feladat: ");
            for(int i = 0;i < szamok.Length; i++)
            {
                if (szamok[i] % 3 == 0 && szamok[i] % 7  == 0)
                {
                    Console.WriteLine($"Az első 3-tel és 7-tel osztható indexe:{i}");
                    break;
                }
            }

            Console.WriteLine("4.feladat: ");
            bool mindnegativ = true;
            for(int i = 0;i<szamok.Length;i++)
            {
                if (szamok[i]>= 0)
                {
                    mindnegativ = false;
                    break; 
                }
            }
            if (mindnegativ == true)
            {
                Console.WriteLine("Mindegyik negatív");
            }
            else
            {
                Console.WriteLine("Mindegyik pozitiv");
            }

            Console.WriteLine("5.feladat: ");
            bool sz = true;
            for(int i = 0; i < szamok.Length; i++)
            {
                if (szamok[i] >= 1 && szamok[i]<=10)
                {
                    sz = false;
                }
            }
            if (sz == true)
            {
                Console.WriteLine("Nincs közte");
            }
            else
            {
                Console.WriteLine("Van közte");
            }

            Console.WriteLine("6.feladat:");
            int db = 0;
            for(int i = 0; i < szamok.Length; i++)
            {
                if (szamok[i] % 18 ==0)
                {
                    db++;
                }
            }
            Console.WriteLine($"{db} db 18-cal osztható szám van");

            Console.WriteLine("7.feladat: ");
            int min = szamok[0];
            int mini = 0;
            for(int i = 0; i < szamok.Length;i++)
            {
                if (szamok[i] < min)
                {
                    min = szamok[i];
                    mini = i;
                }
            }
            Console.WriteLine($"A legkisebb szám {min} és az indexe {mini}");

            Console.WriteLine("9.feladat: ");
            bool van = false;
            for( int i = 0;i < szamok.Length -1 ;i++)
            {
                if (szamok[i] < 0 && szamok[i + 1] > 0 && szamok[i-1] > 0)
                {
                    van = true;
                    break;

                }
            }
            if(van == true)
            {
                Console.WriteLine("van ilyen szam");
            }
            else
            {
                Console.WriteLine("nincs ilyen szam");
            }

        }
    }
}
