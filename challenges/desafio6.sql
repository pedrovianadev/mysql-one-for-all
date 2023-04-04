SELECT
	FORMAT(MIN(PV.plano_valor), 2) AS faturamento_minimo,
    FORMAT(MAX(PV.plano_valor), 2) AS faturamento_maximo,
    CONVERT(ROUND(AVG(PV.plano_valor), 2), CHAR) AS faturamento_medio,
    CONVERT(ROUND(SUM(PV.plano_valor), 2), CHAR) AS faturamento_total
FROM
	SpotifyClone.pessoa AS P
    JOIN SpotifyClone.plano AS PV ON PV.plano_id = P.plano_id;
