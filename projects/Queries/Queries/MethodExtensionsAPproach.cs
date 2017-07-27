using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Queries
{
    class MethodExtensionsApproach : IApproach
    {
        public void Main()
        {
            var context = new PlutoContext();

            //var courses = context.Courses.Where(c => c.Name.Contains("c#"));


            //var courses = context.Courses.Where(c => c.Name.Contains("c#")).OrderBy(c => c.Name).ThenBy(c => c.Level);
            //var courses = context.Courses.Where(c => c.Name.Contains("c#")).OrderByDescending(c => c.Name).ThenByDescending(c => c.Level);
            //var courses = context.Courses
            //    .Where(c => c.Name.Contains("c#"))
            //    .OrderByDescending(c => c.Name)
            //    .ThenByDescending(c => c.Level)
            //    .Select(c => new { CourseName = c.Name, AuthorName = c.Author.Name });
            //var courses = context.Courses
            //    .Where(c => c.Name.Contains("c#"))
            //    .OrderByDescending(c => c.Name)
            //    .ThenByDescending(c => c.Level)
            //    .Select(c => c.Tags);

            //foreach ( var c in courses)
            //{
            //    foreach(var tag in c)
            //    {
            //        Console.WriteLine(tag.Name);
            //    }
            //}
            //var tags = context.Courses
            //    .Where(c => c.Name.Contains("c#"))
            //    .OrderByDescending(c => c.Name)
            //    .ThenByDescending(c => c.Level)
            //    .SelectMany(c => c.Tags)
            //    .Distinct();

            //foreach (var tag in tags)
            //{
            //    Console.WriteLine(tag.Name);
            //}
            //var groups = context.Courses.GroupBy(c => c.Level);
            //foreach (var group in groups)
            //{
            //    Console.WriteLine("Key: " + group.Key);
            //    foreach (var course in group)
            //    {
            //        Console.WriteLine("\t" + course.Name);
            //    }
            //}

            //context.Courses.Join(context.Authors,
            //    c => c.AuthorId,
            //    a => a.Id,
            //    (course, author) => new
            //    {
            //        CourseName = course.Name,
            //        AuthorName = author.Name
            //    });

            //context.Authors.GroupJoin(context.Courses,
            //    a => a.Id,
            //    c => c.Id,
            //    (author, courses) =>
            //    new {
            //        AuthorName = author.Name,
            //        AmountOfCourses = courses.Count()
            //    });

            //context.Authors.SelectMany(a => context.Courses, (author, course) =>
            //new {
            //    AuthorName = author.Name,
            //    CourseName = course.Name
            //});
        }
    }
}
