SELECT
    P.pessoa_nome AS pessoa_usuaria,
        IF(MAX(YEAR(data_reproducao)) >= 2021,
        'Ativa',
        'Inativa'
        ) AS status_pessoa_usuaria
FROM SpotifyClone.pessoa AS P
JOIN SpotifyClone.historico AS H ON H.pessoa_id = P.pessoa_id
GROUP BY P.pessoa_nome
ORDER BY P.pessoa_nome;
