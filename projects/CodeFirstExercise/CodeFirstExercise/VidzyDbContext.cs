using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstExercise
{
    public class VidzyDbContext : DbContext
    {
        public VidzyDbContext()
            : base("name=DefaultConnection")
        {

        }

        public DbSet<Video> Videos { get; set; }
        public DbSet<Genre> Genres { get; set; }
    }
}
