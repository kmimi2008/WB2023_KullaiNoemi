using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace doga_2025_10_20
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] szamok = new int[70];
            Random rnd = new Random();
            for (int i = 0; i < szamok.Length; i++)
            {
                szamok[i] = rnd.Next(-40, 51);
                Console.Write($"{szamok[i]}, ");
            }
            Console.WriteLine();

            Console.WriteLine("------------------------------");
            Console.WriteLine("1.feladat: ");
            for (int i = 0; i < szamok.Length; i++)
            {
                if (szamok[i] % 4 == 0 && szamok[i] % 5 == 0)
                {
                    Console.WriteLine($"Az első 4-gyel és 5-tel osztható számok {szamok[i]} ");
                    break;
                }
            }
            Console.WriteLine("------------------------------");
            Console.WriteLine("2.feladat: ");
            bool szam = false;
            for (int i = 0; i < szamok.Length; i++)
            {
                if (szamok[i] < -10 && szamok[i] > -30)
                {
                    szam = true;
                        
                }
            }
            if (szam == false)
            {
                Console.WriteLine("Nincs olyan szám ami -10-nél kisebb de -30-nál nagyobb");
            }
            else
            {
                Console.WriteLine("Van olyan szám ami -10-nél kisebb de -30-nál nagyobb");
            }

            Console.WriteLine("------------------------------");
            Console.WriteLine("3.feladat: ");
            int db = 0;
            for(int i = 0;i < szamok.Length;i++)
            {
                if (szamok[i] < 30)
                {
                    db++;
                }
                
            }
            Console.WriteLine($"{db} db 30-nál nagyobb szám van a sorban");

            Console.WriteLine("------------------------------");
            Console.WriteLine("4.feladat: ");
            int mini = 0;
            for(int i = 0;i <szamok.Length;i++)
            {
                if (szamok[i] > 0 && szamok[i] < szamok[0] )
                {
                    mini = i;
                }
            }
            Console.WriteLine($"A legkisebb szám indexe {mini}");

            Console.WriteLine("------------------------------");
            Console.WriteLine("5.feladat: ");
            bool van = false;
            for(int i = 0; i<  szamok.Length; i ++)
            {
                if (szamok[i + 1] > szamok[i] && szamok[i - 1] > szamok[i])
                {
                    van = true;
                    break;
                }
            }
            if (van == false)
            {
                Console.WriteLine("A számok között nincs olyan szám ami az előtte is és az utána álló szám is nagyobb lenne ");

            }
            else
            {
                Console.WriteLine("A számok között van olyan szám ami az előtte is és az utána álló szám is nagyobb lenne ");
            }
        }
    }
}
