using System;
using System.Linq;

namespace Queries
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new PlutoContext();

            //var query =
            //    from c in context.Courses
            //    where c.Author.Id == 1
            //    orderby c.Level descending, c.Name
            //    select new { Name = c.Name };
            ///////////////////////////////////////////////////////
            //var query =
            //    from c in context.Courses
            //    group c by c.Level
            //    into g
            //    select g;
            //
            //foreach(var group in query)
            //{
            //    Console.WriteLine("{0} ({1})", group.Key, group.Count());
            //    //foreach (var course in group)
            //    //{
            //    //    Console.WriteLine("\t{0}", course.Name);
            //    //}
            //}
            ////////////////////////////////////////////////////////
            //var query =
            //    from c in context.Courses
            //    join a in context.Authors on c.AuthorId equals a.Id
            //    select new { CourseName = c.Name, AuthorName = a.Name };
            ////////////////////////////////////////////////////////
            //var query =
            //    from a in context.Authors
            //    join c in context.Courses on a.Id equals c.AuthorId into g
            //    select new { AuthorName = a.Name, Courses = g.Count() };

            //foreach(var x in query)
            //{
            //    Console.WriteLine("{0} ({1})", x.AuthorName, x.Courses);
            //}
            ////////////////////////////////////////////////////////
            var query =
                from c in context.Courses
                from a in context.Authors
                select new { AuthorName = a.Name, CourseName = c.Name };

            foreach(var x in query)
            {
                Console.WriteLine("{0} - {1}", x.AuthorName, x.CourseName);
            }
        }
    }
}
