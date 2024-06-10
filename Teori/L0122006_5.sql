--"Saya, Afif Imam Rahadi, dengan NIM L0122006, bersumpah demi Tuhan YME bahwa saya mengerjakan soal ujian ini berdasarkan
--hasil pencarian dan pemikiran saya sendiri dan tidak berkonsultasi pada teman lain
--melalui media apapun, ataupun mencari jawaban menggunakan bantuan AI. Saya siap
--menerima sanksi moral dan konsekuensi apapun apabila saya terbukti melanggar
--sumpah tersebut"

-- NOMOR 5

-- Format nama login baru
CREATE LOGIN research_alice
WITH PASSWORD = 'Primavera2018!'

CREATE LOGIN research_bob
WITH PASSWORD = 'Sprint2018!'

CREATE LOGIN research_charlie
WITH PASSWORD  = 'Gtsputih300!'

DROP USER IF EXISTS alice;
DROP USER IF EXISTS bob;
DROP USER IF EXISTS charlie;

-- Membuat User
CREATE USER alice
FOR LOGIN research_alice

CREATE USER bob
FOR LOGIN research_bob

CREATE USER charlie
FOR LOGIN research_charlie

-- PEMBUATAN ROLE

-- Role research_admin
CREATE ROLE research_admin

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[INSTITUSI] 
TO research_admin;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[PENULIS] 
TO research_admin;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[JURNAL] 
TO research_admin;

GRANT SELECT
ON OBJECT::[ARTIKEL] 
TO research_admin;

GRANT SELECT
ON OBJECT::[PENULIS_ARTIKEL] 
TO research_admin;

GRANT SELECT
ON OBJECT::[SITASI] 
TO research_admin;

-- Role research_user
CREATE ROLE research_user

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[ARTIKEL]
TO research_user;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[PENULIS_ARTIKEL]
TO research_user;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[SITASI]
TO research_user;

GRANT SELECT
ON OBJECT::[INSTITUSI] 
TO research_admin;

GRANT SELECT
ON OBJECT::[PENULIS] 
TO research_admin;

GRANT SELECT
ON OBJECT::[JURNAL] 
TO research_admin;

-- PEMBERIAN ROLE KE USER
ALTER ROLE research_admin
ADD MEMBER alice

ALTER ROLE research_user
ADD MEMBER bob 

ALTER ROLE research_user
ADD MEMBER charlie