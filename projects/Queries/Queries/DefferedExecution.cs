using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Queries
{
    class DefferedExecution : IApproach
    {
        public void Main()
        {
            var context = new PlutoContext();

            //var courses = context.Courses;
            //var filtered = courses.Where(c => c.IsBeginnerCourse == true);
            //var sorted = filtered.OrderBy(c => c.Name);

            //var courses = context.Courses.Where(c => c.IsBeginnerCourse).OrderBy(c => c.Name); //not work without ToList()
            var courses = context.Courses.ToList().Where(c => c.IsBeginnerCourse).OrderBy(c => c.Name);

            foreach(var c in courses)
            {
                Console.WriteLine(c.Name);
            }
        }
    }
}
