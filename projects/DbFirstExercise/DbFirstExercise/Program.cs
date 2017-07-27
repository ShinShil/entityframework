using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFirstExercise
{
    class Program
    {
        static void Main(string[] args)
        {
            const int videoAmount = 3;
            for (int i = 0; i < videoAmount; ++i)
            {
                AddVideo();
            }
        }

        static void AddVideo()
        {
            using (var ctx = new VidzyDbContext())
            {
                try
                {
                    Console.Write("Enter genre name: ");
                    string genreName = Console.ReadLine();

                    if (ctx.Genres.SingleOrDefault(g => g.Name == genreName) == null)
                    {
                        ctx.Genres.Add(new Genre()
                        {
                            Name = genreName
                        });
                        ctx.SaveChanges();
                    }

                    Console.Write("Enter video name: ");
                    string videoName = Console.ReadLine();

                    Classification? classification;
                    Console.WriteLine("Chose classification: \n\t1 - Silver(defailt)\n\t2 - Gold\n\t3 - Platinum");
                    string choice = Console.ReadLine();
                    switch(choice)
                    {
                        case "2":
                            classification = Classification.Gold;
                            break;
                        case "3":
                            classification = Classification.Platinum;
                            break;
                        default:
                            classification = Classification.Silver;
                            break;
                    }

                    ctx.AddVideo(videoName, DateTime.Now, genreName, (byte)classification);
                }
                catch(Exception ex)
                {
                    Console.WriteLine("The error while adding video: " + ex.Message);
                }
            }
        }
    }
}
