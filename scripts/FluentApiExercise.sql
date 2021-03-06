﻿DECLARE @CurrentMigration [nvarchar](max)

IF object_id('[dbo].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [dbo].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'EfConventionsExercise.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF @CurrentMigration IS NULL
    SET @CurrentMigration = '0'

IF @CurrentMigration < '201707271722439_InitialModel'
BEGIN
    CREATE TABLE [dbo].[Genres] (
        [Id] [int] NOT NULL IDENTITY,
        [Name] [nvarchar](max),
        CONSTRAINT [PK_dbo.Genres] PRIMARY KEY ([Id])
    )
    CREATE TABLE [dbo].[Videos] (
        [Id] [int] NOT NULL IDENTITY,
        [Name] [nvarchar](max),
        [ReleaseDate] [datetime] NOT NULL,
        [Classification] [int] NOT NULL,
        [Genre_Id] [int],
        CONSTRAINT [PK_dbo.Videos] PRIMARY KEY ([Id])
    )
    CREATE INDEX [IX_Genre_Id] ON [dbo].[Videos]([Genre_Id])
    ALTER TABLE [dbo].[Videos] ADD CONSTRAINT [FK_dbo.Videos_dbo.Genres_Genre_Id] FOREIGN KEY ([Genre_Id]) REFERENCES [dbo].[Genres] ([Id])
    CREATE TABLE [dbo].[__MigrationHistory] (
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
        CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
    )
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201707271722439_InitialModel', N'EfConventionsExercise.Migrations.Configuration',  0x1F8B0800000000000400ED59DB6EE336107D2FD07F10F4D41659CB4E5EDAC0DE45EA240BA39B0BA224E85B404B63872845A92415D82DFA657DE827F5173AD4CD14293B7236BB5BA0C5020B8B9C19CEE5702ECCDF7FFE357EB74A98F70442D2944FFCD160E87BC0A334A67C39F173B578F3BDFFEEEDD75F8DCFE264E5DDD774479A0E39B99CF88F4A65C74120A34748881C243412A94C176A10A54940E234381C0E7F0846A30050848FB23C6F7C93734513283EF0739AF2083295137691C6C064B58E3B6121D5BB2409C88C4430F1A748714E8554672B101195E07B278C12542404B6F03DC279AA8842358FEF24844AA47C1966B840D8ED3A03A45B10A6B90AF58F37E47D2D191E6A4B820D632D2ACAA54A933D058E8E2AD70436FB8B1CEC37AE43E79DA193D55A5B5D3870E2BF072ED072FBA4E329139AAAC3B98382E5C03B5B608C9E806B72596F1E348040DCE87F07DE34672A1730E1902B41D881779DCF198D7E82F56DFA0BF009CF193375442D71AFB5804BD722CD40A8F50D2C2ACD67B1EF056DBEC0666CD80C9ED2AC19574787BE7789879339830602860B42950A4063411005F135510A04D732A070A273BA7596FEBF3E0D3187B7C7F72EC8EA03F0A57A9CF8F8D3F7CEE90AE27AA5D2E08E53BC6CC8A4440EED43C6C1267E3BA37A4F6348F78B6AC1F27F54BF4054DD436E800191708A1AD667E9DFB7549FED18B75BD6941129E982465506A954C7C45886DCDE7F4EFC2579A2CB82D63AA8CA24A87BB12B1F69669EF350ED9F8B34B949590DD272F9214C731169635377EF968825A8BE37214FEC7B605B3893E78C2C37597FEF5BD216F8CA7706911283606B449689E976102E209983A88C0C29C36AED7BF784E5F8397242D6A27E9FB2B8A13DDC4D7BAD43891E6DE88FDC2894FE36174FA44C235AF8C60C430580F671673CF676A0C1C22A5E357421CDD06918FB89FF9DA37EB7BC1A4186BC0A8D6D79C3C160645B6858E3A65C8CBB2294370EC3437F5B9FCEF532AC5407B4B0FFA8D025AB5460EBAFC586A0CC4B257D6F83F6B6FE8EF96DF6C2095DEC953B2D76C3564B467D7B0D8A8ECB6DA7F7DDD16D94DDE819F49350C7D390503BCAAE1D6D933A324813C24D8719942D66DD8A065B7AD1F105C932BCA6466F5AAD7861D598BE09F76FD992524610C98ECEADD1B63909CB195982B56BA42E2C1C644E749E9BC689436601760B9AEAC35A9874435563AC26D7BFAB22D4DD44DA32361E3C47A312CCA8857D60C7D9E52BE602C288E8680DA629CB13BEADBDD8C55D167B93BF5C71258C034B71DB3B81E31E0BA8B6B37B85A2BA371F178A3217EC1F8A2D7C5F3A14DB24B49A2A53506BA3BF3CBBAD3045DA7B9F1F30EDBCD7819A3AA33F8B8C9AB057F875C2B6FCD491B85D6FF4424C29A30B37DA1BCDB9FBA95455A317AAB4B7329869635AB44633A95BEDA60BED63A85DCEDCC83B55CD266970D75437AB8A8DAB8AB2C7B34B5D624A12DF43DB9FD0C3585EC2B554900C34C120FC954D1945A46F082E08A70B90AA6C7FFDC3E1E8D07ABAF9F73CA30452C6ACCF5BCA671F7AA976E9B363ED9E63A339E7F22722A24722BE49C8EA5B53D247BF50FCA77DD56BEE8FF1B77ABDB9BFB07F4F499B6C64C870269B198EADAB89FF7BC174ECCD7E7EA8F90EBC2B8197FDD81B7A7FBC0C3D2F9B288D02B7DFD0E7CE1D2F194511B22034A208C36C2C71E2A76E95BF1694473423ACA5B35B8CFADC03EDBF469EBD730A19700DF096597D0EDA55751BA9D6857CCEF63DC76A7798E931356F1F9ACB3A85776BAE035B8271CBFCD839506F9FA7BB2477CFB69F70D66E596F0C4DCF4ED7EE48FE69E669B7C340C4187FFE41B04ABADC88D04D1387A885958666C617690D5A4BA39AC4CA6717A008A6557222145D9048E17604982BF5536EF5CE7596CC219EF1AB5C65B942932199B3D6D3B086FEAEF38B4783B6CEE3ABAC78207C0D13504DAA2BC315FF31A7C67BDEB99BCFB789D077AAAA813A964AD7C2E5BA917499F29E822AF735A9E016928CA13079C543F2042FD1ED4EC2075892685D378ADB853C1F88B6DBC7A7942C0549642563C38F9F88E13859BDFD07D834E01A051D0000 , N'6.1.3-40302')
END

IF @CurrentMigration < '201707271738401_FixConventions'
BEGIN
    IF object_id(N'[dbo].[FK_dbo.Videos_dbo.Genres_Genre_Id]', N'F') IS NOT NULL
        ALTER TABLE [dbo].[Videos] DROP CONSTRAINT [FK_dbo.Videos_dbo.Genres_Genre_Id]
    IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Genre_Id' AND object_id = object_id(N'[dbo].[Videos]', N'U'))
        DROP INDEX [IX_Genre_Id] ON [dbo].[Videos]
    EXECUTE sp_rename @objname = N'dbo.Videos.Genre_Id', @newname = N'GenreId', @objtype = N'COLUMN'
    ALTER TABLE [dbo].[Genres] ALTER COLUMN [Name] [nvarchar](255) NOT NULL
    ALTER TABLE [dbo].[Videos] ALTER COLUMN [Name] [nvarchar](max) NOT NULL
    ALTER TABLE [dbo].[Videos] ALTER COLUMN [Classification] [tinyint] NOT NULL
    ALTER TABLE [dbo].[Videos] ALTER COLUMN [GenreId] [int] NOT NULL
    CREATE INDEX [IX_GenreId] ON [dbo].[Videos]([GenreId])
    ALTER TABLE [dbo].[Videos] ADD CONSTRAINT [FK_dbo.Videos_dbo.Genres_GenreId] FOREIGN KEY ([GenreId]) REFERENCES [dbo].[Genres] ([Id]) ON DELETE CASCADE
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201707271738401_FixConventions', N'EfConventionsExercise.Migrations.Configuration',  0x1F8B0800000000000400ED59DB6EE336107D2FD07F10F4D416592B76B0401BD8BBC83AC9C2D8CD055112F42DA0A5B14394A2549232EC16FDB23EF493FA0B1D4A942C5192633BC9F6822240609373E3CC99E10CFDE7EF7F0CDF2F23E62C40481AF391DBEF1DBA0EF0200E299F8FDC54CDDE7CEFBE7FF7F557C3B3305A3AF705DD91A6434E2E47EEA352C9B1E7C9E01122227B110D442CE399EA0571E49130F60687873F78FDBE0728C245598E33BC49B9A211645FF0EB38E601242A25EC220E8149B38E3B7E26D5B92411C884043072C748714E8554674B100195E03A278C1234C40736731DC279AC8842338FEF24F84AC47CEE27B840D8ED2A01A49B11A6B932F38FD7E4DB9EE470A04FE2AD190B51412A551CED28B07F645CE3D9EC7B39D82D5D87CE3B4327AB953E75E6C091FB11B8C093DB9A8EC74C68AA16E7F6329603E76C86315A00D7E4B2D83C280181B8D17F07CE38652A1530E2902A41D881739D4E190D3EC1EA36FE09F888A78C556D442B71AFB6804BD7224E40A8D50DCC8CE593D075BC3A9F6733966C159EFC5813AE8E06AE7389CAC9944109818A0B7C150BC0C382200AC26BA21408AE6540E6C486764B97FE5F6843CC61F6B8CE05597E063E578F2377F0F6ADEB9CD32584C58AB1E08E534C3664522285160B2DAD976441E799C196FE7B1A422C5DE70658B62D1F699267442FDB7A30A13F17717413B382235F7EB825620E0AED8F9B7B7E9C8AC0B264E8ADA1B5117099A0DD0097B1FC0FB867020E3FBE08E02CAD082F20124ED1E442B9FE7C4BA3DD658D199192CE6860AA9D394B09597B7F47F1197A9F8EC8B60966F267BFFC2A72A82DBF8ADCDB2EBFD2C8CE2EDB4D1379CEC87C7DCDED9C7B75812F9C8988BF10045B215E73233EAC104AF5185C40340561CEE85386DD89EBDC1396E2D77E236235EA8F310B4BDAC166DA6B1D497468497FD40C42EEEEEAE28994714033D754A360E25F5777C6436703182CBC63FEA20769823EC3D08FDCEF1AE6B7CB2B8BF75A9E01635D5EDFB5ABDE153FC57C56E09C0479BF3226322061332BD013617D050B25088D09C2101D12034EB96A5655CA039A10D66DB5C5B26529D62695C2ED9D534880EB2ADAEDFB6DB496F5A3A9BAD46079E929A70CBD0A7A9AF726F228E428018A86FFB23A9DEA6558AA964CC6FED624B334F5DCC68B16EB83AA1E099B847571A9E3A501B73A7BD16334D80D7C2DF6CA592D1945B1AC50B4D452DBED9BB3A934766D6723709BF3A722A170949D06F523B514EC3284EB09C6CB479862D4F13A669DE1054912AC8A95D9C7AC38BE197CDEF8BB8F04512EC30B64CB64505A5B6AC29E84CCC1DAADDC1478D99329D1D7CA388C1A6416603BD05428AB61B219AA026305B9FE6C1A87F621A525AB0DEF391E2AD20521EBB9EC3837F9B2B99330225AFABB71CCD2887717A66EEEBC63ABF2E72B4D0943CF32BC51811AEE69D4EBBAB3B70A85C99BE78522AF05BB87A283EFEF0E4597845A235C1554DBD85E9EDDC55545DA7BDB4B2DEFB0AAB8CE8BED9581D7A8913649A9BDAC95564D1C9AFAB4C3235151B07212D741072D106958ACFC955410F53441CFFF998D19C5F3AE092E08A733902AEF5DDDC1617F603D34FD731E7D3C2943B6CDCBCF179F83A976E99393EE8E935D75F4E50B228247229AAF2D1B85EEF880F1DFF5DB3711597EFB12CF00217E562FF70C8093D92A73C2F3A6FE4C44A36F9E60F3BE1CB9BF663CC7CEE4C707C376E05C09CCFD63E7D0F96D4F04ED371F9A86F88B8E705637BCCF40BAD714D8D5ACBDCEE0F72F99F59A1DF616A35CF724975F779895531DD71CC41D434DEB94D73DE4B5496E1FB85E7100AC9DBED2C93F39F235E7C4D719F29A8D0A22A6F29B176255D2F95A84FE058C4350C34A4933E1B3B8C0AC6551416255C10B50040B3239118ACE48A0703B00ACB2FA91D83C769D45530827FC2A5549AAF0C8104D59EDD159437F93FE6C92ADDB3CBC4AB247C29738029A49F59D72C53FA4B4F2A877DE528A3B44E89C32D7A78EA5D2D7E87C554ABA8CF996828CFBCA52700B51C25098BCE23E59C03EB6DD49F80C7312AC8A7EB35BC8D381A8BB7D784AC95C90481A196B7EFC8A180EA3E5BBBF00DDEC687EFA1D0000 , N'6.1.3-40302')
END

