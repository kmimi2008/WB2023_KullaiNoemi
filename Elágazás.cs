using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace elágazás
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //két beolvasott számról döntsük el, hogy melyik a nagyobb

            Console.WriteLine(" Első szám: ");
                   int a =   Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(" Második szám: ");
                int b = Convert.ToInt32(Console.ReadLine());
            if (a > b)
            {
                Console.WriteLine(" Az elsö szám a nagyobb");
            }

            else if (b > a)
            {
                Console.WriteLine(" A második szám a nagyobb");
            }

            else 
            {
                Console.WriteLine(" A két szám egyenlő");



            }

            Console.WriteLine("Írj be egy számot");
            int szam = Convert.ToInt32(Console.ReadLine());

            if (szam > 0) 
            {
                Console.WriteLine(" A szám pozitív");

            }
            else if (szam < 0)
            {
                Console.WriteLine("A szám negatív");
            }
            else
            {
                Console.WriteLine("A szám nulla, így lehet pozitív és negatív");
            }

            // olvassunk be egy órát és köszönjünk a napszaknak megfelelően

            Console.WriteLine("Írj be egy órát");
            int szam1 = Convert.ToInt32(Console.ReadLine());


            if (szam1 < 0 || szam1 > 23)
            {
                Console.WriteLine("nincs ilyen te idióta");
            }
            else if (szam1 >= 6 && szam1<=10 ) 
            {
                Console.WriteLine("Jóreggelt!");
            }
            else if (szam1 >= 11 && szam1 <= 16 ) 
            {
                Console.WriteLine("Jó napot!");

            }
            else if (szam1 >= 17 && szam1 <= 22)
            {
                Console.WriteLine("Jó estét");
            }
            else
            {
                Console.WriteLine("Jó éjszakát!");
            }



            //olvassuk be egy dolgozat pontszámát, számolhjuk ki hogy hány százalék lett és írjuk ki a jegyet
            Console.WriteLine(" Pontszám: ");
            int jegy = Convert.ToInt32(Console.ReadLine());
            double ossz = (((double)jegy / 50) * 100);
            if (ossz < 40)
            {
                Console.WriteLine($"{ossz}%-ot ért el így 1");
            }
            if (ossz >= 40 && ossz < 50)
            {
                Console.WriteLine($"{ossz}%-ot ért el így 2");
            }
            if (ossz >=50 && ossz <60)
            {
                Console.WriteLine($"{ossz}%-ot ért el így 3");
            }
            if (ossz >= 60 && ossz < 80)
            {
                Console.WriteLine($"{ossz}%-ot ért el így 4");
            }
            if (ossz >=80 && ossz < 100)
            {
                Console.WriteLine($"{ossz}%-ot ért el így 5");
            }


            //olvassuk be egy háromszög 3 oldalát, és döntsük el, hogy szerkeszthető-e
            Console.WriteLine("A háromszög első oldala: ");
            int hsz1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("A háromszög második oldala: ");
            int hsz2 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("A háromszög harmadik oldala: ");
            int hsz3 = Convert.ToInt32(Console.ReadLine());

            if (hsz1 + hsz2 > hsz3 && hsz1 + hsz3 > hsz2 && hsz2 + hsz3 > hsz1)
            {
                Console.WriteLine("A háromszög szerkeszthető");
            }
            else
            {
                Console.WriteLine("A háromszög nem szerkeszthető");
            }


            // olvassuk be egy télalap két oldalát és egy kör sugarát
            // írjuk ki a kerületüket és területüket
            // írjuk ki hogy melyik a nagyobb

            
            Console.WriteLine("A téglalap második oldala: ");
            int tg2 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("A kör sugara: ");
            int sug = Convert.ToInt32(Console.ReadLine());

            int ker = 2 *(tg1  + tg2);
            int ter = tg1 * tg2;
            int kker = (sug * 2) * 3,14;
            int kter = 2 * sug * 3,14;




        }







    }
}
