SELECT
    P.pessoa_nome AS pessoa_usuaria,
        COUNT(H.cancao_id) AS musicas_ouvidas,
        ROUND(SUM(C.cancao_duracao_segundos / 60), 2) AS total_minutos
FROM SpotifyClone.pessoa AS P
JOIN SpotifyClone.historico AS H ON H.pessoa_id = P.pessoa_id
JOIN SpotifyClone.cancoes AS C ON C.cancao_id = H.cancao_id
GROUP BY P.pessoa_nome
ORDER BY P.pessoa_nome;
