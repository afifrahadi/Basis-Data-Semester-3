-- Nama		: Afif Imam Rahadi
-- NIM		: L0122006
-- Kelas	: A

USE SPOTIFY;

-- BAGIAN A

CREATE TRIGGER trg_song_duration ON [SONG] AFTER INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SongID UNIQUEIDENTIFIER;

    -- Get the SongID for the inserted/updated record
    SELECT @SongID = ID FROM INSERTED;

    -- Update the Duration_Hours, Duration_Minutes, and Duration_Seconds
    UPDATE [SONG]
    SET
        Duration_Hours = DURATION / 3600,
        Duration_Minutes = (DURATION % 3600) / 60,
        Duration_Seconds = DURATION % 60
    WHERE ID = @SongID;
END;

INSERT INTO [SONG] ([ID], [AlbumID], [Title], [Duration]) VALUES (N'8b94b289-7ea8-42c1-a610-10cd1e370c99', N'd87cd1ac-0e27-408c-a85c-c91fae784b74', N'ALPATT AAHTv either research into body whatever set allow citizen behavior itself.', 573);

-- BAGIAN B
-- EXECUTE PERTAMA START
CREATE TRIGGER trg_stream_duration
ON [STREAM]
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StreamID UNIQUEIDENTIFIER;

    -- Get the SongID for the inserted/updated record
    SELECT @StreamID = ID FROM INSERTED;

	UPDATE [STREAM]
	SET
		[Duration] = DATEDIFF(MINUTE, [STREAM].[StartedAt], [STREAM].[FinishedAt])
	WHERE ID = @StreamID
END;
-- EXECUTE PERTAMA END

-- EXECUTE KEDUA START
SELECT TOP 5 * FROM [STREAM]
ORDER BY [Duration] DESC;
INSERT INTO [STREAM] ([ID], [UserID], [SongID], [StartedAt], [FinishedAt]) VALUES 
(N'07678621-db15-4311-b4cf-f0a026871138', N'61614d51-f108-4eb2-a47b-d1351137a6da', N'01e13545-61fa-4614-839d-f6a4a59ec4cc', N'2017-10-08T14:34:52', N'2017-10-08T14:42:47');
SELECT TOP 5 * FROM [STREAM]
ORDER BY [Duration] DESC;
-- EXECUTE KEDUA END

-- BAGIAN C

-- EXECUTE PERTAMA START
CREATE PROCEDURE usp_user_favorites(
@nTopArtist AS INT,
@userID AS UNIQUEIDENTIFIER)
AS
BEGIN
	SELECT TOP (@nTopArtist)
		[ARTIST].[ID],
		[ARTIST].[Name],
		COUNT([STREAM].[SongID]) AS 'Jumlah Streaming'
	FROM
		[ARTIST]
		JOIN [STREAM] ON @userID = [STREAM].[UserID]
		JOIN [SONG] ON [STREAM].[SongID] = [SONG].[ID]
		JOIN [ALBUM] ON [SONG].[AlbumID] = [ALBUM].[ID]
		-- JOIN [ARTIST] ON [ALBUM].[ArtistID] = [ARTIST].[ID]
	GROUP BY
		[ARTIST].[ID], [ARTIST].[Name]
	ORDER BY
		'Jumlah Streaming'
END;
-- EXECUTE PERTAMA END

-- EXECUTE KEDUA START
EXEC usp_user_favorites 60, '5d04f16f-c6a1-405e-b423-37b6c0a2a769';
EXEC usp_user_favorites 60, 'a4ef5899-d6d6-49ae-ae37-9d59c93601fc';
-- EXECUTE KEDUA END