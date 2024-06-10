-- Nama		: Afif Imam Rahadi
-- NIM		: L0122006
-- Kelas	: A

USE SPOTIFY;

-- BAGIAN A
SELECT 
	[ALBUM].[ID] AS 'ID Album',
	[ALBUM].[Name] AS 'Nama Album',
	COUNT ([SONG].[ID]) AS 'Jumlah Lagu',
	AVG ([SONG].[Duration]) AS 'Rata-rata Durasi Lagu',
	SUM ([SONG].[Duration]) AS 'Total Durasi Lagu'
FROM
	[ALBUM]
	FULL OUTER JOIN [SONG] ON [ALBUM].[ID] = [SONG].[AlbumID]
GROUP BY
	[ALBUM].[ID], [ALBUM].[NAME]
ORDER BY
	[ALBUM].[NAME]


-- BAGIAN B
SELECT 
	[ARTIST].[ID] AS 'ID Artis',
	[ARTIST].[Name] AS 'Nama Artis',
	COUNT ([SONG].[ID]) AS 'Jumlah Lagu'
FROM 
	[ARTIST]
INNER JOIN
	[ALBUM] ON [ARTIST].[ID] = [ALBUM].[ArtistID]
LEFT JOIN
	[SONG] ON [ALBUM].[ID] = [SONG].[AlbumID]
WHERE
	[ALBUM].[ReleaseYear] < 2010
GROUP BY
	[ARTIST].[ID], [ARTIST].[Name]
ORDER BY
	[ARTIST].[Name];

-- BAGIAN C
SELECT
	[GENRE].[ID] AS 'ID Genre',
	[GENRE].[Name] AS 'Nama Genre',
	COUNT ([SONG].[ID]) AS 'Jumlah Lagu'
FROM 
	[GENRE]
LEFT JOIN
	[SONG_GENRE] ON [GENRE].[ID] = [SONG_GENRE].[GenreID]
LEFT JOIN
	[SONG] ON [SONG_GENRE].[SongID] = [SONG].[ID]
GROUP BY
	[GENRE].[ID],
	[GENRE].[Name]
ORDER BY
	[GENRE].[Name]

-- BAGIAN D
SELECT
	[ARTIST].[ID] AS 'ID Artist',
	[ARTIST].[Name] AS 'Nama Artist',
	[GENRE].[ID] AS 'ID Genre',
	[GENRE].[Name] AS 'Nama Genre',
	COUNT ([SONG].[ID]) AS 'Jumlah Lagu'
FROM
	[ARTIST]
JOIN 
	[ALBUM] ON [ARTIST].[ID] = [ALBUM].[ArtistID]
JOIN 
	[SONG] ON [ALBUM].[ID] = [SONG].[AlbumID]
JOIN 
	[SONG_GENRE] ON [SONG].[ID] = [SONG_GENRE].[SongID]
JOIN 
	[GENRE] ON [SONG_GENRE].[GenreID] = [GENRE].ID
GROUP BY
	[ARTIST].[ID], 
	[ARTIST].[Name], 
	[GENRE].ID, 
	[GENRE].[Name]
ORDER BY
	[ARTIST].[NAME],
	[GENRE].[NAME];

-- BAGIAN E
SELECT TOP 5
	[SONG].[ID] AS 'ID Lagu',
	[SONG].[Title] AS 'Judul Lagu',
	COUNT ([STREAM].[SongID]) AS 'Jumlah Streaming'
FROM 
	[SONG]
JOIN
	[STREAM] ON [SONG].[ID] = [STREAM].[SongID]
GROUP BY 
	[SONG].[ID],
	[SONG].[Title]
ORDER BY
	COUNT ([STREAM].[SongID]) DESC;

-- BAGIAN F
SELECT TOP 5
	[ALBUM].[ID] AS 'ID Album',
	[ALBUM].[Name] AS 'Nama Album',
	[ALBUM].[ReleaseYear] AS 'Tahun Rilis Album',
	COUNT ([STREAM].[ID]) AS 'Jumlah Streaming'
FROM
	[ALBUM]
	INNER JOIN [SONG] ON [ALBUM].[ID] = [SONG].AlbumID
	LEFT JOIN [STREAM] ON [SONG].[ID] = [STREAM].[SongID]
WHERE
	[ALBUM].[ReleaseYear] >= 2010
GROUP BY
	[ALBUM].[ID], [ALBUM].[Name], [ALBUM].[ReleaseYear]
ORDER BY
	COUNT ([STREAM].[ID]) DESC;

-- BAGIAN G
SELECT TOP 3
	[ARTIST].[ID] AS 'ID Artist',
	[ARTIST].[Name] AS 'Nama Artist',
	COUNT ([STREAM].[ID]) AS 'Jumlah Streaming'
FROM
	[ARTIST]
INNER JOIN 
	[ALBUM] ON [ARTIST].[ID] = [ALBUM].[ArtistID]
INNER JOIN 
	[SONG] ON [ALBUM].[ID] = [SONG].[AlbumID]
LEFT JOIN 
	[STREAM] ON [SONG].[ID] = [STREAM].[SongID]
GROUP BY
	[ARTIST].[ID],
	[ARTIST].[Name]
ORDER BY
	COUNT ([STREAM].[ID]) DESC;

-- BAGIAN H 
SELECT TOP 3 
	[GENRE].ID AS 'ID Genre', 
	[GENRE].Name AS 'Nama Genre', 
	COUNT([STREAM].ID) AS 'Jumlah Streaming'
FROM [GENRE]
INNER JOIN 
	[SONG_GENRE] ON [GENRE].ID = [SONG_GENRE].GenreID
INNER JOIN 
	[SONG] ON [SONG_GENRE].SongID = [SONG].ID
LEFT JOIN 
	[STREAM] ON [SONG].ID = [STREAM].SongID
GROUP BY 
	[GENRE].ID, 
	[GENRE].[Name]
ORDER BY COUNT([STREAM].ID) DESC;

-- BAGIAN I
SELECT TOP 10
    [USER].ID AS 'ID User',
    [USER].Name AS 'Nama User',
    SUM(DATEDIFF(MINUTE, [STREAM].StartedAt, [STREAM].FinishedAt)) AS 'Akumulasi Durasi Streaming'
FROM 
	[USER]
LEFT JOIN 
	[STREAM] ON [USER].ID = [STREAM].UserID
GROUP BY 
	[USER].ID, 
	[USER].[Name]
ORDER BY SUM(DATEDIFF(MINUTE, [STREAM].StartedAt, [STREAM].FinishedAt)) DESC;


-- BAGIAN J
SELECT TOP 10
    [SONG].ID AS 'ID Lagu',
    [SONG].Title AS 'Judul Lagu',
    SUM(DATEDIFF(MINUTE, [STREAM].StartedAt, [STREAM].FinishedAt)) AS 'Akumulasi Durasi Streaming'
FROM 
	[SONG]
LEFT JOIN 
	[STREAM] ON [SONG].ID = [STREAM].SongID
WHERE 
	[STREAM].StartedAt >= '2015' 
GROUP BY 
	[SONG].ID, [SONG].Title
ORDER BY 
	SUM(DATEDIFF(MINUTE, [STREAM].StartedAt, [STREAM].FinishedAt)) DESC;