using System.Data.Entity.ModelConfiguration;

namespace EfConventionsExercise.EntitiesConfigurations
{
    public class GenreConfiguration : EntityTypeConfiguration<Genre>
    {
        public GenreConfiguration()
        {
            Property(g => g.Name)
                .HasMaxLength(255)
                .IsRequired();
        }
    }
}
