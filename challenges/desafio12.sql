SELECT
    artista_nome As artista,
    CASE
        WHEN COUNT(F.cancao_id) >= 5 THEN 'A'
        WHEN COUNT(F.cancao_id) >= 3 THEN 'B'
        WHEN COUNT(F.cancao_id) >= 1 THEN 'C'
    ELSE '-'
    END AS ranking
FROM
  artistas
  INNER JOIN SpotifyClone.album ON album.artista_id = artistas.artista_id
  INNER JOIN SpotifyClone.cancoes ON cancoes.album_id = album.album_id
  LEFT JOIN SpotifyClone.cancoes_favoritas AS F ON F.cancao_id = cancoes.cancao_id
GROUP BY artista
ORDER BY
CASE
  ranking
  WHEN 'A' THEN 1
  WHEN 'B' THEN 2
  WHEN 'C' THEN 3
  ELSE 4
END ASC,
artista;