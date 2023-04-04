SELECT
    COUNT(DISTINCT c.cancao_id) AS cancoes,
    COUNT(DISTINCT Ar.artista_id) AS artistas,
    COUNT(DISTINCT Al.album_id) AS albuns
FROM SpotifyClone.album Al
JOIN SpotifyClone.artistas Ar ON Al.artista_id = Ar.artista_id
JOIN SpotifyClone.cancoes c ON Al.album_id = c.album_id;
