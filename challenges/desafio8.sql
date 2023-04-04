SELECT
	Ar.artista_nome AS artista,
    Al.album_nome AS album
FROM SpotifyClone.artistas AS Ar
JOIN SpotifyClone.album AS Al ON Al.artista_id = Ar.artista_id
WHERE Ar.artista_nome = 'ELis Regina'
ORDER BY Al.album_nome;
