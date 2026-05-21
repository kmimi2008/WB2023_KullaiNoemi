using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace FileKezeles2
{
    internal class Program
    {
        class data
        {
            public int hour;
            public int minute;
            public int card;
            public string in_out;

            public data(string Line) 
            {
                string[] door = Line.Split();
                this.hour = int.Parse(door[0]);
                this.minute = int.Parse(door[1]);
                this.card = int.Parse(door[2]);
                this.in_out = door[3];
            }

            public override string ToString() 
            {
                return $"Óra: {hour}\t Perc: {minute}\t Kártya száma: {card}\t Ki/be lépett az ajtón? {in_out}";
            }
        }
        static void Main(string[] args)
        {
            List<data> list = new List<data>();
            StreamReader sr = new StreamReader("ajto.txt", Encoding.UTF8);

            while (!sr.EndOfStream) 
            {
                list.Add(new data(sr.ReadLine()));
            }

            sr.Close();

            foreach (data item in list)
            {
                Console.WriteLine(item.ToString());
            }

            

            Console.ReadKey();
        }
    }
}
