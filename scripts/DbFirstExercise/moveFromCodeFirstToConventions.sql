INSERT INTO VidzyEfConventions.dbo.Genres (Name) SELECT Name FROM VidzyCodeFirst.dbo.Genres
INSERT INTO VidzyEfConventions.dbo.Videos(Name, ReleaseDate, Classification, Genre_Id) SELECT Name, ReleaseDate, Classification, Genre_Id FROM VidzyCodeFirst.dbo.Videos