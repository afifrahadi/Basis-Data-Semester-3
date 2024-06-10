-- Nama		: Afif Imam Rahadi
-- NIM		: L0122006
-- Kelas	: A

-- ADMINISTERING DATABASE

-- [Bagian A --> Setup User]

-- Format nama login baru
CREATE LOGIN spotify_jim
WITH PASSWORD = 'Primavera2018!'

CREATE LOGIN spotify_joe
WITH PASSWORD = 'Sprint2018!'

CREATE LOGIN spotify_john
WITH PASSWORD  = 'Gtsputih300!'

-- Membuat User
CREATE USER jim
FOR LOGIN spotify_jim

CREATE USER joe
FOR LOGIN spotify_joe

CREATE USER john
FOR LOGIN spotify_john

-- [Bagian B --> Penambahan Role]

-- a) Role r_app_manager
CREATE ROLE r_app_manager

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::GENRE
TO r_app_manager;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::[USER]
TO r_app_manager;

-- b) Role r_artist_manager
CREATE ROLE r_artist_manager

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::ARTIST
TO r_artist_manager;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::ALBUM
TO r_artist_manager;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::SONG
TO r_artist_manager;

GRANT INSERT, SELECT, UPDATE, DELETE
ON OBJECT::SONG_GENRE
TO r_artist_manager;

GRANT SELECT
ON OBJECT::ARTIST
TO r_artist_manager;

-- c) Role r_stream_manager
CREATE ROLE r_stream_manager

GRANT INSERT, SELECT, UPDATE
ON OBJECT::STREAM
TO r_stream_manager

GRANT SELECT
ON OBJECT::SONG
TO r_stream_manager

GRANT SELECT
ON OBJECT::[USER]
TO r_stream_manager

-- [Bagian C --> Penambahan User ke role yang ada]

-- a) jim dengan role r_app_manager
ALTER ROLE r_app_manager
ADD MEMBER jim

-- b) joe dengan role r_artist_manager
ALTER ROLE r_artist_manager
ADD MEMBER joe

-- c) john dengan role r_stream_manager
ALTER ROLE r_stream_manager
ADD MEMBER john
