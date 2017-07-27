using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirstExercise
{
    public enum VideoClassification
    {
        Silver = 1,
        Gold = 2,
        Platinum = 3
    }
    public class Video
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime ReleaseDate { get; set; }
        public VideoClassification Classification { get; set; }
        public virtual Genre Genre { get; set; }
    }
}
