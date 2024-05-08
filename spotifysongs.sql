CREATE DATABASE IF NOT EXISTS spotifysongs;
CREATE TABLE spotify_songs (
    track_id VARCHAR(30) NOT NULL PRIMARY KEY,
    track_name TEXT,
    track_artist TEXT,
    track_popularity INTEGER,
    track_album_id TEXT,
    track_album_name TEXT,
    track_album_release_dTablesate DATE,
    playlist_name TEXT,
    playlist_id TEXT,
    playlist_genre TEXT,
    playlist_subgenre TEXT,
    danceability REAL,
    energy REAL,
    song_key INTEGER, -- Changed column name from 'key' to 'song_key'
    loudness REAL,
    mode INTEGER,
    speechiness REAL,
    acousticness REAL,
    instrumentalness REAL,
    liveness REAL,
    valence REAL,
    tempo REAL,
    duration_ms INTEGER
);
-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------
Data -- Exploration: Start by exploring the dataset with basic SQL queries to understand its structure and contents.
-- ------------------------- Get the count of songs in the dataset---------------------------------------------
SELECT COUNT(*) FROM spotify_songs;

-- List the top 10 songs by popularity
SELECT track_name, track_artist, track_popularity
FROM spotify_songs
ORDER BY track_popularity DESC
LIMIT 10;

-- Find the average popularity of songs in each playlist genre
SELECT playlist_genre, AVG(track_popularity) AS avg_popularity
FROM spotify_songs
GROUP BY playlist_genre;


-- Data Analysis: Perform more in-depth analysis using SQL queries to uncover insights about Spotify top songs.

-- Identify the most popular artists
SELECT track_artist, AVG(track_popularity) AS avg_popularity
FROM spotify_songs
GROUP BY track_artist
ORDER BY avg_popularity DESC
LIMIT 10;

-- Analyze the distribution of danceability and energy in different playlist genres
SELECT playlist_genre,
       AVG(danceability) AS avg_danceability,
       AVG(energy) AS avg_energy
FROM spotify_songs
GROUP BY playlist_genre;

-- Find the average song duration in each playlist subgenre
SELECT playlist_subgenre, AVG(duration_ms) AS avg_duration_ms
FROM spotify_songs
GROUP BY playlist_subgenre;

-- Distribution of playlists by genre
SELECT playlist_genre,
       COUNT(*) AS playlist_count
FROM spotify_songs
GROUP BY playlist_genre
ORDER BY playlist_count DESC;








