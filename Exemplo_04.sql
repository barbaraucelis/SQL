SELECT * FROM sakila.actor LIMIT 3;

SELECT last_name, COUNT(last_name) quantidade FROM sakila.actor GROUP BY last_name HAVING quantidade > 4;

-- Loja mais lucrativa
SELECT store.store_id, SUM(payment.amount) total
FROM sakila.payment
JOIN sakila.staff ON payment.staff_id = staff.staff_id
JOIN sakila.store ON staff.store_id = store.store_id
GROUP BY store.store_id

-- Clientes que mais alugaram filmes
SELECT first_name, last_name, COUNT(rental_id) qtd
FROM sakila.customer
JOIN sakila.rental ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY qtd DESC

-- Frequência de dias da semana em que filmes mais são alugados, sendo dias da semana no formato "segunda", "terça", etc e a frequência em percentual

SELECT 
	DAYNAME(rental.rental_date), 
	ROUND(COUNT(rental.rental_id) / (SELECT COUNT(rental_id) FROM sakila.rental) * 100, 2)
FROM sakila.rental
GROUP BY DAYNAME(rental.rental_date)
ORDER BY COUNT(rental.rental_id) DESC

-- Categoria mais lucrativa
SELECT category.name SUM(payment.amount) total
FROM sakila.payment
JOIN sakila.rental ON payment.rental_id = rental.rental_id
JOIN sakila.inventory ON inventory.inventory_id = rental.inventory_id
JOIN sakila.film ON film.film_id = inventory.film_id
JOIN sakila.film_category ON film.film_id = film_category.film_id
JOIN sakila.category ON film_category.category_id = category.category_id
GROUP BY category.category_id
ORDER BY total DESC;

-- quantos clientes novos a empresa adquiriu por mês? Considerando a data da primeira locação do cliente?
SELECT
    CONCAT(MONTHNAME(first_rental_date), '/',  YEAR(first_rental_date)) first_time,
    COUNT(customer_id) qtd
FROM
    (SELECT 
       customer_id, MIN(rental_date) first_rental_date
    FROM
        sakila.rental
    GROUP BY customer_id) tabela_derivada

GROUP BY first_time;