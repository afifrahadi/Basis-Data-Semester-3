--"Saya, Afif Imam Rahadi, dengan NIM L0122006, bersumpah demi Tuhan YME bahwa saya mengerjakan soal ujian ini berdasarkan
--hasil pencarian dan pemikiran saya sendiri dan tidak berkonsultasi pada teman lain
--melalui media apapun, ataupun mencari jawaban menggunakan bantuan AI. Saya siap
--menerima sanksi moral dan konsekuensi apapun apabila saya terbukti melanggar
--sumpah tersebut"

-- NOMOR 2

USE PORTAL_RISET;

--Buatlah query SQL untuk menampilkan:
--A. Semua judul artikel dengan jumlah download lebih dari 500. Tampilkan jumlah
--downloadnya juga
SELECT 
	[Judul],
	[JmlDownload]
FROM 
	[ARTIKEL]
WHERE
	[JmlDownload] > 500;

--B. Semua judul artikel yang dipublikasikan di tahun 2022. Tampilkan tanggal publikasinya
--juga
SELECT 
	[Judul],
	[TglPublikasi]
FROM 
	[ARTIKEL]
WHERE
	YEAR([TglPublikasi]) = 2022;

--C. 10 judul artikel terbaru (berdasarkan tanggal publikasi). Urut menurun berdasarkan
--tanggal publikasinya
SELECT TOP 10
	[Judul], 
	[TglPublikasi]
FROM 
	[ARTIKEL]
ORDER BY
	[TglPublikasi] DESC;

--D. Top 10 judul artikel terpopuler (tingkat popularitas dalam bilangan real dirumuskan
--dengan jumlah download dibagi dengan jumlah hari sejak pertama kali dipublikasikan).
--Tampilkan skor tingkat popularitasnya juga

SELECT TOP 10
	[ARTIKEL].[Judul],
	[ARTIKEL].[TglPublikasi],
	[ARTIKEL].[JmlDownload],
	SUM([ARTIKEL].[JmlDownload] / DATEDIFF(DAY,[ARTIKEL].[TglPublikasi],GETDATE())) AS 'Tingkat Popularitas'
FROM
	[ARTIKEL]
GROUP BY
	[ARTIKEL].[Judul],[ARTIKEL].[TglPublikasi], [ARTIKEL].[JmlDownload]
ORDER BY
	'Tingkat Popularitas' DESC;