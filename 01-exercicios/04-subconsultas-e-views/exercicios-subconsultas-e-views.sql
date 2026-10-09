USE sakila;

-- 1. Liste os filmes com duração acima da média geral (subconsulta).
SELECT title FROM film
WHERE length > (SELECT AVG(length) FROM film)
ORDER BY length ASC;

-- 2. Liste os clientes que fizeram algum pagamento acima de 10 (IN com subconsulta).
SELECT CONCAT(first_name,' ',last_name) as Nome_Completo
FROM customer
WHERE customer_id in (SELECT customer_id FROM payment
				      WHERE amount > 10)
ORDER BY Nome_Completo;

-- 3. Liste os filmes mais longos que qualquer filme classificado como G (> ANY).
SELECT title as Titulo, 
	   length as Duracao
FROM film
WHERE length > ANY (SELECT length FROM film
					WHERE rating = 'G')
ORDER BY Duração;

-- 4. Liste os filmes mais longos que o maior filme classificado como G (> ALL).
SELECT title as Titulo, 
	   length as Duracao
FROM film
WHERE length > ALL (SELECT length FROM film
					WHERE rating = 'G')
ORDER BY Duração;

-- 5. Crie uma view vw_filmes_categoria com título, categoria e duração, e depois use CREATE OR REPLACE VIEW para acrescentar a classificação.
-- 5a
CREATE VIEW vw_filmes_categoria as
SELECT f.title as Titulo,
	   cat.name as Categoria, 
       f.length as Duracao
FROM film f
JOIN film_category USING (film_id)
JOIN category cat USING (category_id);

SELECT * FROM vw_filmes_categoria;

-- 5b
CREATE OR REPLACE VIEW vw_filmes_categoria as
SELECT f.title as Titulo,
	   cat.name as Categoria, 
       f.length as Duracao,
       f.rating AS Classificacao
FROM film f
JOIN film_category USING (film_id)
JOIN category cat USING (category_id);

SELECT * FROM vw_filmes_categoria;