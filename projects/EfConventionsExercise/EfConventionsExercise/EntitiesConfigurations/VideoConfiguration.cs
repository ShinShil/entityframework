﻿using System.Data.Entity.ModelConfiguration;

namespace EfConventionsExercise.EntitiesConfigurations
{
    public class VideoConfiguration : EntityTypeConfiguration<Video>
    {
        public VideoConfiguration()
        {
            Property(v => v.Name).IsRequired();

            HasRequired(v => v.Genre)
                .WithMany(g => g.Videos)
                .HasForeignKey(v => v.GenreId);

            HasMany(v => v.Tags)
                .WithMany(t => t.Videos)
                .Map(m =>
                {
                    m.ToTable("VideoTags");
                    m.MapLeftKey("VideoId");
                    m.MapRightKey("TagId");
                });

        }
    }
}
