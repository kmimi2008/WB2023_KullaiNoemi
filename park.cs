using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace park
{
    class data
    {
        public int kezdo;
        public int befejezo;
        public string szin;
        public data(string line)
        {
            this.kezdo = int.Parse(line.Split(' ')[0]);
            this.befejezo = int.Parse(line.Split(' ')[1]);
            this.szin = line.Split(' ')[2];
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            #region 1. feladat - Beolvasás
            string[] fileAdat = File.ReadAllLines("felajanlas.txt", Encoding.UTF8);
            List<data> adatok = new List<data>();
            int agyasokSz = int.Parse(fileAdat[0]);
            for (int i = 1; i < fileAdat.Length; i++)
            {
                adatok.Add(new data(fileAdat[i]));
            }

            #endregion

            #region 2. feladat - Felajánlások száma
            Console.WriteLine("2. feladat");
            Console.WriteLine($"A felajánlások száma: {adatok.Count}");


            #endregion

            #region 3. feladat - Bejárat bal és jobb oldali ágyások is
            Console.WriteLine("3. feladat");
            Console.Write($"A bejárat mindkét oldalán ültetők: ");
            int ii = 0;
            foreach (var item in adatok)
            {
                ii++;
                if (item.kezdo > item.befejezo || (item.kezdo == 1 && item.befejezo == agyasokSz))
                {
                   Console.Write($"{ii} ");
                }
            }

            #endregion

            #region 4. feladat - Sorszám bekérése
            Console.WriteLine("4. feladat");
            Console.Write($"Adja meg az ágyás sorszámát! ");
            int agyas = int.Parse(Console.ReadLine());
            int db = 0;
            foreach (var item in adatok) 
            {
                if (item.kezdo > item.befejezo && !(agyas < item.kezdo && agyas > item.befejezo)) db++;
                else if (agyas >= item.kezdo && agyas <= item.befejezo) db++;
            }
            Console.WriteLine($"A felajánlók száma: {db}");
            // 4.2
            ii = 0;
            //while (ii < adatok.Count && adatok[ii].kezdo != 1) ii++;
            while (
            ii < adatok.Count && !((adatok[ii].kezdo > adatok[ii].befejezo && !(agyas < adatok[ii].kezdo && agyas > adatok[ii].befejezo)) || (agyas >= adatok[ii].kezdo && agyas <= adatok[ii].befejezo))) ii++;

            HashSet<string> szinek = new HashSet<string>();
            foreach (var item in adatok)
            {
                if (item.kezdo > item.befejezo && !(agyas < item.kezdo && agyas > item.befejezo))
                {
                    db++;
                    szinek.Add(item.szin);
                }
                else if (agyas >= item.kezdo && agyas <= item.befejezo)
                {
                    db++;
                    szinek.Add(item.szin);
                }
                ii++;
            }
            
            if (ii == adatok.Count) Console.WriteLine("Ezt az ágyást nem ültetik be.");
            //else Console.WriteLine($"A virágágyás színe, ha csak az első ültet: {adatok[ii].szin}"); lemaradtam
            
            // 4.3
            if (szinek.Count != 0)
            {
                foreach (var item in szinek)
                {
                    Console.Write($"{item}");
                }
            }
            Console.WriteLine();
            #endregion

            #region 5. feladat - Melyik eset teljesül?
            bool[] lefedett = new bool[agyasokSz + 1];

            foreach (var item in adatok)
            {
                if (item.kezdo <= item.befejezo)
                {
                    for (int i = item.kezdo; i <= item.befejezo; i++)
                        lefedett[i] = true;
                }
                else
                {
                    for (int i = item.kezdo; i <= agyasokSz; i++)
                        lefedett[i] = true;
                    for (int i = 1; i <= item.befejezo; i++)
                        lefedett[i] = true;
                }
            }

            bool mindenAgyas = true;
            for (int i = 1; i <= agyasokSz; i++)
            {
                if (!lefedett[i])
                {
                    mindenAgyas = false;
                    break;
                }
            }

            if (mindenAgyas)
            {
                Console.WriteLine("Minden ágyás beültetésére van jelentkező.");
            }
            else
            {
                int osszesFelajanlottAgyas = 0;

                foreach (var item in adatok)
                {
                    int hossz;
                    if (item.kezdo <= item.befejezo)
                        hossz = item.befejezo - item.kezdo + 1;
                    else
                        hossz = (agyasokSz - item.kezdo + 1) + item.befejezo;

                    osszesFelajanlottAgyas += hossz;
                }

                if (osszesFelajanlottAgyas >= agyasokSz)
                    Console.WriteLine("Átszervezéssel megoldható a beültetés.");
                else
                    Console.WriteLine("A beültetés nem oldható meg.");
            }

            // Órai megoldás
            bool[] ultetve = new bool[agyasokSz];

            foreach (var item in adatok)
            {
                if (item.kezdo < item.befejezo) for (int i = item.kezdo; i <= item.befejezo; i++) ultetve[i + 1] = true;
                else{
                    for (int i = item.kezdo; i < agyasokSz; i++) ultetve[i - 1] = true;
                    for (int i = 0; i <= item.befejezo; i++) ultetve[i + 1] = true;
                }
            }


            int osszeg = 0;
            foreach (var item in adatok)
            {
                if (item.kezdo < item.befejezo) osszeg += item.befejezo - item.kezdo + 1;
                else osszeg += (item.befejezo + agyasokSz) - item.kezdo + 1;
            }
            
            //5.2
            if (osszeg >= agyasokSz) Console.WriteLine("Átszervezéssel megoldható a beültetés.");
            //5.3
            else Console.WriteLine("A beültetés nem oldható meg.");

            #endregion






            Console.ReadKey();
        }
    }
}
