using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kő_papír_olló
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to rock-paper-scissors 3000!");
            Console.WriteLine("____________________________________");
            Console.WriteLine("Choose your destiny! (Rock/Paper/Scissor): ");
            string player = Console.ReadLine();
            player = player.ToLower();
            if (player != "rock" && player != "paper" && player != "scissor")
            {
                Console.WriteLine("you're stupid as fuck");
            }
            else
            {
                Random rnd = new Random(); // véletlen szám objektum
                int comp = rnd.Next(1, 4); // 1 ÉS 3 közötti véletlen szám
                string computer = "";
                if (comp == 1) 
                {
                     computer = "rock";

                }
                else if (comp == 1)
                {
                     computer = "paper";

                }
                else
                {
                     computer = "scissor";
                }

                if (player == computer)
                {
                    Console.WriteLine("DRAW ;)");
                }
                else if (player == "rock" && computer == "scissor")
                {
                    Console.WriteLine("You win");
                }
                else if (player == "paper" && computer == "rock")
                {
                    Console.WriteLine("You win");
                }
                else if (player == "scissor" && computer == "paper")
                {
                    Console.WriteLine("You win");
                }
                else
                {
                    Console.WriteLine("You lost");
                }

            }
        }
    }
}
