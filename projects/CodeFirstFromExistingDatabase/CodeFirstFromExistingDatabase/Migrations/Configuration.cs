namespace CodeFirstFromExistingDatabase.Migrations
{
    using System;
    using System.Collections.ObjectModel;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<CodeFirstFromExistingDatabase.PlutoContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            /*
             * this.MigratinNamespace...
             * */
        }

        protected override void Seed(CodeFirstFromExistingDatabase.PlutoContext context)
        {
            context.Authors.AddOrUpdate(a => a.Name,
                new Author()
                {
                    Name = "Author1",
                    Courses = new Collection<Course>()
                    {
                        new Course()
                        {
                            Name = "Author1 course",
                            Description = "Description"
                        }
                    }
                });
        }
    }
}
