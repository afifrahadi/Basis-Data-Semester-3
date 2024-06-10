-- Nama		: Afif Imam Rahadi
-- NIM		: L0122006
-- Kelas	: A

USE SPOTIFY;

-- Nomor 1
SELECT
	[Name]
FROM
	[ARTIST]
WHERE 
	[Name] LIKE '%David%'
	OR
	[Name] LIKE '%Johnson%';

-- Nomor 2
SELECT 
	[Name],
	[ReleaseYear]
FROM
	[ALBUM]
WHERE
	[ReleaseYear] IN (2010,2015)
ORDER BY
	[ReleaseYear];

-- Nomor 3
SELECT 
	[Name],
	[ReleaseYear]
FROM
	[ALBUM]
WHERE
	[ReleaseYear] >= 2010
ORDER BY
	[ReleaseYear] DESC;

-- Nomor 4
SELECT
	[Title]
FROM
	[SONG]
WHERE
	LEN ([Title]) >50
ORDER BY
	[Title];

-- Nomor 5
SELECT TOP 10
    [Title],
    ROUND(CONVERT(FLOAT, [Duration]) / 60, 2) AS [Duration_minutes]
FROM 
	[SONG]
ORDER BY 
	[Duration_minutes] DESC;

-- Nomor 6 
SELECT Count(*) 
	[StartedAt]
FROM 
	[STREAM]
WHERE
	YEAR([StartedAt]) = 2019;

-- Nomor 7
SELECT Count(*) 
	[StartedAt]
FROM 
	[STREAM]
WHERE
	YEAR([StartedAt]) BETWEEN 2015 AND 2020;

-- Nomor 8
SELECT 
	COUNT (*) AS [JumlahStream < 3 menit]
FROM 
	[STREAM]
WHERE
	DATEDIFF(MINUTE,[StartedAt], [FinishedAt]) < 3;

-- Nomor 9
SELECT COUNT(*) AS [JumlahStream Sejak 18 Juli 2019]
FROM 
	[STREAM]
WHERE 
	[StartedAt] >= '2019-07-18';

-- Nomor 10
SELECT COUNT(*) AS [JumlahStream 3 Tahun Terakhir]
FROM 
	[STREAM]
WHERE 
	[StartedAt] >= DATEADD(YEAR, -3, GETDATE());