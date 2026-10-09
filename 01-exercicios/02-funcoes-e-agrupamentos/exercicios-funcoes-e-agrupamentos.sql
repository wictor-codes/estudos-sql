USE sakila;

-- 1. Quantos filmes existem em cada classificação (COUNT + GROUP BY)?
SELECT rating, COUNT(*) as Quantidade_Filmes
FROM film
GROUP BY rating
ORDER BY Quantidade_Filmes DESC;


-- 2. Qual a duração média e o valor médio de aluguel por classificação (AVG)?
SELECT rating, 
	   ROUND( AVG(rental_rate), 2) as Valor_Médio, -- arredonda a média a 2 casas decimais
       ROUND( AVG(length), 2) as Duração_Média
FROM film
GROUP BY rating
ORDER BY Valor_Médio;

-- 3. Qual o total pago por cada cliente? Mostre só quem pagou mais de 150 (SUM + HAVING).
SELECT customer_id, SUM(amount) as Total_Pago
FROM payment
GROUP BY customer_id
HAVING Total_Pago > 150
ORDER BY Total_Pago DESC;

-- 4. Mostre título e nome do cliente em minúsculas, junto com o tamanho do título (LOWER, LENGTH).
SELECT LOWER(film.title) as Titulo_Minusculo,
	   LOWER( CONCAT(customer.first_name, ' ', customer.last_name)) as Nome_Minusculo,
       LENGTH(film.title) as Tamanho_Titulo
FROM film
JOIN inventory using (film_id)
JOIN rental using (inventory_id)
JOIN customer using (customer_id)
ORDER BY first_name
LIMIT 20000;


-- 5. Junte first_name e last_name dos atores numa coluna só (CONCAT).
SELECT CONCAT(first_name, ' ', last_name) as Nome_Inteiro
FROM actor
ORDER BY first_name;

-- 6. Mostre as 3 primeiras letras do título (SUBSTRING) e substitua espaços por hífen (REPLACE).
SELECT substring(title, 1, 3) as Tres_Primeiras,
	   replace(title,' ','-') as Titulo_Hifen
FROM film;
