SELECT artist_name, DENSE_RANK() OVER (ORDER BY appearances DESC) AS artist_rank
FROM (
    SELECT artists.artist_name, COUNT(*) AS appearances
    FROM artists
    INNER JOIN songs ON artists.artist_id = songs.artist_id
    INNER JOIN global_song_rank ON songs.song_id = global_song_rank.song_id
    WHERE global_song_rank.rank <= 10
    GROUP BY artists.artist_name
    ORDER BY appearances DESC
    LIMIT 5
) AS TopArtists;

'''
WITH TopArtists AS (
    SELECT artists.artist_name, COUNT(*) AS appearances
    FROM artists 
    INNER JOIN songs ON artists.artist_id = songs.artist_id
    INNER JOIN global_song_rank ON songs.song_id = global_song_rank.song_id
    WHERE global_song_rank.rank <= 10
    GROUP BY artists.artist_name
    ORDER BY appearances DESC
    LIMIT 5
)

SELECT artist_name, DENSE_RANK() OVER (ORDER BY appearances DESC) AS artist_rank
FROM TopArtists;
'''