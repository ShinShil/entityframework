using System;
using System.Collections.Generic;

namespace EfConventionsExercise
{
    public enum VideoClassification : Byte
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
        public int GenreId { get; set; }
        public virtual Genre Genre { get; set; }
        public virtual List<Tag> Tags { get; set; }
    }
}
