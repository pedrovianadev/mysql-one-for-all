-- Descomente e altere as linhas abaixo:

-- CREATE TABLE SpotifyClone.tabela(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;

-- INSERT INTO SpotifyClone.tabela (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');

USE SpotifyClone;

DROP TABLE IF EXISTS cancoes_favoritas;

CREATE TABLE cancoes_favoritas(
    pessoa_id INT,
    cancao_id INT,
    PRIMARY KEY (pessoa_id, cancao_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa(pessoa_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO cancoes_favoritas(pessoa_id, cancao_id)
VALUES
    (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
    (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);
