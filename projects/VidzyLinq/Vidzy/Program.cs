using System;
using System.Linq;

namespace Vidzy
{
    class Program
    {
        static void Main(string[] args)
        {
            Task5();
            
        }

        static void Task1()
        {
            var context = new VidzyContext();
            var moviesNames = context.Videos.Where(v => v.Genre.Name.Contains("Action")).OrderBy(v => v.Name).Select(v => v.Name);
            foreach (var name in moviesNames)
            {
                Console.WriteLine(name);
            }
        }

        static void Task2()
        {
            var context = new VidzyContext();
            var moviesNames = context.Videos.Where(v => v.Genre.Name.Contains("Drama") && v.Classification == Classification.Gold).OrderBy(v => v.ReleaseDate).Select(v => v.Name);
            foreach (var name in moviesNames)
            {
                Console.WriteLine(name);
            }
        }

        static void Task3()
        {
            var context = new VidzyContext();
            var movies = context.Videos.Select(v => new { Name = v.Name, Genre = v.Genre.Name });
            foreach (var item in movies)
            {
                Console.WriteLine("{0} - {1}", item.Name, item.Genre);
            }
        }

        static void Task4()
        {
            var context = new VidzyContext();
            var movies = context.Videos.OrderBy(v=>v.Classification).GroupBy(v => v.Classification);
            foreach (var item in movies)
            {                
                Console.WriteLine("Classification: {0}", item.Key.ToString());
                foreach(var movie in item)
                {
                    Console.WriteLine("\t" + movie.Name);
                }
            }
        }

        static void Task5()
        {
            var context = new VidzyContext();
            var movies = context.Videos.ToList().OrderBy(v => v.Classification.ToString()).GroupBy(v => v.Classification);
            foreach (var item in movies)
            {
                Console.WriteLine("{0} ({1})", item.Key.ToString(), item.Count());
            }
        }

        static void Task6()
        {
            var context = new VidzyContext();
            var movies = context.Genres.GroupJoin(context.Videos,
                m => m.Id,
                v => v.Id,
                (author, course) => new
                {
                    ActionName = author.Name,
                    VideoAmount = author.Videos.Count()
                }).OrderByDescending(m => m.VideoAmount);
            foreach (var item in movies)
            {
                Console.WriteLine("{0} ({1})", item.ActionName, item.VideoAmount);
            }
        }
    }

}
