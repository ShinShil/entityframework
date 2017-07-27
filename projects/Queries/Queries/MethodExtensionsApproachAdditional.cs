using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Queries
{
    class MethodExtensionsApproachAdditional : IApproach
    {
        public void Main()
        {
            var context = new PlutoContext();

            //var page2 = context.Courses.Skip(10).Take(10);

            //context.Courses.OrderBy(c => c.Level).FirstOrDefault(c => c.FullPrice > 100); //or First()
            //context.Courses.SingleOrDefault(c => c.Id == 1);

            //var allAbove10 = context.Courses.All(c => c.FullPrice > 10);
            //context.Courses.Any(c => c.Level == 1);

            //var count = context.Courses.Count();
            //var mostExpensive = context.Courses.Max(c => c.FullPrice);
            //var leastExpensive = context.Courses.Min(c => c.FullPrice);
            //var avgPrice = context.Courses.Average(c => c.FullPrice);
            //var mostExpensiveFirstLevel = context.Courses.Where(c => c.Level == 1).Max(c => c.FullPrice);
        }
    }
}
