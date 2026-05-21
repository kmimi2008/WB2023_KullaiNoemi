using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO; //kötelező

namespace FileKezeles
{
    internal class Program
    {
        class data
        {
            public int taxi_id; //objektumok
            public string indulas;
            public int idotartam;
            public double tavolsag;
            public double viteldij;
            public double borravalo;
            public string fizetes_modja;

            public data(string Line) //konstruktor
            {
                string[] sz = Line.Split(';'); //sor szétdarabolása, karakter típus --> ' '
                this.taxi_id = int.Parse(sz[0]);
                this.indulas = sz[1];
                this.idotartam = int.Parse(sz[2]);
                this.tavolsag = double.Parse(sz[3]);
                this.viteldij = double.Parse(sz[4]);
                this.borravalo = double.Parse(sz[5]);
                this.fizetes_modja = sz[6];
            }

            public override string ToString()
            {
                return $"Taxi ID: {taxi_id}\t Dátum: {indulas}\t Fizetés módja: {fizetes_modja}";
            }
        }
        static void Main(string[] args)
        {
            List<data> list = new List<data>();
            StreamReader sr = new StreamReader("fuvar.csv", Encoding.UTF8); //csatorna
            sr.ReadLine(); //fejlécet beolvasom és nem csinálok vele semmit --> nem lesz benne
            while (!sr.EndOfStream) //! --> amíg nincs vége
            {
                list.Add(new data(sr.ReadLine()));
            }
            Console.WriteLine("Kérek egy új sort: ");
            string sor = Console.ReadLine();

            list.Add(new data(sor));

            sr.Close();

            //a lista megjelenítése
            foreach (data item in list)
            {
                Console.WriteLine(item.ToString());
            }

            Console.ReadKey();
        }
    }
}
