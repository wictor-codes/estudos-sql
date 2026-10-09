USE sakila;

-- 1. Título e duração dos filmes com mais de 150 minutos, do mais longo para o mais curto.
SELECT title, length 
FROM film
WHERE length > 150 
ORDER BY length DESC;

-- 2. Título, rating e rental_rate dos filmes PG-13 ou R e com rental_rate menor que 3 (AND/OR).
SELECT title, rating, rental_rate
FROM film
WHERE (rating = 'PG-13' OR rating = 'R') AND rental_rate < 3; 

-- 3. Filmes que não são G (NOT).
SELECT * FROM film
WHERE NOT rating = 'G';

-- 4. Filmes com classificação G, PG ou PG-13 (IN).
SELECT * FROM film
WHERE rating in ('G', 'PG', 'PG-13');

-- 5. Título e duração de filmes com duração entre 90 e 120 minutos (BETWEEN).
SELECT title, length
FROM film
WHERE length between 90 and 120
ORDER BY length ASC;

-- 6. Clientes cujo primeiro nome começa com "A" (LIKE).
SELECT customer_id, first_name
FROM customer
WHERE first_name LIKE 'A%';

-- 7. Filmes cujo original_language_id é nulo (IS NULL).
SELECT * FROM film
WHERE original_language_id IS NULL;

-- 8. 10 maiores pagamentos da tabela payment (LIMIT).
SELECT * FROM payment
ORDER BY amount DESC, payment_id ASC
LIMIT 10;

-- 9. Filmes cujo título começa com A ou com B seguido de vogal (REGEXP).
SELECT title FROM film
WHERE title REGEXP '^A|^B[AEIOU]'  
ORDER BY title; 

-- 10. Crie uma coluna calculada com a duração em horas (length / 60) e dê o apelido Duracao_horas (alias).
SELECT film_id, title, ROUND(length/60, 1) as Duracao_horas    -- arredonda com 1 casa decimal
FROM film
ORDER BY Duracao_horas DESC;