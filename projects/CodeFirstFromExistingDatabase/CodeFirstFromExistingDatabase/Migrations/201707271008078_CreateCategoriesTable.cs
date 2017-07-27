namespace CodeFirstFromExistingDatabase.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CreateCategoriesTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: false),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);

            Sql("INSERT INTO Categories(Id, Name) VALUES(1, 'WebDevelopment')");
            Sql("INSERT INTO Categories(Id, Name) VALUES(2, 'Programming Languages')");
        }

        public override void Down()
        {
            DropTable("dbo.Categories");
        }
    }
}
