using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace sebesseg
{
    public class Utszakasz
    {
        public int hossz;
        public string jel;
        public int megengedett_seb;
        public int sebesseg;

        public Utszakasz(string line, int seb)
        {
            string[] sz = line.Split(' ');
            this.hossz = int.Parse(sz[0]);
            this.jel = sz[1];
            if (jel.Length >= 4) this.megengedett_seb = 50; else this.megengedett_seb = 90;
                this.sebesseg = sebessegSzamitas(seb);
        }
        int sebessegSzamitas(int seb)
        {
            if (jel.Length >= 4) return 50; // 4 karakter vagy annál több 
            else if (jel == "]") return 90;
            else if (jel == "#" || jel == "%") return megengedett_seb;
            else return (int.Parse(jel));
        }
        
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            // 1. feladat: Letárolás

            List<Utszakasz> list = new List<Utszakasz>();
            StreamReader sr = new StreamReader("ut.txt", Encoding.UTF8);
            int teljes_tav = Convert.ToInt32(sr.ReadLine());
            int sebesseg = 90;
            while(!sr.EndOfStream)
            {
                list.Add(new Utszakasz(sr.ReadLine(), sebesseg));
            }
            sr.Close();



            // 2. feladat: Települések neve

            Console.WriteLine("2. feladat:\nA települések neve:");
            foreach (var item in list)
            {
                if(item.jel.Length >= 4) Console.WriteLine(item.jel);
            }


            // 3. feladat: Legalacsonyabb megengedett sebesség adott hosszon

            Console.WriteLine("3. feladat:\nAdja meg a vizsgált szakasz hosszát km-ben!");

            double tavolsag = 0;

            do
            {
                try
                {
                    tavolsag = double.Parse(Console.ReadLine());
                }
                catch (Exception)
                {
                    tavolsag = 0;
                }
            }

            while (!(tavolsag > 0 && tavolsag * 1000 <= teljes_tav));
            int legalacsonyabb = 90;
            int ii = 0;

            while (list[ii].hossz <= tavolsag * 1000)
            {
                if (list[ii].sebesseg <= legalacsonyabb) legalacsonyabb = list[ii].sebesseg;
                ii++;
            }

            Console.WriteLine($"Az első {tavolsag} km-en {legalacsonyabb} km/h volt a legalacsonyabb megengedett sebesség.");


            // 4. feladat: Településen belül lévő út százaléka

            double lakott = 0;
            int kezdet = 0;
            int lakott_hossz = 0;

            foreach (var item in list) 
            {
                if (item.jel.Length >= 4) kezdet = item.hossz;
                if (item.jel == "]") lakott_hossz += item.hossz - kezdet;
            }
            lakott = (double)lakott_hossz / (double)teljes_tav * 100;

            Console.WriteLine($"4. feladat:\nAz út {lakott:0.00} százaléka vezet településen belül.");


            // 5. feladat:

            Console.Write("5. feladat:\tAdja meg a település nevét: ");
            string telepules = Console.ReadLine();
            int tablak_szama = 0;
            int uthossz = 0;
            kezdet = 0; // Lenullázzuk újra

            foreach (var item in list)
            {
                if (item.jel == telepules && item.jel.Length >= 4)
                {
                    kezdet = item.hossz;
                    tablak_szama = 0;
                }

                if (item.jel.Length == 2) tablak_szama++;

                if (item.jel == "]" && kezdet != 0)
                {
                    uthossz = item.hossz - kezdet;
                    break;
                }
            }

            if (kezdet == 0) Console.WriteLine("Nincs ilyen település.");
            else Console.WriteLine($"A sebességkorlátozók száma: {tablak_szama}\n" +
                $"Az út hossza a településen belül: {uthossz}m.");


            // 6. feladat: 


            


            Console.ReadKey();
        }
    }
}
