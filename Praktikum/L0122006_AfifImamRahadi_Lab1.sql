-- Nama		: Afif Imam Rahadi
-- Nim		: L0122006
-- Kelas	: A

CREATE DATABASE SPOTIFY;

USE SPOTIFY;

DROP TABLE IF EXISTS [STREAM];
DROP TABLE IF EXISTS [USER]
DROP TABLE IF EXISTS [SONG_GENRE];
DROP TABLE IF EXISTS [SONG];
DROP TABLE IF EXISTS [GENRE];
DROP TABLE IF EXISTS [ALBUM];
DROP TABLE IF EXISTS [ARTIST];

CREATE TABLE [ARTIST]
(
	[ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	[Name] NVARCHAR(128) 
);

CREATE TABLE [ALBUM]
(
	[ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	[ArtistID] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [ARTIST](ID),
	[Name] NVARCHAR(128),
	[ReleaseYear] INT
);

CREATE TABLE [GENRE]
(
	[ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	[Name] VARCHAR (32)
);

CREATE TABLE [SONG]
(
	[ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	[AlbumID] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [ALBUM] (ID),
	[Title] NVARCHAR(128),
	[Duration] INT,
	[Duration_Hours] INT,
	[Duration_Minutes] INT,
	[Duration_Seconds] INT
);

CREATE TABLE [SONG_GENRE]
(
	[SongID] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [SONG](ID),
	[GenreID] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [GENRE](ID),
);

CREATE TABLE [USER]
(
	[ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	[Name] NVARCHAR(128)
);

CREATE TABLE [STREAM]
(
	[ID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	[UserID] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [USER](ID),
	[SongID] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES [SONG](ID),
	[StartedAt] DATETIME,
	[FinishedAt] DATETIME,
	[Duration] INT
);

SELECT * FROM [ARTIST];
SELECT * FROM [ALBUM];
SELECT * FROM [GENRE];
SELECT * FROM [SONG];
SELECT * FROM [SONG_GENRE];
SELECT * FROM [USER];
SELECT * FROM [STREAM];



DELETE FROM [STREAM];
DELETE FROM [USER];
DELETE FROM [SONG_GENRE];
DELETE FROM [SONG];
DELETE FROM [GENRE];
DELETE FROM [ALBUM];
DELETE FROM [ARTIST];

INSERT INTO [ARTIST] ([ID], [Name]) VALUES (N'7d0e90d5-cfe4-4640-afbd-de9ecc4b4f16', N'Travis Hunt');
INSERT INTO [ARTIST] ([ID], [Name]) VALUES (N'b9511feb-2f67-45f7-9462-933104d29707', N'Maria Gonzalez');
INSERT INTO [ARTIST] ([ID], [Name]) VALUES (N'97153d6f-0323-44e2-8c9b-363e48b7c2fd', N'David Coffey');
INSERT INTO [ARTIST] ([ID], [Name]) VALUES (N'9bba9b36-611c-446f-a922-d537abb51022', N'Christopher Johnson');
INSERT INTO [ARTIST] ([ID], [Name]) VALUES (N'19d8a41b-ab11-48c4-8458-f81f043a1757', N'Billy Shaffer');

INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'76a8a632-86c7-4f12-9e92-c94b53ba6b9c', N'7d0e90d5-cfe4-4640-afbd-de9ecc4b4f16', N'Industry scientist defense training personal service note.', 2010);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'6ce26d4a-6270-4024-b408-4167e3654d84', N'7d0e90d5-cfe4-4640-afbd-de9ecc4b4f16', N'Group ball seat war small financial.', 2005);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'c3b051d8-531f-4d52-90f2-0708404fd056', N'7d0e90d5-cfe4-4640-afbd-de9ecc4b4f16', N'Product forward lot along son practice.', 2012);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'5768c1c1-878d-4a51-9332-6a638600b6c7', N'b9511feb-2f67-45f7-9462-933104d29707', N'Include five drop.', 2009);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'90bccebf-7e09-41f4-bfc7-0a463d92b916', N'b9511feb-2f67-45f7-9462-933104d29707', N'Young position whom nature law fear.', 2011);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'e8865877-d9a2-4ae0-96db-7e5be91a360a', N'b9511feb-2f67-45f7-9462-933104d29707', N'Nation popular rest leave throw.', 2012);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'77bc68ca-ee87-4c71-b2cb-9228dd9d95c2', N'97153d6f-0323-44e2-8c9b-363e48b7c2fd', N'Thought listen item.', 2006);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'68ec9b33-c326-4223-a8b4-49b7bb8f6f6f', N'97153d6f-0323-44e2-8c9b-363e48b7c2fd', N'Join up card.', 2015);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'6caad10e-f7fe-4126-9af0-68fb2bd2bb51', N'9bba9b36-611c-446f-a922-d537abb51022', N'Realize green explain.', 2010);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'9e2bb9a5-d8f3-4294-b2b2-dd63a9215288', N'9bba9b36-611c-446f-a922-d537abb51022', N'Look without word.', 2008);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'ce7bff63-390b-41ce-8844-8fe0f105c2ab', N'9bba9b36-611c-446f-a922-d537abb51022', N'Likely become yet expect.', 2015);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'54d459e7-01aa-4e5f-a185-dc2e0ea2eaa0', N'9bba9b36-611c-446f-a922-d537abb51022', N'Include design movie second ago scientist.', 2015);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'bd8fa72c-0474-47a7-b25f-2a5420b60f1a', N'19d8a41b-ab11-48c4-8458-f81f043a1757', N'Price phone treat adult military agreement.', 2010);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'e2bb21d5-0cde-4bfc-9c87-34a3e1ab6605', N'19d8a41b-ab11-48c4-8458-f81f043a1757', N'Free chair early.', 2011);
INSERT INTO [ALBUM] ([ID], [ArtistID], [Name], [ReleaseYear]) VALUES (N'd87cd1ac-0e27-408c-a85c-c91fae784b74', N'19d8a41b-ab11-48c4-8458-f81f043a1757', N'Window response a decision.', 2012);

INSERT INTO [GENRE] ([ID], [Name]) VALUES (N'967c5943-b65f-4259-9819-c1a9d24151ce', N'Student would student.');
INSERT INTO [GENRE] ([ID], [Name]) VALUES (N'f9754137-dcf9-4a4c-a82f-b832035389f2', N'Tv carry.');
INSERT INTO [GENRE] ([ID], [Name]) VALUES (N'0c905870-2dd1-4881-a2ff-28decb31598d', N'Especially store hot say.');
INSERT INTO [GENRE] ([ID], [Name]) VALUES (N'c7226f55-9fea-48b9-b91e-9fb32b95fd41', N'Result land.');
INSERT INTO [GENRE] ([ID], [Name]) VALUES (N'bd705b02-2c15-4ec5-8303-b0f20196d0fc', N'Doctor enough.');

INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'76a8a632-86c7-4f12-9e92-c94b53ba6b9c', N'Education even remain alone part half something along leave.', 548);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'80e14268-87cf-4f3e-bc63-717a77f53df2', N'76a8a632-86c7-4f12-9e92-c94b53ba6b9c', N'Land money himself central light.', 550);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'52251189-f669-40b5-b8d7-016c9c899498', N'76a8a632-86c7-4f12-9e92-c94b53ba6b9c', N'Fly card beat national call attack evidence.', 247);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'76a8a632-86c7-4f12-9e92-c94b53ba6b9c', N'Hair for first create health event body organization.', 236);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'241e900d-b0f9-481e-b33a-76181de1be42', N'76a8a632-86c7-4f12-9e92-c94b53ba6b9c', N'Newspaper training success eat manager magazine weight mention professional.', 70);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'7677e88b-7774-491b-bec5-92e040b73307', N'6ce26d4a-6270-4024-b408-4167e3654d84', N'Information wait fast either.', 440);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'6ce26d4a-6270-4024-b408-4167e3654d84', N'Pick exactly rule race street inside.', 281);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'6ce26d4a-6270-4024-b408-4167e3654d84', N'Phone order red if picture voice section contain west town.', 373);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'8dae23c2-fefd-4b62-b331-c5475342291a', N'c3b051d8-531f-4d52-90f2-0708404fd056', N'Commercial these cause six we claim.', 399);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'c3b051d8-531f-4d52-90f2-0708404fd056', N'Memory security clearly another outside admit voice ask.', 297);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'fad5c8d9-3599-417f-a4d8-22d34045f91c', N'c3b051d8-531f-4d52-90f2-0708404fd056', N'Memory herself eight loss among.', 439);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'10bfebfd-f860-4ce4-8f17-f5f5f50f0e77', N'c3b051d8-531f-4d52-90f2-0708404fd056', N'Among new beat a every similar maintain.', 81);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'd1e32c26-330b-4909-af96-d6eb12896db2', N'5768c1c1-878d-4a51-9332-6a638600b6c7', N'Expect no interview much many believe.', 369);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'36455c1a-43fd-4ff1-a213-d9a7974bf1e7', N'5768c1c1-878d-4a51-9332-6a638600b6c7', N'Air yourself family debate there identify our item top candidate.', 203);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'5768c1c1-878d-4a51-9332-6a638600b6c7', N'Management middle determine put government.', 140);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'5768c1c1-878d-4a51-9332-6a638600b6c7', N'Country site hear back.', 395);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'5768c1c1-878d-4a51-9332-6a638600b6c7', N'Ability teacher education worry return similar front TV major stand.', 304);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'90bccebf-7e09-41f4-bfc7-0a463d92b916', N'Fast federal marriage country police everybody.', 560);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'90bccebf-7e09-41f4-bfc7-0a463d92b916', N'Store service trouble up child thank manager perhaps suggest.', 198);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'90bccebf-7e09-41f4-bfc7-0a463d92b916', N'Debate worry option yourself everybody per two trial down.', 277);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'b22af0e4-05cb-49bd-8501-484544671ae2', N'e8865877-d9a2-4ae0-96db-7e5be91a360a', N'Between important image between position.', 157);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'f766f5ab-3790-4cea-8457-a8d340a68781', N'e8865877-d9a2-4ae0-96db-7e5be91a360a', N'Much administration total head show be own realize.', 95);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'e8865877-d9a2-4ae0-96db-7e5be91a360a', N'Wear they magazine quality out.', 317);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'e8865877-d9a2-4ae0-96db-7e5be91a360a', N'Indeed us soon rock already value strategy always president.', 114);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'77bc68ca-ee87-4c71-b2cb-9228dd9d95c2', N'Offer news you management back authority same might thank.', 322);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'77bc68ca-ee87-4c71-b2cb-9228dd9d95c2', N'Contain environment wear personal unit inside response size door blue.', 187);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'e07a6845-120e-423d-b678-82c68d11fa8e', N'77bc68ca-ee87-4c71-b2cb-9228dd9d95c2', N'Television scientist president sometimes evidence act entire.', 309);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'77bc68ca-ee87-4c71-b2cb-9228dd9d95c2', N'Tv probably before majority bag.', 104);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'66148e25-e0fe-4c07-b06d-c5027de70351', N'77bc68ca-ee87-4c71-b2cb-9228dd9d95c2', N'Talk range notice meeting defense the.', 206);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'68ec9b33-c326-4223-a8b4-49b7bb8f6f6f', N'Just information why agent.', 124);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'68ec9b33-c326-4223-a8b4-49b7bb8f6f6f', N'Hot concern someone attorney term house something news support.', 506);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'fbd0deff-36a3-4c8e-9806-11984b0a0516', N'68ec9b33-c326-4223-a8b4-49b7bb8f6f6f', N'Beat watch along who hold serve measure how position job.', 399);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'eb54ba81-b12e-4736-b71d-fa8ccbb2cedc', N'6caad10e-f7fe-4126-9af0-68fb2bd2bb51', N'Action always price wonder for sit.', 280);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'6caad10e-f7fe-4126-9af0-68fb2bd2bb51', N'Republican project rich show bag discussion loss too.', 484);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'6caad10e-f7fe-4126-9af0-68fb2bd2bb51', N'Mouth firm certain family provide employee laugh.', 329);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'6caad10e-f7fe-4126-9af0-68fb2bd2bb51', N'Us paper style blue care it quality city research.', 104);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'6cc4b1ec-63dd-4850-9fba-17fc2b3ce97f', N'9e2bb9a5-d8f3-4294-b2b2-dd63a9215288', N'Important cover opportunity mention.', 225);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'9e2bb9a5-d8f3-4294-b2b2-dd63a9215288', N'Gun interest strong Democrat Mrs television best.', 88);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'bec4a65f-ed10-4986-89f5-f05f3ab3099c', N'9e2bb9a5-d8f3-4294-b2b2-dd63a9215288', N'Performance hundred ball manager change.', 119);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'6a59336d-d582-4bf7-af67-2375c6e15379', N'9e2bb9a5-d8f3-4294-b2b2-dd63a9215288', N'Wonder fact central exactly test allow skin.', 78);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'9e2bb9a5-d8f3-4294-b2b2-dd63a9215288', N'Central difficult return stay ago suddenly ground wear describe step.', 524);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'4165ae13-4bd3-4453-8905-6aab07a83519', N'ce7bff63-390b-41ce-8844-8fe0f105c2ab', N'Goal four treatment nature memory address explain.', 546);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'ce7bff63-390b-41ce-8844-8fe0f105c2ab', N'Future my effort worry wrong allow start.', 478);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'54d459e7-01aa-4e5f-a185-dc2e0ea2eaa0', N'Democrat force sister same politics treatment interview would beat.', 265);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'54d459e7-01aa-4e5f-a185-dc2e0ea2eaa0', N'Example of debate heavy blue box large wrong number.', 450);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'54d459e7-01aa-4e5f-a185-dc2e0ea2eaa0', N'Dinner treatment history remain space business baby debate federal job.', 166);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'b1a2de48-33fc-4923-9968-f7a1bc2214a3', N'bd8fa72c-0474-47a7-b25f-2a5420b60f1a', N'Person over hear relationship baby.', 325);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'2180d20a-82e9-4d2f-8dfd-6e20eac86956', N'bd8fa72c-0474-47a7-b25f-2a5420b60f1a', N'Past president well thank foreign every.', 536);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'bd8fa72c-0474-47a7-b25f-2a5420b60f1a', N'Wide lose you by light.', 523);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'bd8fa72c-0474-47a7-b25f-2a5420b60f1a', N'Own among box nature mind account either well half.', 145);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'e2bb21d5-0cde-4bfc-9c87-34a3e1ab6605', N'Her subject believe watch affect goal across his.', 495);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'2e473d0e-1163-4422-921e-39f0794440ee', N'e2bb21d5-0cde-4bfc-9c87-34a3e1ab6605', N'Mrs task Mr capital help.', 289);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'e2bb21d5-0cde-4bfc-9c87-34a3e1ab6605', N'Store appear anything recent gun morning hour pick.', 495);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'd87cd1ac-0e27-408c-a85c-c91fae784b74', N'Tell sound let second some one doctor ready.', 270);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'082acfbf-5005-4904-8e3a-cafdc194baa5', N'd87cd1ac-0e27-408c-a85c-c91fae784b74', N'Best allow dinner player others.', 593);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'820432b4-2171-43fe-b83b-539079ac8c75', N'd87cd1ac-0e27-408c-a85c-c91fae784b74', N'House nor around though seem better there may property year research.', 544);
INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'd87cd1ac-0e27-408c-a85c-c91fae784b74', N'Tv either research into body whatever set allow citizen behavior itself.', 573);

INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'80e14268-87cf-4f3e-bc63-717a77f53df2', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'80e14268-87cf-4f3e-bc63-717a77f53df2', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'52251189-f669-40b5-b8d7-016c9c899498', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'241e900d-b0f9-481e-b33a-76181de1be42', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'7677e88b-7774-491b-bec5-92e040b73307', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'7677e88b-7774-491b-bec5-92e040b73307', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'8dae23c2-fefd-4b62-b331-c5475342291a', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'fad5c8d9-3599-417f-a4d8-22d34045f91c', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'fad5c8d9-3599-417f-a4d8-22d34045f91c', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'10bfebfd-f860-4ce4-8f17-f5f5f50f0e77', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'd1e32c26-330b-4909-af96-d6eb12896db2', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'd1e32c26-330b-4909-af96-d6eb12896db2', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'36455c1a-43fd-4ff1-a213-d9a7974bf1e7', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'b22af0e4-05cb-49bd-8501-484544671ae2', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'f766f5ab-3790-4cea-8457-a8d340a68781', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'e07a6845-120e-423d-b678-82c68d11fa8e', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'e07a6845-120e-423d-b678-82c68d11fa8e', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'66148e25-e0fe-4c07-b06d-c5027de70351', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'fbd0deff-36a3-4c8e-9806-11984b0a0516', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'eb54ba81-b12e-4736-b71d-fa8ccbb2cedc', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'6cc4b1ec-63dd-4850-9fba-17fc2b3ce97f', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bec4a65f-ed10-4986-89f5-f05f3ab3099c', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'bec4a65f-ed10-4986-89f5-f05f3ab3099c', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'6a59336d-d582-4bf7-af67-2375c6e15379', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'4165ae13-4bd3-4453-8905-6aab07a83519', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'b1a2de48-33fc-4923-9968-f7a1bc2214a3', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'2180d20a-82e9-4d2f-8dfd-6e20eac86956', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'2180d20a-82e9-4d2f-8dfd-6e20eac86956', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'f9754137-dcf9-4a4c-a82f-b832035389f2');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'2e473d0e-1163-4422-921e-39f0794440ee', N'967c5943-b65f-4259-9819-c1a9d24151ce');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'2e473d0e-1163-4422-921e-39f0794440ee', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'082acfbf-5005-4904-8e3a-cafdc194baa5', N'0c905870-2dd1-4881-a2ff-28decb31598d');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'082acfbf-5005-4904-8e3a-cafdc194baa5', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'820432b4-2171-43fe-b83b-539079ac8c75', N'c7226f55-9fea-48b9-b91e-9fb32b95fd41');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'bd705b02-2c15-4ec5-8303-b0f20196d0fc');
INSERT INTO [SONG_GENRE] ([SongID], [GenreID]) VALUES (N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'f9754137-dcf9-4a4c-a82f-b832035389f2');

INSERT INTO [USER] ([ID], [Name]) VALUES (N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'Becky Schmitt');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'48617991-30c0-42ce-b23c-1049583708d8', N'Javier Le');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'Scott Bass');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'Thomas Jenkins');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'Kristi Cruz');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'Jennifer Anderson');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'Benjamin Smith');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'Philip Holland');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'Caroline Chan');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'23f21205-1b76-44b0-a039-d4866f1c1428', N'Samuel Townsend');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'61614d51-f108-4eb2-a47b-d1351137a6da', N'Hannah Garrett');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'Ian Robinson');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'Mike Lopez');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'James Contreras');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'Jennifer Hernandez');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'Eric Mcmahon');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'Jennifer Harris');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'Susan Aguilar');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'Mr. Charles Contreras');
INSERT INTO [USER] ([ID], [Name]) VALUES (N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'Lori Lowery');

INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd4698428-bf6d-4088-8d27-f472ff183aca', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2012-01-01T15:05:59', N'2012-01-01T15:07:16');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5738090b-8811-4cfd-aa0e-e3e489b36221', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'52251189-f669-40b5-b8d7-016c9c899498', N'2021-03-28T05:01:30', N'2021-03-28T05:04:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'898b7445-ba9b-438b-9620-dd6224dd73f8', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2022-02-07T20:24:51', N'2022-02-07T20:27:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'37d8099a-112d-4861-b165-d548547914e0', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'2018-10-25T00:56:01', N'2018-10-25T00:58:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f41295dd-0e69-46ad-9251-f1008205278e', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2012-01-12T15:30:54', N'2012-01-12T15:36:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'49fda7c4-27f9-48bc-b9d4-4bba0306ba07', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'2e473d0e-1163-4422-921e-39f0794440ee', N'2019-07-30T01:45:51', N'2019-07-30T01:47:50');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ceecf22d-62ef-429b-8cc5-78c79bb3b9ed', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'2019-03-23T17:17:17', N'2019-03-23T17:20:02');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'edc71427-a419-4906-a6a0-1e2a853bf5c2', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'2022-07-23T07:09:59', N'2022-07-23T07:11:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'91c45a5b-25b5-47ff-a944-9aa65874e98a', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'2180d20a-82e9-4d2f-8dfd-6e20eac86956', N'2012-12-20T23:05:07', N'2012-12-20T23:07:12');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9cccf1ba-bd9b-498e-ae3d-8a5b203fde84', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'b22af0e4-05cb-49bd-8501-484544671ae2', N'2019-12-19T07:45:58', N'2019-12-19T07:48:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b9e2cade-1923-4ec1-9d50-d42a048691ed', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2020-10-11T18:17:27', N'2020-10-11T18:26:41');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'db67a782-0619-419f-8c3a-5dcb787774c5', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'2019-04-10T04:08:45', N'2019-04-10T04:09:16');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a9f7a77d-398c-49e4-a684-2e91f2fdcac2', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2021-03-23T14:46:11', N'2021-03-23T14:52:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'74f05c2d-1996-4e6c-872b-28eca317c361', N'07c73874-ec17-4372-be9a-d2b3b2de9860', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2021-12-07T01:45:09', N'2021-12-07T01:46:24');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4f80d71b-1c31-4dec-ad02-a311ee0d313e', N'48617991-30c0-42ce-b23c-1049583708d8', N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'2014-04-14T17:26:36', N'2014-04-14T17:31:14');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5fd4dfb2-5a5b-4395-878d-59831407c43c', N'48617991-30c0-42ce-b23c-1049583708d8', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2019-03-20T21:55:52', N'2019-03-20T21:58:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'051172bb-b08a-46d1-be51-b17b6efea3c6', N'48617991-30c0-42ce-b23c-1049583708d8', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2017-05-22T18:13:13', N'2017-05-22T18:17:00');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0f2bea0e-2cdc-4d82-bf4d-6315fe812362', N'48617991-30c0-42ce-b23c-1049583708d8', N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'2016-01-20T21:09:48', N'2016-01-20T21:12:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5dd484a3-cd78-4dcb-b419-798a8c0287ef', N'48617991-30c0-42ce-b23c-1049583708d8', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2011-04-11T10:13:27', N'2011-04-11T10:18:29');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2bdad598-ef5c-4b2d-9d80-e850eb1088c6', N'48617991-30c0-42ce-b23c-1049583708d8', N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'2010-09-17T09:00:01', N'2010-09-17T09:02:23');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4465127c-2d45-4935-901f-a3d2a64648bc', N'48617991-30c0-42ce-b23c-1049583708d8', N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'2019-03-22T21:56:53', N'2019-03-22T21:58:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ab96c0d1-77ef-4753-b9f2-7aa7b46fa074', N'48617991-30c0-42ce-b23c-1049583708d8', N'241e900d-b0f9-481e-b33a-76181de1be42', N'2014-09-02T09:05:38', N'2014-09-02T09:06:16');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'20d9207f-9f10-47b3-a307-be035d41bc68', N'48617991-30c0-42ce-b23c-1049583708d8', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2017-05-08T23:27:28', N'2017-05-08T23:28:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8c7bf066-a5da-4fb0-bdfd-1aaeec47aa5d', N'48617991-30c0-42ce-b23c-1049583708d8', N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'2021-02-04T10:42:50', N'2021-02-04T10:43:46');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c0216f33-4dbf-4eba-aeed-36b009ae6dd3', N'48617991-30c0-42ce-b23c-1049583708d8', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2007-10-23T11:31:52', N'2007-10-23T11:33:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c5fac424-229b-4096-a44a-aa3eb34f31a8', N'48617991-30c0-42ce-b23c-1049583708d8', N'2180d20a-82e9-4d2f-8dfd-6e20eac86956', N'2019-06-04T02:10:52', N'2019-06-04T02:13:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'060c520a-6839-4b8e-8e46-f9db9c318db4', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2014-12-02T02:21:50', N'2014-12-02T02:23:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b0d64a95-3767-4580-b6a6-f6fd99fabb9c', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'2022-03-18T07:33:08', N'2022-03-18T07:41:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b1c7f663-22a5-4b2f-a99f-fce2c372e854', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'2018-01-25T08:57:20', N'2018-01-25T09:02:06');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ede18e84-65e8-4444-b689-285a648e0389', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2014-01-25T05:17:10', N'2014-01-25T05:25:15');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f950af02-0cc3-4a01-b5af-e66bf181edbe', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2017-08-02T21:06:25', N'2017-08-02T21:13:35');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e0ce413d-ae59-4384-918f-3d5df78695ee', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'2019-12-03T06:46:03', N'2019-12-03T06:47:24');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e8ccb7da-7fe5-491b-a19c-9fee662fa94f', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'2022-05-24T13:25:24', N'2022-05-24T13:26:10');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7fe4cab9-22bd-4f0f-82a8-80c6a3002f79', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'2013-06-21T03:54:38', N'2013-06-21T03:55:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c0dab372-3d94-4d3b-aff6-346cde08577b', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2013-11-25T19:05:14', N'2013-11-25T19:06:58');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'22e0bafd-da52-4f7f-8d88-38c06e7acf6f', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'2019-09-11T22:10:05', N'2019-09-11T22:10:42');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'387e444d-581f-474d-9d74-5aec6d837777', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'52251189-f669-40b5-b8d7-016c9c899498', N'2015-05-30T03:12:28', N'2015-05-30T03:14:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'242ae3c3-752e-4ad0-882e-b31dcc4e978a', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'2021-01-23T08:00:48', N'2021-01-23T08:08:06');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8990b855-8fa1-455a-a459-45149eb429ba', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2020-08-19T04:20:20', N'2020-08-19T04:24:10');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5bbab45c-a889-4e4b-9d3f-a873bbde1228', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'2015-04-25T16:22:07', N'2015-04-25T16:22:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'80fbf14f-cdb6-4d85-9b19-acca88e9e535', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'7677e88b-7774-491b-bec5-92e040b73307', N'2015-05-27T13:09:49', N'2015-05-27T13:12:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'758f1611-1883-4355-89cb-698cc6f55e8b', N'4fa4475a-0f00-4e17-8b6d-6a94922c9009', N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'2022-10-10T22:48:33', N'2022-10-10T22:49:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b95a4166-5b9b-4a7b-b0b5-6fdb792f404b', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'f766f5ab-3790-4cea-8457-a8d340a68781', N'2015-06-08T14:29:15', N'2015-06-08T14:30:50');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0022cafb-ae13-434e-9e55-fc248d3d5d54', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'820432b4-2171-43fe-b83b-539079ac8c75', N'2017-07-10T19:35:29', N'2017-07-10T19:36:36');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'70c36bf8-eebc-4d9c-b37e-7913fe72aed9', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'2017-01-29T23:45:55', N'2017-01-29T23:49:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'3eb79b93-e73d-453b-9939-731a68c6b14b', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'e07a6845-120e-423d-b678-82c68d11fa8e', N'2012-04-14T05:54:41', N'2012-04-14T05:59:02');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'477ad25d-7bb4-49b6-b4e0-ee8ce98a5b2c', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'2017-03-02T21:38:55', N'2017-03-02T21:43:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2a00a8d2-b75f-47ae-80c5-da7ec6114f4f', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'2019-08-28T14:09:57', N'2019-08-28T14:12:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'db82d475-7aff-4c9b-8281-e5aea26d06d3', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2019-06-28T16:34:13', N'2019-06-28T16:41:42');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c74ea53c-e402-40c5-a6b1-ee38d02617dc', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'2014-09-22T05:38:27', N'2014-09-22T05:44:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ebf78de2-6e30-4bd6-b469-da1fa63a5f7b', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'241e900d-b0f9-481e-b33a-76181de1be42', N'2018-11-09T17:27:58', N'2018-11-09T17:28:35');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2d9d4bf8-7b0a-4738-ad82-2d0412120c67', N'c5d8b3b1-37d7-4460-bae1-fed0d933c047', N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'2020-07-12T12:25:23', N'2020-07-12T12:26:03');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'84a62bfa-b31d-4de3-af2f-02bea626ae7a', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'2018-01-12T00:59:55', N'2018-01-12T01:01:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2b152ccc-c088-461f-aa4d-d4904feb59f8', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2018-08-31T16:20:15', N'2018-08-31T16:25:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ea91f1fc-a0d6-4e68-9a2c-ea394fda7f1e', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'2012-04-16T04:38:54', N'2012-04-16T04:41:51');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'56166e97-8387-4f22-adbf-f68704fb7fca', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2015-10-08T10:42:10', N'2015-10-08T10:45:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'91dc9beb-769c-4cac-8c1e-203aebfb841f', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'2018-03-10T04:58:17', N'2018-03-10T05:01:55');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'71b5c003-aa8a-4aea-80a2-5db17753bfbb', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'2015-06-28T19:11:27', N'2015-06-28T19:12:52');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'fee80790-dd48-49c1-a0ff-f6028a84fdfe', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2020-08-08T15:19:22', N'2020-08-08T15:21:59');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'384da839-829c-445a-8c7d-e5911ff6c6be', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'8dae23c2-fefd-4b62-b331-c5475342291a', N'2015-05-21T09:48:14', N'2015-05-21T09:50:37');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0feffead-c28d-42e2-909e-cb010cbc4cf6', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'eb54ba81-b12e-4736-b71d-fa8ccbb2cedc', N'2020-04-07T08:54:31', N'2020-04-07T08:57:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e92753d2-ad7d-4afa-b61b-0e8a5be32307', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'f766f5ab-3790-4cea-8457-a8d340a68781', N'2020-07-04T15:37:52', N'2020-07-04T15:39:09');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'3739bc00-f93f-4dff-ba53-b0fc6488925a', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'2013-06-08T08:20:27', N'2013-06-08T08:21:02');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1d8f3f11-6618-412f-9e20-79c59df59a7e', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'fbd0deff-36a3-4c8e-9806-11984b0a0516', N'2018-03-23T12:07:09', N'2018-03-23T12:11:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'68ae78cb-0bf6-4ed3-a4b1-330c0a00eb62', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'f766f5ab-3790-4cea-8457-a8d340a68781', N'2015-07-19T19:49:25', N'2015-07-19T19:50:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7b910fcf-9c04-4662-89f8-d1d4c07e3fbb', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2017-09-11T08:48:48', N'2017-09-11T08:57:01');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e9bcb1c1-664f-4b11-83f4-86ab595195a8', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'2022-07-01T21:05:39', N'2022-07-01T21:06:39');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6892927c-bf6d-43cf-a26e-4c2a6984bfbe', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'eb54ba81-b12e-4736-b71d-fa8ccbb2cedc', N'2016-11-01T17:33:43', N'2016-11-01T17:35:23');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'024054f0-fe6a-41d1-8446-a686be287c30', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'820432b4-2171-43fe-b83b-539079ac8c75', N'2013-12-27T19:20:37', N'2013-12-27T19:23:43');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'136c1359-176c-4970-b58e-5a60311003fa', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'fad5c8d9-3599-417f-a4d8-22d34045f91c', N'2015-10-05T13:40:38', N'2015-10-05T13:45:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'392a3a9c-2c47-4e98-be89-491c7ed0d63e', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2022-04-14T07:28:33', N'2022-04-14T07:37:26');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'adf4c77b-e422-48c9-bf57-ac25377bc542', N'2ea5c6ad-54e5-4d2f-a4cb-71f23e4b09ab', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2020-01-06T18:03:55', N'2020-01-06T18:05:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b5d735ef-0a62-4ee3-b117-584fd24fc38a', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'2014-07-01T06:50:41', N'2014-07-01T06:52:05');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0b87f350-fb71-42d1-90ab-08b81af7fa36', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'10bfebfd-f860-4ce4-8f17-f5f5f50f0e77', N'2019-05-24T00:34:45', N'2019-05-24T00:35:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd2285e16-0c5f-48f1-a2f5-3894af8720bb', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2013-11-17T04:09:20', N'2013-11-17T04:14:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c0b9103f-6463-4aad-aaaa-97ff56dc28a8', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2021-07-23T14:54:39', N'2021-07-23T14:57:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f6ffd571-ad08-49c1-b121-fec9dbdaf0ef', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2020-05-18T16:14:23', N'2020-05-18T16:20:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'04816e09-227c-4c97-98d1-9dff50001419', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'2014-12-11T09:20:33', N'2014-12-11T09:22:08');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'dbbc7079-e4db-4631-9cef-47ddf0ac925b', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'2021-11-04T16:14:52', N'2021-11-04T16:19:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'10172848-d589-4132-a1f3-0638baa6f657', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2012-05-22T09:40:33', N'2012-05-22T09:43:15');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'013e6fc2-54ce-4d2c-8b88-8c3b821f8edd', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'5258dc43-cc5b-4fc4-a3c9-208319d4f038', N'2017-09-21T01:09:20', N'2017-09-21T01:10:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd4406b5d-8f21-4bff-8df2-43452cbb053f', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'fad5c8d9-3599-417f-a4d8-22d34045f91c', N'2022-02-25T16:38:06', N'2022-02-25T16:40:20');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'25dd4f39-c751-42bd-aea5-e11a976c6226', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2020-07-05T15:12:29', N'2020-07-05T15:15:05');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ce5875b8-c9ee-4a1a-a4a7-bd3bb5142917', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2019-02-02T13:28:58', N'2019-02-02T13:30:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'18a684cf-e3d7-4067-8320-4b42a61d1a32', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'36455c1a-43fd-4ff1-a213-d9a7974bf1e7', N'2015-10-29T23:47:59', N'2015-10-29T23:50:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c5ab7a68-74cb-4311-b515-2d172665f80e', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2015-04-13T02:19:19', N'2015-04-13T02:20:51');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a6561a62-a050-4e3b-912d-43e15645614e', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'2020-06-24T12:33:20', N'2020-06-24T12:34:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5e144670-85ac-41a3-aa08-c6c69d01a552', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2013-04-14T12:39:46', N'2013-04-14T12:41:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b3c7f5c0-1b3a-4895-bff8-97793412728e', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'e07a6845-120e-423d-b678-82c68d11fa8e', N'2022-01-31T20:48:57', N'2022-01-31T20:53:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'50ba0c30-5f08-4189-bb1e-b54d36730c40', N'c37a1967-c75d-4777-a302-ee9c7880ce61', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2021-04-17T17:23:19', N'2021-04-17T17:24:51');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c39bae15-6b3b-4d55-8d98-fe4c8a71fdda', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'2017-11-25T00:38:56', N'2017-11-25T00:41:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a33b1d59-ac35-4269-aafb-b97703adbd4c', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2017-10-21T06:42:10', N'2017-10-21T06:49:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'918a54a3-baee-424d-becc-ae55c5ef7a83', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'820432b4-2171-43fe-b83b-539079ac8c75', N'2017-03-01T02:43:29', N'2017-03-01T02:50:48');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'473162d8-f8a9-46ce-82d2-59cf5191f0d7', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2013-03-31T13:25:12', N'2013-03-31T13:26:23');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'86fac4f6-6aff-407b-97d7-c354799d710b', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'2022-04-14T19:39:54', N'2022-04-14T19:42:51');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'3ff8f21b-a8b0-4d90-9006-84951a62943c', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2018-04-04T07:17:44', N'2018-04-04T07:18:36');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'daa11427-ec8b-4794-87c4-44e3e53a236a', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2013-05-18T16:45:40', N'2013-05-18T16:54:28');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'83da0e34-fa3e-4fe9-9f16-29637fd5fbcc', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'2018-09-25T20:46:50', N'2018-09-25T20:47:20');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ae4de5d5-98b8-4128-bd01-9f22d5e767e5', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2016-04-13T14:58:44', N'2016-04-13T14:59:38');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ad014f3a-250c-4be3-8307-e0086ceb5a4e', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2022-09-09T02:01:30', N'2022-09-09T02:03:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'3174c260-fdb1-465a-af61-2eb1472a6e8d', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2009-10-23T03:34:32', N'2009-10-23T03:35:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'94e07d0f-011d-462d-89a9-0340b8c04a02', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'2017-07-19T04:20:47', N'2017-07-19T04:23:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2a7591e6-1c56-405a-895b-12261ae856c2', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'66148e25-e0fe-4c07-b06d-c5027de70351', N'2013-03-20T06:50:56', N'2013-03-20T06:51:41');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7716019e-edc0-4c52-a9ec-b4edeb4b3baa', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'2014-05-23T15:42:04', N'2014-05-23T15:47:05');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4bc1de66-c970-429f-9892-806f5ee2233d', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'0b86b1d0-d5a7-4116-8786-0be64a247984', N'2021-10-09T20:22:46', N'2021-10-09T20:24:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5a3f5c2a-8d58-4d13-b640-1c32193cf27c', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'2016-07-16T11:34:52', N'2016-07-16T11:37:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'cf92d88e-c6cd-440e-b4d5-cb379b649e6a', N'c4eb8a37-4247-4ffe-9147-66c9091923bc', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2012-02-09T02:09:45', N'2012-02-09T02:11:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c2b4ae58-240d-4c42-9722-c4de2ca2cc88', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'2022-10-23T14:39:30', N'2022-10-23T14:41:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6f42ad9e-79ab-4fde-b974-c07f347a3698', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2020-05-15T05:07:15', N'2020-05-15T05:13:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'86738e64-a613-4ad2-b5d1-ded8397e5daf', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'2021-02-25T00:20:11', N'2021-02-25T00:22:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c3e40525-3de8-4218-939b-3d52508b5eee', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'2020-04-21T09:13:01', N'2020-04-21T09:14:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2411a757-f689-49ba-8072-9351d72c2341', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'241e900d-b0f9-481e-b33a-76181de1be42', N'2015-02-22T16:01:32', N'2015-02-22T16:02:03');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'172f5467-846c-4a21-9c2d-b18276119133', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2022-08-20T23:37:13', N'2022-08-20T23:39:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0b7bff23-489b-4b66-974b-b94ebb71aec3', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2016-12-19T12:14:18', N'2016-12-19T12:15:37');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'273f8291-5e80-4a46-a3c2-a176748802c6', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'b1a2de48-33fc-4923-9968-f7a1bc2214a3', N'2018-07-17T13:00:21', N'2018-07-17T13:03:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'80006b93-67b8-4925-a4c6-c98ea0afbc4b', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2019-08-09T08:15:37', N'2019-08-09T08:18:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9efd21f5-bdd5-4a62-b07c-6340986c0334', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'fbd0deff-36a3-4c8e-9806-11984b0a0516', N'2021-08-08T18:15:49', N'2021-08-08T18:19:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'940d4529-fc35-4aa9-a99c-e79fcbc0d22e', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2021-08-21T16:07:05', N'2021-08-21T16:07:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e33a4276-505e-4806-b3dc-7651900fdaec', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'2019-07-22T08:26:26', N'2019-07-22T08:27:20');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'46fab1db-2434-48de-99e0-6c993b99364e', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'52251189-f669-40b5-b8d7-016c9c899498', N'2012-07-11T03:11:27', N'2012-07-11T03:14:43');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'355c132f-83cf-4835-a5fc-26fb7d6f25a4', N'947c69b4-cac1-4199-ad72-3532dbb1d456', N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'2021-11-28T03:03:18', N'2021-11-28T03:09:21');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8f475149-e869-4fa1-81af-d638b5a35997', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2015-04-08T14:02:42', N'2015-04-08T14:08:24');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5db776a3-f9dc-4105-9f02-9586af4e40f4', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'2021-05-02T15:26:20', N'2021-05-02T15:27:10');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f2c01a33-d187-4a05-9a0f-945d5de06e24', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2012-01-21T08:15:13', N'2012-01-21T08:22:39');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'489a94bf-c9cc-4d40-a6fd-762dc46b9e58', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'2021-03-26T05:16:41', N'2021-03-26T05:17:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'286f0259-c74a-48f0-8196-c020c9bebff2', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2012-07-20T00:56:56', N'2012-07-20T01:02:00');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'95ed8e12-f251-4e2f-a581-f5338fb25a61', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2008-10-29T08:12:36', N'2008-10-29T08:15:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bcb06834-df54-4d8f-8c98-1d9a25b49786', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2022-07-02T18:46:17', N'2022-07-02T18:49:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a3ba8b06-a49d-48f3-ae84-262e6b9e913e', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'2019-12-07T14:25:34', N'2019-12-07T14:30:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f30a3d64-9150-4cae-865f-ce1dad4949e1', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'bec4a65f-ed10-4986-89f5-f05f3ab3099c', N'2022-02-23T05:43:01', N'2022-02-23T05:43:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'711405ca-48fd-499c-a99e-7bb9aed14bb3', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2016-02-07T00:44:14', N'2016-02-07T00:51:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b9ce3368-d4ee-45f2-8b49-9148a5bfd236', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'2019-02-12T12:10:46', N'2019-02-12T12:12:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'43acdcec-915c-4cc4-bef1-7deca19f2016', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2022-07-20T08:10:56', N'2022-07-20T08:14:24');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd12f7d60-fb0e-403c-8668-4e70ac71b3bf', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2016-09-03T14:19:03', N'2016-09-03T14:22:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'dd683714-754d-4694-98e3-5df4c49e90d0', N'7c4bef9f-459b-4bd7-ab59-8179db81fcfa', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2018-06-16T22:34:41', N'2018-06-16T22:35:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd2bf75c1-4636-4b10-8e03-fc533d8846a4', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2016-08-22T20:51:50', N'2016-08-22T20:56:04');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e365333b-d0ec-4184-8326-507b703aec64', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'2017-05-04T17:24:58', N'2017-05-04T17:26:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7657adc4-8a7f-470e-9014-a92b5aa9cfff', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'2e473d0e-1163-4422-921e-39f0794440ee', N'2014-05-08T20:29:09', N'2014-05-08T20:29:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'3ce41d6c-c445-4a52-99eb-fc16daaf3b3d', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'2015-06-19T22:58:24', N'2015-06-19T23:00:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bae75ab4-e88c-4288-a567-a73b90edc361', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2016-08-30T13:47:56', N'2016-08-30T13:48:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'74fdfcff-2b48-4895-8ad1-13ffe8b18c22', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2019-11-20T06:48:33', N'2019-11-20T06:49:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0d8d3acc-da19-4cd4-8939-ff24d394a3dd', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2020-03-19T07:10:22', N'2020-03-19T07:14:37');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'504e5a35-4383-47e9-b7ed-83bebf941f5c', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'2018-08-13T02:47:30', N'2018-08-13T02:48:52');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'940fd8d1-8e05-4010-a379-4c822c20f3bf', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'2013-03-31T16:05:46', N'2013-03-31T16:10:48');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2a91746e-3da1-4714-9d7c-578d867f154c', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2016-11-16T10:15:08', N'2016-11-16T10:15:59');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'cea9b0fb-44b5-46d1-8322-4c9ecb50c951', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2012-10-13T15:23:30', N'2012-10-13T15:26:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0024c23b-f4c5-41bc-8c49-55cfe1274048', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'2013-09-13T21:27:40', N'2013-09-13T21:31:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c47c28f5-9ac1-41e7-8555-07d3b13da153', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2022-08-22T17:51:24', N'2022-08-22T17:56:49');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5d2f7ac6-dcc2-4a1d-a39d-151569a22aec', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2013-10-22T00:19:58', N'2013-10-22T00:26:24');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6b6d998d-d8e8-4347-a3cb-145f7e39a189', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'2010-08-22T02:52:23', N'2010-08-22T02:56:35');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5068b407-7b9f-4f1c-9534-027741606123', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'241e900d-b0f9-481e-b33a-76181de1be42', N'2018-11-18T09:23:50', N'2018-11-18T09:24:21');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'37af2f56-42a8-4c4a-bab0-a94a278d5d62', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'b22af0e4-05cb-49bd-8501-484544671ae2', N'2016-04-09T22:13:56', N'2016-04-09T22:14:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'faee3b4d-0491-4462-9c2f-9da85ed2c422', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'7677e88b-7774-491b-bec5-92e040b73307', N'2011-02-01T05:57:41', N'2011-02-01T06:04:52');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e3b9edf3-4192-4daa-9b83-90820e724aa9', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'2011-08-26T07:33:06', N'2011-08-26T07:34:23');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bc236ffc-9652-42d5-a791-39ded7499982', N'23f21205-1b76-44b0-a039-d4866f1c1428', N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'2016-09-15T22:29:49', N'2016-09-15T22:32:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6a5ffe0d-b11f-4cda-ba57-59bd4f2787a9', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'2017-07-18T03:46:51', N'2017-07-18T03:53:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9ef8d652-14af-4d12-89c7-691a69a9f340', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2020-01-02T22:36:41', N'2020-01-02T22:37:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b325bbef-b89d-4d31-aff7-a3475f418775', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'2013-03-13T08:00:17', N'2013-03-13T08:00:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'07678621-db15-4311-b4cf-f0a02687a41a', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2017-10-08T14:34:52', N'2017-10-08T14:42:47');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'00c7100a-6621-4839-8e81-cfa0050b05ba', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'2022-10-15T10:09:48', N'2022-10-15T10:10:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'30aa96b2-0ae8-4871-8c3e-a8907c60e2c0', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'eb54ba81-b12e-4736-b71d-fa8ccbb2cedc', N'2012-10-07T13:08:39', N'2012-10-07T13:12:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'dda3854e-57c8-46ef-9106-4c941d254e21', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'6cc4b1ec-63dd-4850-9fba-17fc2b3ce97f', N'2014-04-01T18:30:37', N'2014-04-01T18:31:48');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f3ce0345-38e6-4176-8e6d-87ca5e59a7cf', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'2016-07-29T13:39:31', N'2016-07-29T13:45:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'de5d421b-dd50-420b-89d9-c085684bbad3', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'2012-10-28T16:34:10', N'2012-10-28T16:41:28');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9c9003d2-6935-45d5-8459-ab6600c9cddb', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2022-01-01T13:44:53', N'2022-01-01T13:48:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e29961c2-5f61-4736-99cd-d01c8c3d81fa', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2020-03-25T16:18:20', N'2020-03-25T16:19:29');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bceb9586-3c23-4f88-85a1-975e9d63d103', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'241e900d-b0f9-481e-b33a-76181de1be42', N'2020-02-14T19:38:13', N'2020-02-14T19:39:20');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7ff2bf34-4a89-4ec5-941f-29d5864157d9', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'2015-05-07T16:48:26', N'2015-05-07T16:49:59');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'54e0931e-f391-4393-a68a-163988612611', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2019-08-11T04:17:38', N'2019-08-11T04:19:49');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7bbdc0ef-bc01-43c9-831d-7141fb32cead', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2020-08-07T01:21:42', N'2020-08-07T01:24:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9fec5e11-d094-46ee-9002-0dab810ffbc2', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'2016-06-01T04:56:53', N'2016-06-01T04:59:08');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4d454af2-a05a-45c5-833f-2513da2d0b20', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2013-01-22T18:10:21', N'2013-01-22T18:11:20');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1fb6a99c-b612-4dd2-a002-78d67304bc15', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'820432b4-2171-43fe-b83b-539079ac8c75', N'2021-09-11T02:00:03', N'2021-09-11T02:04:03');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'3b455d91-a96b-43fb-950a-6907183ddce7', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'8dae23c2-fefd-4b62-b331-c5475342291a', N'2018-04-17T22:37:14', N'2018-04-17T22:41:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'35c10eb2-4bcc-49d7-b3db-9534caf0056d', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2014-10-30T21:32:21', N'2014-10-30T21:37:56');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'96b04036-6bd5-4273-8e80-81dfaddbc2c8', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'2022-09-21T03:40:24', N'2022-09-21T03:41:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'238d7a17-8c5d-4c95-9aa3-98d7380f52be', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'2019-09-08T04:42:16', N'2019-09-08T04:47:32');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'74241d9e-cca4-4e6d-816f-de2810dc9f0e', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'80e14268-87cf-4f3e-bc63-717a77f53df2', N'2014-12-06T02:16:54', N'2014-12-06T02:23:02');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1b9474f8-3b5e-4892-91db-e5fade7e9fbe', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'66148e25-e0fe-4c07-b06d-c5027de70351', N'2018-01-17T06:57:20', N'2018-01-17T06:58:59');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'80ae2f20-7863-483e-aea1-f45b4eb18a16', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2013-05-27T11:14:33', N'2013-05-27T11:17:45');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd88f1152-9c5d-4564-8209-a0b4281a16a4', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2020-03-01T12:57:43', N'2020-03-01T13:00:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'113fffd6-ac90-4527-bc81-51bb25ef3320', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'7677e88b-7774-491b-bec5-92e040b73307', N'2019-10-20T19:16:59', N'2019-10-20T19:19:28');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'63fdbca8-a987-4aeb-853f-7e774131bf3d', N'e934047c-d406-4c34-befc-6e49dbcb9c72', N'f766f5ab-3790-4cea-8457-a8d340a68781', N'2020-05-11T07:20:50', N'2020-05-11T07:21:45');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'baf4b4fc-222a-442f-8d02-c2736be376f0', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'56ed94bb-92c3-435b-aa46-2568ab6c26e3', N'2022-07-05T19:39:51', N'2022-07-05T19:43:46');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'77696333-dd68-4f7b-9558-afb8d7028d40', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'36455c1a-43fd-4ff1-a213-d9a7974bf1e7', N'2020-02-06T18:08:14', N'2020-02-06T18:10:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'716bb270-2bb6-44cb-8c02-00a03021984b', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'2015-05-12T20:52:26', N'2015-05-12T20:54:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'550a8429-a310-498e-8e22-949f0ec9cbcc', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2014-03-02T18:17:32', N'2014-03-02T18:24:01');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2b516937-9447-4fe0-98f9-24932507c2d2', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'66148e25-e0fe-4c07-b06d-c5027de70351', N'2022-12-06T21:54:09', N'2022-12-06T21:56:21');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'491c471e-c66f-48ec-b875-749d84d1bf92', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2021-09-29T17:37:22', N'2021-09-29T17:42:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8e601c06-b062-4371-a388-540f4e746490', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2015-05-24T21:23:50', N'2015-05-24T21:25:00');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'30fe88d8-bf89-45e9-b773-b77401af1a02', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2022-04-10T17:41:50', N'2022-04-10T17:44:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'079e4249-99cd-4c9f-b200-b24659130c4e', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'2022-01-12T12:18:52', N'2022-01-12T12:23:29');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b46d4506-b687-4c73-84c3-70ee20eaf4d0', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'2007-05-12T01:53:18', N'2007-05-12T01:54:43');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7f78e641-deb7-428f-9b51-e9a11f1edc4d', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'2016-01-13T20:03:45', N'2016-01-13T20:08:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'45c33866-6e6e-4d78-beaa-a567494a8336', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'52251189-f669-40b5-b8d7-016c9c899498', N'2014-11-22T09:37:34', N'2014-11-22T09:38:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'51f577c4-a1c3-43b1-a053-bc477012b09a', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'52251189-f669-40b5-b8d7-016c9c899498', N'2019-06-04T06:04:50', N'2019-06-04T06:06:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9dff7de1-8a69-4e51-8aa5-e7abaf5edfac', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2016-10-08T11:59:04', N'2016-10-08T12:00:07');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4800ce87-d363-4e4e-a366-667f2817ab57', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2012-07-26T11:45:12', N'2012-07-26T11:51:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'94eefa37-e816-4759-a014-7b0b9fc6efbd', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2020-01-04T15:24:04', N'2020-01-04T15:25:08');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4a340740-cdb1-42b5-9a6d-99c4a36acf5f', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'2016-01-10T03:29:53', N'2016-01-10T03:31:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7610bb00-f793-4572-8239-3a5808458100', N'861604b5-568f-48e5-baf1-8d6e5b653b9a', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2014-12-28T04:19:52', N'2014-12-28T04:21:15');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'333c696d-ac36-4284-90bc-cc9d5e79fe7a', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'2012-06-20T06:39:27', N'2012-06-20T06:40:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8ed6229d-5883-4c37-aaf0-1ea6d3bcdfce', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'de1373b9-aecb-42b2-b67d-59f1a004a06f', N'2019-03-05T11:30:51', N'2019-03-05T11:31:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'397753fd-e7ca-4309-902c-eb454ce35e79', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'bb489701-da9d-473b-ba5b-b38f9bc4d1c1', N'2013-09-22T16:25:54', N'2013-09-22T16:29:36');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'695071be-afcc-4dc3-b853-1959fa999111', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'eb54ba81-b12e-4736-b71d-fa8ccbb2cedc', N'2019-12-21T04:37:20', N'2019-12-21T04:41:48');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bff2e067-79ca-43f3-be0e-66c65f388cd9', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'8dae23c2-fefd-4b62-b331-c5475342291a', N'2017-02-25T23:12:50', N'2017-02-25T23:17:15');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b6b7da18-62c4-4a89-b623-a1979f58f612', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2020-01-27T21:27:27', N'2020-01-27T21:29:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a2c0f267-91d9-4567-87db-bb1971202a3b', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'6cc4b1ec-63dd-4850-9fba-17fc2b3ce97f', N'2018-03-01T09:59:14', N'2018-03-01T09:59:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f9ccaa2c-d0e8-4cca-ba09-8ccf3535f083', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'2014-07-29T13:35:51', N'2014-07-29T13:38:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8c2399d2-f5bf-4dd9-9cf5-957e159e1f84', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'241e900d-b0f9-481e-b33a-76181de1be42', N'2016-05-16T03:41:29', N'2016-05-16T03:42:35');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'996b7762-3d42-48fe-aa8c-981249ce0d07', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'b1a2de48-33fc-4923-9968-f7a1bc2214a3', N'2018-01-11T04:13:20', N'2018-01-11T04:15:49');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c08bb601-63bd-4f53-9d68-b8936b4ccbd7', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2018-04-11T08:08:52', N'2018-04-11T08:12:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'961650fc-4dc5-46ad-8451-439b615976e9', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'2019-09-08T01:14:52', N'2019-09-08T01:17:06');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f6c2cb52-04ea-42fb-bbd5-87e38dc8afc2', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'820432b4-2171-43fe-b83b-539079ac8c75', N'2022-07-21T05:49:24', N'2022-07-21T05:53:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'49587751-fca3-461b-b781-863a12c45b53', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2016-10-05T14:15:39', N'2016-10-05T14:22:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'25d5b521-9f45-4ad9-ad7a-8782233b20ee', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2017-04-10T02:35:21', N'2017-04-10T02:36:03');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a9d3ab1d-d2ea-4eef-b48a-b9575d6d6769', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'6cc4b1ec-63dd-4850-9fba-17fc2b3ce97f', N'2022-11-21T16:03:11', N'2022-11-21T16:05:09');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a1751dca-d477-4a19-bdca-8ec72b2c404c', N'a4ef5899-d6d6-49ae-ae37-9d59c93601fc', N'082acfbf-5005-4904-8e3a-cafdc194baa5', N'2016-02-07T06:44:54', N'2016-02-07T06:48:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b0c0af10-1175-446b-828b-e97702ae5fc3', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2013-06-22T00:41:38', N'2013-06-22T00:48:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2aebf9e2-d236-47b5-9b72-650b3ea8fb33', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'2e473d0e-1163-4422-921e-39f0794440ee', N'2016-10-24T12:16:18', N'2016-10-24T12:18:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e5ce9678-b4d1-4417-a8c3-a42b65c1dc0e', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'2007-02-04T09:39:31', N'2007-02-04T09:40:50');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'201ad5b9-f410-422a-978a-729d0e0df9a6', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'2022-03-28T21:01:57', N'2022-03-28T21:06:50');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f1eda2b0-c3e8-4d5a-b95c-2fb2f672f788', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2018-03-07T13:49:07', N'2018-03-07T13:52:33');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'47e12bc1-8385-470c-af73-c8cbf056aedf', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'80e14268-87cf-4f3e-bc63-717a77f53df2', N'2018-02-28T12:02:50', N'2018-02-28T12:09:57');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2c5fe597-0bdc-46e5-b440-6bfe71b63508', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'2017-03-01T17:22:58', N'2017-03-01T17:27:02');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bfd46a08-c345-4961-ad2c-ca647604d4de', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'2017-11-05T18:05:14', N'2017-11-05T18:06:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0bdb5222-7bb2-4fbb-832e-3b82045834f6', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'2022-04-01T22:02:32', N'2022-04-01T22:07:50');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'05cdad3e-27b1-4abe-9523-2fb02e4eb167', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2020-05-28T21:18:50', N'2020-05-28T21:22:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'057e53bc-bdc5-4e80-8aa1-57cb1bcf1394', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2013-12-18T22:49:15', N'2013-12-18T22:54:15');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0b18780a-7368-4d52-8d0c-69aec96bd68c', N'5d04f16f-c6a1-405e-b423-37b6c0a2a769', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2016-12-17T06:43:36', N'2016-12-17T06:49:49');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f76f95b6-0729-4d5a-903d-bcfd2842027b', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2021-03-13T22:40:40', N'2021-03-13T22:41:15');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'55c8d842-2bfc-47f8-b641-d12cb002ea30', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'2020-04-07T20:53:50', N'2020-04-07T20:55:48');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1d841cad-11f9-4624-bcda-cea06cea58b1', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'10bfebfd-f860-4ce4-8f17-f5f5f50f0e77', N'2013-07-20T15:41:31', N'2013-07-20T15:42:05');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd823e2ff-ec65-43a9-84ae-e1e05b836a37', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'bca76b28-db2b-428e-b8e9-61cb959d489d', N'2020-03-29T11:43:04', N'2020-03-29T11:45:58');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'fd9a1feb-61ad-482f-812c-9f9f3140a768', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'b22af0e4-05cb-49bd-8501-484544671ae2', N'2018-04-03T06:43:30', N'2018-04-03T06:45:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'cb30dba5-a827-4396-9f41-d0c9ee3d008a', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'2e473d0e-1163-4422-921e-39f0794440ee', N'2019-05-03T09:12:10', N'2019-05-03T09:16:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd7e6f5d0-be87-46fc-8fcc-2f0f2086bfcc', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2013-03-15T03:08:32', N'2013-03-15T03:09:48');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'76be6467-efe8-4483-9f76-511418bba151', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'2016-09-11T16:25:45', N'2016-09-11T16:28:10');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ec1999e0-756e-4fb3-ac94-86bd0b1f5b03', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'2012-06-11T20:05:28', N'2012-06-11T20:06:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'eb08c824-f1c2-469b-ad6a-131027199fea', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'36455c1a-43fd-4ff1-a213-d9a7974bf1e7', N'2019-11-28T18:38:23', N'2019-11-28T18:40:29');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'562673b4-4d03-4582-82cb-3f85f3d11926', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'082acfbf-5005-4904-8e3a-cafdc194baa5', N'2022-03-27T03:52:38', N'2022-03-27T03:54:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'03062802-0b15-435e-9825-fa0eb5703f1e', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2016-11-16T14:04:30', N'2016-11-16T14:05:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9a780393-e1a3-4cf6-a913-beed6f86eeb0', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'318d2440-d4d2-43ab-b94d-5d2d74aa4a1e', N'2022-11-19T19:14:30', N'2022-11-19T19:16:08');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f543214b-41cb-4dfc-b8c5-3546e96f4a1b', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'2e473d0e-1163-4422-921e-39f0794440ee', N'2014-01-15T21:31:51', N'2014-01-15T21:36:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd2f95b85-9b9d-4fc9-9b94-822f1bf2e4d2', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'80e14268-87cf-4f3e-bc63-717a77f53df2', N'2022-03-04T19:19:12', N'2022-03-04T19:20:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1d49d025-25fa-46e7-8246-5053e09b9059', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2018-12-02T02:12:07', N'2018-12-02T02:13:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd30f683a-f791-4b2a-b0b0-0b8dfdce1ee8', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2013-12-29T18:09:32', N'2013-12-29T18:18:33');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9e0131c3-da98-4fab-ac57-8fdd396994df', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'2021-02-13T02:53:35', N'2021-02-13T02:55:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'005f7b09-81ca-4648-97c7-2796b6e66220', N'2b6828b3-db2c-4420-b59a-a1e6bf016326', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2020-11-18T11:37:41', N'2020-11-18T11:38:40');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b98d0b9d-2b18-4ff8-ba98-66916bbc3dd9', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2022-03-02T23:39:36', N'2022-03-02T23:46:36');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c6c5e6f6-9911-4219-a5f7-b7f7867bf689', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'f85666e8-883a-42c9-8df9-916c5bcc71e7', N'2021-04-30T04:27:47', N'2021-04-30T04:30:00');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'17dc97ef-e7d7-4663-a7bf-39215f6792b6', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'e07a6845-120e-423d-b678-82c68d11fa8e', N'2014-03-05T14:04:44', N'2014-03-05T14:07:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f515f706-c092-4e1e-8bc1-beb75471b8e9', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'5400e862-3ac5-4a83-89e3-cddc5e756408', N'2019-03-14T22:21:58', N'2019-03-14T22:24:59');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'85549819-1faf-4ffa-8faf-6e4cf5601975', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2018-02-22T10:45:45', N'2018-02-22T10:52:52');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b1803b23-4b1c-44fd-af6e-f81eb1192afa', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'9d5cff8a-c175-4e4f-a19b-bca4e7f4638c', N'2019-03-05T13:21:42', N'2019-03-05T13:26:33');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6b300965-60c4-470d-9bf8-90746fbf3e4b', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'2012-02-15T06:12:40', N'2012-02-15T06:13:35');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a71d0de5-3e30-421d-9a71-65a9d3a18f00', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'f815e9c1-36d6-464d-8eb8-157aa8609fa8', N'2017-11-07T06:38:22', N'2017-11-07T06:46:00');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'9fb08245-81dd-4125-aaf3-876ed5e05595', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'fb14e03c-4d10-4f98-8d0a-e33e4bb2792c', N'2021-07-29T11:24:49', N'2021-07-29T11:27:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'52c45190-2947-41bf-949d-6b263b34d368', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2018-07-02T02:00:46', N'2018-07-02T02:03:22');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4095361f-8080-43ba-8318-ffe3857f1e6f', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'2017-08-02T16:20:48', N'2017-08-02T16:22:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'28b6ec09-4649-476e-903f-9f319a0441a2', N'c064d252-351a-44ae-ba42-69d5f54ccd3a', N'2a32a74a-0059-49ff-9996-c66b4e909fa9', N'2007-04-11T15:20:48', N'2007-04-11T15:24:58');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd236455d-660b-4f25-b46a-bafe9936cd61', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'52251189-f669-40b5-b8d7-016c9c899498', N'2017-03-23T20:13:55', N'2017-03-23T20:14:27');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'34eda153-fdc2-418d-a6ef-242338406add', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'5b8de61c-1045-4cfe-87aa-09637d19ed5b', N'2008-10-04T02:01:55', N'2008-10-04T02:05:09');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7f18a186-adb3-4566-9e03-90f8fd2fa08e', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'63cd0d97-0f3f-431e-87cb-baf354587d1b', N'2017-05-25T15:52:41', N'2017-05-25T15:53:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5ca30eef-32dd-40a2-93ce-a8707ee2cb07', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2015-02-23T06:43:00', N'2015-02-23T06:48:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'd043ede9-a359-4a8b-9e71-e7698810f7b0', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'b1a2de48-33fc-4923-9968-f7a1bc2214a3', N'2013-07-06T22:29:43', N'2013-07-06T22:32:26');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'997a833d-54f2-42d9-afc3-11f472a84563', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'8b94b289-7ea8-42c1-a610-10cd1e370c08', N'2013-11-04T19:07:23', N'2013-11-04T19:08:53');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'8be06656-bfa4-4504-9e3e-7d48ca04f764', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'2e473d0e-1163-4422-921e-39f0794440ee', N'2013-01-09T07:47:25', N'2013-01-09T07:49:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a2df8c5e-1692-435a-8d14-cea14edb4e9e', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2018-05-31T03:10:03', N'2018-05-31T03:12:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5a3a56c6-87b6-4dae-b180-c22fcfb3f421', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2022-06-24T19:00:32', N'2022-06-24T19:03:37');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'2a244810-86bd-4561-8fd8-59bfc9d6ad77', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2013-11-19T06:55:27', N'2013-11-19T06:57:07');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a3cf7598-2d18-43ee-8cd5-71b6cac93e6e', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2012-03-11T19:47:56', N'2012-03-11T19:50:11');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f5171333-8dac-4934-8a85-7435e04dbd67', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'518830d2-ce13-4bc3-aea7-29fbadbc0c3f', N'2009-03-25T06:06:59', N'2009-03-25T06:08:05');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'cbb9c8ee-9d83-47cb-ad0a-cf4c6cceb577', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2015-07-30T04:06:15', N'2015-07-30T04:11:49');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6ebfe584-0764-4b0d-9b13-dfb3397a127a', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'3c063d46-9c7b-41ee-8df2-613e9ca7fdb6', N'2019-03-05T04:06:00', N'2019-03-05T04:09:46');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1f150f2f-433b-4700-8937-472510dad48c', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'bf4a6697-e83a-4305-aabd-1c65494d47d3', N'2012-07-17T18:46:26', N'2012-07-17T18:48:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'451bac15-0d12-49d8-917e-4498a58bde40', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2019-05-19T16:52:29', N'2019-05-19T16:53:18');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'c3b946e0-bd66-4cce-9164-504efdec30ea', N'8a5f2c5c-bf83-403a-8a2c-373697f770a2', N'd1e7ff5a-c6f3-4859-8e1f-965c906a422e', N'2022-08-09T01:44:09', N'2022-08-09T01:46:09');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'a8ca86d1-39e5-446c-ae64-d3288943bb62', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2016-07-22T13:22:45', N'2016-07-22T13:26:24');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0c925732-1c5e-4ba9-b9ac-598919a20e35', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2022-06-17T06:06:44', N'2022-06-17T06:12:54');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'66f69838-0c89-4611-a994-81de0008289c', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'fbd0deff-36a3-4c8e-9806-11984b0a0516', N'2020-11-14T21:41:25', N'2020-11-14T21:46:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4e23bda0-dd8d-4018-8da1-b9da5f488ebd', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'0bea89c2-9ffe-4cb6-9484-875225fbae23', N'2014-10-07T11:13:35', N'2014-10-07T11:21:13');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'bd51cb44-efc2-464f-baa6-2a00867da5e1', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'ed7c71e3-0932-4b8c-beee-40e2e56fdeb7', N'2016-07-29T10:52:56', N'2016-07-29T10:56:58');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'133e7f33-f8c4-4b36-9157-6175d9951521', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'b22af0e4-05cb-49bd-8501-484544671ae2', N'2018-12-05T07:58:47', N'2018-12-05T08:00:19');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'0ab3236f-0f97-44da-8221-70b154430923', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'62de8a03-64b9-4590-9a93-555a8cb6a3d8', N'2020-04-18T10:41:19', N'2020-04-18T10:43:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'e70c329a-e517-4c0c-8c0d-c23517584ba2', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'4165ae13-4bd3-4453-8905-6aab07a83519', N'2017-02-02T05:13:08', N'2017-02-02T05:17:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'47e2195d-8a8f-4252-9360-596cd3183397', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'2015-11-25T09:29:19', N'2015-11-25T09:30:14');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'826a8b5c-f25e-4fcd-8bcf-bddc7b0eaaa5', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'79ddb93c-913f-43eb-8c53-1d5ab4aa6e98', N'2020-02-27T15:50:50', N'2020-02-27T15:51:59');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7661bb54-caf0-48b3-b30e-00dbd9b12383', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2016-07-21T09:19:26', N'2016-07-21T09:24:25');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'eab02f95-6bcb-48a3-87ec-7c7ed41ed657', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'828dfcf9-2838-465d-97a0-7eeef8f8a0cb', N'2017-09-05T15:15:23', N'2017-09-05T15:19:38');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'7a69cef9-5d00-4cd3-b9f2-a652ee71e797', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'ea84a252-154c-4cbc-b306-6dce8721ee88', N'2018-08-02T08:36:59', N'2018-08-02T08:40:17');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'6f05e84e-375f-4931-84d3-050561d9d6fa', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'10bfebfd-f860-4ce4-8f17-f5f5f50f0e77', N'2016-12-28T21:33:19', N'2016-12-28T21:34:23');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'5376b427-7225-4999-aea7-537f58162881', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2018-04-03T06:23:42', N'2018-04-03T06:27:34');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'669ea970-b7ec-4573-94ff-9afd8d11b23b', N'2ed6b2aa-8afa-428c-be8f-f6d4ebff60c5', N'63f89be3-9daf-4ba0-9bda-77cd951a88af', N'2013-11-24T21:03:13', N'2013-11-24T21:08:36');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'1fbf6f5a-9580-4d2f-ad3f-c83da8b3e1b4', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'db7df07e-70a6-49e4-ab2c-593c0640eaf5', N'2011-06-02T10:01:00', N'2011-06-02T10:01:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f9fea8b4-b2ce-40b5-9e0c-55cd4a549319', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2022-08-21T22:14:51', N'2022-08-21T22:21:06');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b9ef3590-49e7-4486-8212-1007ec6196ec', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'7677e88b-7774-491b-bec5-92e040b73307', N'2019-08-24T21:27:52', N'2019-08-24T21:28:30');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'4b804172-b2d4-41af-8878-131cb0c56576', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'9b71359a-52d1-4706-97fc-7ab7f4da07f0', N'2020-02-04T07:51:53', N'2020-02-04T07:53:50');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'08e67874-1a96-4cae-8377-d6ec728ab080', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'e24f16a8-463a-49d2-9eff-cd30c81f53e3', N'2018-03-22T13:38:21', N'2018-03-22T13:41:29');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'61bde413-85b0-4ab2-a7e7-bb35723cce75', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'56ac6786-6a93-49da-b8e1-8e9a01b4e860', N'2016-07-12T03:00:39', N'2016-07-12T03:01:31');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'35f91e95-baf5-4465-951e-f84a13b5edb7', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'66148e25-e0fe-4c07-b06d-c5027de70351', N'2010-07-06T03:29:02', N'2010-07-06T03:31:02');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'f798d36c-2223-40d0-85cd-8f00f250210b', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'6a59336d-d582-4bf7-af67-2375c6e15379', N'2011-11-09T14:36:42', N'2011-11-09T14:37:36');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'ee9f3695-df1a-46a6-b526-52089691cac8', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'f8df0175-b77f-4e06-adf9-d1ef62c25db5', N'2019-06-08T07:20:46', N'2019-06-08T07:21:39');
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES (N'b9cdfc93-72e6-41a8-8559-618ada975129', N'1abc5c3b-8261-4147-994d-c5d22ba5aca2', N'd1e32c26-330b-4909-af96-d6eb12896db2', N'2013-05-28T00:06:52', N'2013-05-28T00:11:27');