SELECT
	COUNT(H.data_reproducao) AS musicas_no_historico
FROM SpotifyClone.historico AS H
JOIN SpotifyClone.pessoa AS P ON P.pessoa_id = H.pessoa_id
WHERE P.pessoa_nome = 'Barbara Liskov';
