-- 1- Selecione os dados da tabela country onde o atributo country é igual a “Brazil”

SELECT * FROM sakila.country WHERE country = 'Brazil';

-- 2- Ordene os dados da tabela film pelo nome do filme em ordem alfabética de Z-A

SELECT * FROM sakila.film ORDER BY title DESC;

-- 3- Selecione na tabela film todos os filmes que contenham o termo “beautiful” na descrição

SELECT * FROM sakila.film WHERE description LIKE '%beautiful%'