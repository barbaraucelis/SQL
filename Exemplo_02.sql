SELECT * FROM sakila.actor;

-- insert completo
INSERT sakila.actor VALUES (201, 'TOM', 'CRUISE', '2020-01-01');

-- insert parcial
INSERT sakila.actor(first_name, last_name) VALUES
('TOM', 'CRUISE'),
('LEONARDO', 'DICAPRIO'),
('LEONARDO', 'DICAPRIO'),
('LEONARDO', 'DICAPRIO'),
('LEONARDO', 'DICAPRIO');

INSERT INTO sakila.city(city, country_id) VALUES ('Magé', 11);
DELETE FROM sakila.city WHERE city_id = 601;

-- CONSTRAINT: FOREIGN KEY, PRIMARY KEY, UNIQUE, NOT NULL, CHECK

UPDATE sakila.city SET country_id = 16, city = 'Rio de Janeiro' WHERE city_id = 600 OR city_id = 599;

-- 1- Insira um novo ator na tabela actor passando MANUALMENTE todos os dados, incluindo actor_id e last_update

INSERT sakila.actor VALUES(208, 'JOHNNY', 'DEPP', '2023-01-24');

-- 2- Atualize na tabela film o valor dos atributos rental_duration para 10, replacement_cost para 5.00 do filme “Citizen Shrek”

UPDATE sakila.film SET rental_duration = 10, replacement_cost = 5.00 WHERE title = 'Citizen Shrek';

-- 3- Tente deletar o ator que você criou no exercício 1. Depois tente deletar um ator que você não criou.

DELETE FROM sakila.actor WHERE actor_id = 208;


-- DDL Data Definition Language: CREATE TABLE, ALTER TABLE e DROP TABLE

CREATE TABLE sakila.fruta (
	nome VARCHAR(50) NOT NULL UNIQUE,
    cor VARCHAR(20)
);

ALTER TABLE sakila.fruta
ADD COLUMN fruta_id SMALLINT UNSIGNED AUTO_INCREMENT,
ADD PRIMARY KEY (fruta_id);

ALTER TABLE sakila.fruta
MODIFY nome VARCHAR(100);

ALTER TABLE sakila.fruta
DROP COLUMN cor;

ALTER TABLE sakila.fruta
ADD COLUMN calorias SMALLINT CHECK(calorias > 50 AND calorias < 1000);

INSERT sakila.fruta(nome, calorias) VALUES('banana', 59);

ALTER TABLE sakila.fruta
ADD COLUMN country_id SMALLINT UNSIGNED,
ADD FOREIGN KEY (country_id) REFERENCES sakila.country(country_id)

