using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DbFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            PlutoDbContext plutoDb = new PlutoDbContext();
            var courses = plutoDb.GetCourses();
 
            foreach(var c in courses)
            {
                Console.WriteLine(c.Title);
            }
        }
    }
}
