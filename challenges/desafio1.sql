DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_nome VARCHAR(45) NOT NULL,
    plano_valor DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(45) NOT NULL,
    album_ano_lancamento INT NOT NULL,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao_nome VARCHAR(45) NOT NULL,
    cancao_duracao_segundos INT NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES album(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.pessoa(
    pessoa_id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_nome VARCHAR(45) NOT NULL,
    pessoa_idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo(
    artista_id INT,
    pessoa_id INT,
    PRIMARY KEY (artista_id, pessoa_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa(pessoa_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
    pessoa_id INT,
    cancao_id INT,
    historico_data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (pessoa_id, cancao_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa(pessoa_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (plano_nome, plano_valor)
VALUES
  ('gratuito', 0), -- 1
  ('universitário', 5.99), -- 2
  ('pessoal',6.99), -- 3
  ('familiar', 7.99); -- 4

INSERT INTO SpotifyClone.artistas (artista_nome)
VALUES
  ('Beyoncé'), -- 1
  ('Queen'), -- 2
  ('Elis Regina'), -- 3
  ('Baco Exu do Blues'), -- 4
  ('Blind Guardian'), -- 5
  ('Nina Simone'); -- 6

INSERT INTO SpotifyClone.album (artista_id, album_nome, album_ano_lancamento)
VALUES
  (1, 'Renaissance', 2022), -- 1
  (2, 'Jazz', 1978), -- 2
  (2, 'Hot Space', 1982), -- 3
  (3, 'Falso Brilhante', 1998), -- 4
  (3, 'Vento de Maio', 2001), -- 5
  (4, 'QVVJFA?', 2003), -- 6
  (5, 'Somewhere Far Beyond', 2007), -- 7
  (6, 'I Put A Spell On You', 2012); -- 8

INSERT INTO SpotifyClone.cancoes (cancao_nome, cancao_duracao_segundos, album_id)
VALUES
  ('BREAK MY SOUL', 279, 1), -- 1
  ("VIRGO'S GROOVE", 369, 1), -- 2
  ('ALIEN SUPERSTAR', 116, 1), -- 3
  ("Don't Stop Me Now", 203, 2), -- 4
  ('Under Pressure', 152, 3), -- 5
  ('Como Nossos Pais', 105, 4), -- 6
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5), -- 7
  ('Samba em Paris', 267, 6), -- 8
  ("The Bard's Song", 244, 7), -- 9
  ('Feeling Good', 100, 8); -- 10

INSERT INTO SpotifyClone.pessoa (pessoa_nome, pessoa_idade, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'), -- 1
  ('Robert Cecil Martin', 58, 1, '2017-01-06'), -- 2
  ('Ada Lovelace', 37, 4, '2017-12-30'), -- 3
  ('Martin Fowler', 46, 4, '2017-01-17'), -- 4
  ('Sandi Metz', 58, 4, '2018-04-29'), -- 5
  ('Paulo Freire', 19, 2, '2018-02-14'), -- 6
  ('Bell Hooks', 26, 2, '2018-01-05'), -- 7
  ('Christopher Alexander', 85, 3, '2019-06-05'), -- 8
  ('Judith Butler', 45, 3, '2020-05-13'), -- 9
  ('Jorge Amado', 58, 3, '2017-02-17'); -- 10

INSERT INTO SpotifyClone.seguindo (pessoa_id, artista_id)
VALUES
  ('1', '1'),
  ('1', '2'),
  ('1', '3'),
  ('2', '1'),
  ('2', '3'),
  ('3', '2'),
  ('4', '4'),
  ('5', '5'),
  ('5', '6'),
  ('6', '6'),
  ('6', '1'),
  ('7', '6'),
  ('9', '3'),
  ('10', '2');

INSERT INTO SpotifyClone.historico (pessoa_id, cancao_id, historico_data_reproducao)
VALUES
  ('1', '2', '2020-05-02 05:30:35'),
  ('1', '8', '2022-02-28 10:45:55'),
  ('1', '10', '2020-03-06 11:22:33'),
  ('2', '7', '2020-01-02 07:40:33'),
  ('2', '10', '2022-08-05 08:05:17'),
  ('3', '2', '2020-12-05 18:38:30'),
  ('3', '10', '2020-11-13 16:55:13'),
  ('4', '8', '2021-08-15 17:10:10'),
  ('5', '5', '2020-08-06 15:23:43'),
  ('5', '8', '2022-01-09 01:44:33'),
  ('6', '1', '2017-10-12 12:35:20'),
  ('6', '7', '2017-01-24 00:31:17'),
  ('7', '4', '2011-12-15 22:30:49'),
  ('8', '4', '2012-03-17 14:56:41'),
  ('9', '9', '2022-02-24 21:14:22'),
  ('10', '3', '2015-12-13 08:30:22');
