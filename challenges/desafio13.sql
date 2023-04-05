SELECT
	CASE
	    WHEN P.pessoa_idade <= 30 THEN 'Até 30 anos'
        WHEN P.pessoa_idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN P.pessoa_idade > 60 THEN 'Maior de 60 anos'
    END AS faixa_etaria,
	COUNT(DISTINCT P.pessoa_id) AS total_pessoas_usuarias,
    COUNT(F.pessoa_id) AS total_favoritadas
FROM pessoa AS P
LEFT JOIN cancoes_favoritas AS F ON P.pessoa_id = F.pessoa_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;
