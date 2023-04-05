SELECT
  Al.album_nome AS album,
  COUNT(*) AS favoritadas
FROM SpotifyClone.album AS Al
INNER JOIN cancoes AS C ON Al.album_id = C.album_id
INNER JOIN cancoes_favoritas AS Cf ON C.cancao_id = Cf.cancao_id
GROUP BY album
ORDER BY favoritadas DESC
LIMIT 3;
