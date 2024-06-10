--"Saya, Afif Imam Rahadi, dengan NIM L0122006, bersumpah demi Tuhan YME bahwa saya mengerjakan soal ujian ini berdasarkan
--hasil pencarian dan pemikiran saya sendiri dan tidak berkonsultasi pada teman lain
--melalui media apapun, ataupun mencari jawaban menggunakan bantuan AI. Saya siap
--menerima sanksi moral dan konsekuensi apapun apabila saya terbukti melanggar
--sumpah tersebut"

-- NOMOR 3

--Buatlah query SQL untuk menampilkan:
--A. Top 10 artikel paling banyak didownload. Tampilkan judul artikel beserta nama jurnalnya
SELECT TOP 10
	[ARTIKEL].[Judul],
	[ARTIKEL].[JmlDownload],
	[JURNAL].[Nama]
FROM
	[ARTIKEL]
JOIN
	[JURNAL] ON [ARTIKEL].[KdArtikel] = [Jurnal].[KdJurnal]
ORDER BY
	[ARTIKEL].[JmlDownload] DESC;

--B. Semua nama jurnal beserta rata-rata lama publikasinya (jumlah hari antara tanggal submit
--dengan tanggal publikasi). Tampilkan urut menaik berdasarkan rata-rata lama
--publikasinya
SELECT 
	[JURNAL].[Nama],
	AVG(DATEDIFF(DAY, [ARTIKEL].[TglSubmit], [ARTIKEL].[TglPublikasi])) AS 'AVG Lama Publikasi'
FROM 
	[JURNAL]
JOIN
	[ARTIKEL] ON [JURNAL].[KdJurnal] = [Artikel].[KdJurnal]
GROUP BY
	[JURNAL].[Nama]
ORDER BY
	'AVG Lama Publikasi' ASC;
	
--C. Semua judul artikel yang hanya memiliki 1 penulis
SELECT
	[ARTIKEL].[Judul],
	COUNT([PENULIS_ARTIKEL].[KdPenulis]) AS 'Jumlah Penulis'
FROM 
	[ARTIKEL]
JOIN 
	[PENULIS_ARTIKEL] ON [ARTIKEL].[KdArtikel] = [PENULIS_ARTIKEL].[KdArtikel]


--D. Semua judul artikel yang semua penulisnya dari institusi yang sama
SELECT
    [ARTIKEL].[Judul],
	[ARTIKEL].[KdArtikel],
	[PENULIS_ARTIKEL].[KdPenulis],
	[PENULIS].[Nama]
FROM
    [ARTIKEL]
JOIN 
	[PENULIS_ARTIKEL] ON [ARTIKEL].[KdArtikel] = [PENULIS_ARTIKEL].[KdArtikel]
JOIN 
	[PENULIS] ON [PENULIS_ARTIKEL].[KdPenulis] = [PENULIS].[KdPenulis]
GROUP BY
    [ARTIKEL].[Judul], [ARTIKEL].[KdArtikel], [PENULIS_ARTIKEL].[KdPenulis],[PENULIS].[Nama]
HAVING
    COUNT(DISTINCT [PENULIS].[KdInstitusi]) = 1
ORDER BY
	[ARTIKEL].[Judul];

--E. Semua nama jurnal beserta nilai impactnya dalam bilangan real. Rumus nilai impact
--adalah jumlah semua rujukan yang mengarah ke artikel-artikel dari jurnal tersebut dibagi
--dengan jumlah artikel dari jurnal tersebut. Tampilkan urut menurun berdasarkan nilai
--impactnya
SELECT
    [JURNAL].[Nama],
    SUM(CASE WHEN [SITASI].[KdArtikelRujukan] IS NOT NULL THEN 1 ELSE 0 END) / COUNT([ARTIKEL].[KdArtikel]) AS 'Nilai Impact'
FROM
    [JURNAL]
JOIN 
	[ARTIKEL] ON [JURNAL].[KdJurnal] = [ARTIKEL].[KdJurnal]
JOIN 
	[SITASI] ON [ARTIKEL].[KdArtikel] = [SITASI].[KdArtikel]
GROUP BY
    [JURNAL].[Nama]
ORDER BY
    'Nilai Impact' DESC;

--F. Semua nama institusi beserta nilai kontribusinya dalam bilangan real. Rumus nilai
--kontribusi adalah jumlahan semua nilai kontribusi per artikel oleh institusi tersebut, yang
--mana nilai kontribusi per artikel dirumuskan sebagai jumlah penulis dari institusi yang
--bersangkutan per jumlah semua penulis artikel tersebut (misal terdapat sebuah artikel
--dengan 1 penulis dari sebuah institusi dan 3 penulis lainnya dari institusi yang lain, maka
--nilai kontribusi institusi untuk artikel tersebut adalah 0.25). Tampilkan urut menurun
--berdasarkan nilai kontribusinya

SELECT 
    [INSTITUSI].[Nama],
    SUM(CASE WHEN [PENULIS].[KdPenulis] IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*) AS 'Nilai Kontribusi'
FROM 
    [INSTITUSI]
JOIN 
    [PENULIS] ON [INSTITUSI].[KdInstitusi] = [PENULIS].[KdInstitusi]
JOIN 
    [PENULIS_ARTIKEL] ON [PENULIS].[KdPenulis] = [PENULIS_ARTIKEL].[KdPenulis]
GROUP BY 
    [INSTITUSI].[Nama]
ORDER BY 
    'Nilai Kontribusi' DESC;

