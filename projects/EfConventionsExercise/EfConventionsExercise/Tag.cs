using System.Collections.Generic;

namespace EfConventionsExercise
{
    public class Tag
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public virtual List<Video> Videos { get; set; }
    }
}
