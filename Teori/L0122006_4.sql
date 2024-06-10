--"Saya, Afif Imam Rahadi, dengan NIM L0122006, bersumpah demi Tuhan YME bahwa saya mengerjakan soal ujian ini berdasarkan
--hasil pencarian dan pemikiran saya sendiri dan tidak berkonsultasi pada teman lain
--melalui media apapun, ataupun mencari jawaban menggunakan bantuan AI. Saya siap
--menerima sanksi moral dan konsekuensi apapun apabila saya terbukti melanggar
--sumpah tersebut"

-- NOMOR 4

--Buatlah database routine sebagai berikut:
--A. User-defined function yang menerima argumen kode artikel dan mengembalikan nilai
--string berupa DOI sebuah artikel dalam format https://doi.org/10.(1000 + kode
--jurnal)/(kode artikel), sebagai contoh https://doi.org/10.1015/32 untuk kode jurnal 15
--dan kode artikel 32

CREATE FUNCTION dbo.GenerateDOI(@KdJurnal INT, @KdArtikel INT)
RETURNS VARCHAR(128)
AS
BEGIN
    DECLARE @DOI VARCHAR(128)
    SET @DOI = 'https://doi.org/10.' + CAST((1000 + @KdJurnal) AS VARCHAR(10)) + '/' + CAST(@KdArtikel AS VARCHAR(10))
    RETURN @DOI
END;

SELECT dbo.GenerateDOI(15, 32) AS DOI;

--B. Trigger yang dilaksanakan ketika terdapat penambahan dan perubahan artikel untuk
--mengisi atribut Doi pada tabel ARTIKEL, yang mana diisi dengan hasil eksekusi function
--dari soal sebelumnya untuk membuat DOI artikel yang bersangkutan. Gunakan virtual
--table untuk membuat trigger lebih efektif
CREATE OR ALTER TRIGGER trg_Artikel_InsertUpdateDoi
ON ARTIKEL
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @KdJurnal INT, @KdArtikel INT

    -- Mendapatkan KdJurnal dan KdArtikel dari baris yang dimasukkan atau diubah
    SELECT @KdJurnal = I.KdJurnal, @KdArtikel = I.KdArtikel
    FROM INSERTED I;

    -- Memperbarui atribut Doi dengan hasil dari fungsi GenerateDOI
    UPDATE ARTIKEL
    SET Doi = dbo.GenerateDOI(@KdJurnal, @KdArtikel)
    WHERE KdJurnal = @KdJurnal AND KdArtikel = @KdArtikel;
END;

--C. Stored procedure untuk membuat sebuah artikel dengan ketentuan:
--a. Apabila tidak ada abstrak (abstrak berupa string kosong), maka abstrak diisi
--dengan "Tidak ada abstrak"
--b. Tanggal submit diisi tanggal saat ini (melalui built-in function)
--c. Tanggal publikasi dan DOI diisi NULL
--d. Jumlah download diisi 0
--e. Memiliki satu penulis saja dan kode penulisnya dimasukkan melalui parameter
--stored procedure
CREATE OR ALTER PROCEDURE [buatArtikel]
    @KdPenulis INT
AS
BEGIN
    DECLARE @Abstrak VARCHAR(256)
    DECLARE @TanggalSubmit DATE

    -- Mendapatkan tanggal saat ini
    SET @TanggalSubmit = GETDATE()

    -- Menentukan apakah abstrak kosong atau tidak
    SELECT @Abstrak = COALESCE(NULLIF('', ''), 'Tidak ada abstrak')

    -- Memasukkan data artikel sesuai dengan ketentuan
    INSERT INTO [ARTIKEL] (KdJurnal, Judul, Abstrak, TglSubmit, TglPublikasi, JmlDownload, Doi)
    VALUES (NULL, 'Judul Artikel', @Abstrak, @TanggalSubmit, NULL, 0, NULL)

    -- Memasukkan relasi antara artikel dan penulis
    DECLARE @KdArtikel INT
    SET @KdArtikel = SCOPE_IDENTITY() -- Mendapatkan KdArtikel dari artikel yang baru saja dimasukkan
    INSERT INTO [PENULIS_ARTIKEL] (KdArtikel, KdPenulis)
    VALUES (@KdArtikel, @KdPenulis)
END
