/*
   26 июля 2017 г.21:04:19
   User: 
   Server: localhost\mssqlserver01
   Database: DatabaseFirstDemo
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Posts
	(
	PostID int NOT NULL,
	DatePublished smalldatetime NOT NULL,
	Title varchar(500) NOT NULL,
	Body varchar(8000) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Posts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
