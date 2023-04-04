SELECT
    Ar.artista_nome AS artista,
    Al.album_nome AS album,
    COUNT(S.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas AS Ar
JOIN SpotifyClone.album AS Al ON Al.artista_id = Ar.artista_id
JOIN SpotifyClone.seguindo AS S ON S.artista_id = Ar.artista_id
GROUP BY Al.album_nome, Ar.artista_nome
ORDER BY pessoas_seguidoras DESC, artista, album;
