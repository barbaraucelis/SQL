SELECT CONCAT(SUBSTRING(first_name, 1, 1), LOWER(SUBSTRING(first_name, 2)), ' ', SUBSTRING(last_name, 1, 1), LOWER(SUBSTRING(last_name, 2))) 'Nome Completo' FROM sakila.actor;

SELECT COUNT(*) FROM sakila.actor;


SELECT rating, COUNT(film_id) FROM sakila.film GROUP BY rating;
SELECT rating, SUM(rental_rate) FROM sakila.film GROUP BY rating;
SELECT rating, MIN(rental_rate) FROM sakila.film GROUP BY rating;
SELECT rating, MAX(rental_rate) FROM sakila.film GROUP BY rating;
SELECT rating, SUM(rental_rate) total FROM sakila.film GROUP BY rating ORDER BY total DESC;

-- 1 - Na tabela actor, agrupe os registros pelo last_name para saber quantos atores têm o mesmo sobrenome.
SELECT last_name, COUNT(actor_id) total FROM sakila.actor GROUP BY last_name ORDER BY total DESC;

-- 2 - Na tabela customer, conte a quantidade de clientes ativos e inativos (bonus: colocar as palavras ativo e inativo, em vez de 0 e 1)
UPDATE sakila.customer SET active = 'Ativo' WHERE active = '0';

SELECT REPLACE(REPLACE(active, '1', 'Ativo'), '0', 'Inativo'), COUNT(customer_id) FROM sakila.customer GROUP BY active;

-- Pesquisar sobre o CASE WHEN

SELECT 
    city.city, country.country, address.district, customer.first_name
FROM
    sakila.city
        JOIN
    sakila.country ON city.country_id = country.country_id
        JOIN
    sakila.address ON city.city_id = address.city_id
		JOIN 
	sakila.customer ON address.address_id = customer.address_id;
    
    SELECT film.film_id, film.title, language.name FROM sakila.film JOIN sakila.language ON film.language_id = language.language_id;

-- 1 - Faça um select que recupere o nome do cliente na tabela customer e o distrito na tabela address.
SELECT
    CONCAT(customer.first_name,
            ' ',
            customer.last_name) nome,
    address.district
FROM
    customer
        JOIN
    address ON customer.address_id = address.address_id;

-- 2 - Busque a quantidade de filmes agrupando pelo idioma do filme.
SELECT
    language.name, COUNT(film.film_id)
FROM
    film
        JOIN
    language ON film.language_id = language.language_id
GROUP BY language.name;

-- 3 - Recupere o nome e sobrenome do cliente (customer) e a quantidade de locações (rental) que ele fez, com ordenação do maior para o menor.
SELECT
    customer.first_name,
    customer.last_name,
    COUNT(rental.rental_id) qtd
FROM
    customer
        JOIN
    rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY qtd DESC
