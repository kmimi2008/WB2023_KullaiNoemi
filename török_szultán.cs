using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace török_szultán
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool[] borton = new bool[401];
            for (int i = 1; i <= 400; i++)
            {
                borton[i] = false;
            }
            for (int i = 1; i <= 400; i++)
            {
                for(int j = i; j <= 400; j += i)
                {
                    if (borton[j] == false)
                    {
                        borton[j] = true;
                    }
                    else
                    {
                        borton[j] = false;
                    }
                    //borton[j] = !borton[j];

                }


            }
            for(int i = 1;i <= 400; i++)
            {
                if (borton[i])
                {
                    Console.WriteLine(i);
                }
            }
        }
    }
}
