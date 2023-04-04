SELECT 
	C.cancao_nome AS cancao,
	COUNT(H.cancao_id) AS reproducoes
FROM 
	SpotifyClone.historico AS H
	JOIN SpotifyClone.cancoes AS C ON C.cancao_id = H.cancao_id
GROUP BY C.cancao_nome
ORDER BY reproducoes DESC, C.cancao_nome
LIMIT 2;
