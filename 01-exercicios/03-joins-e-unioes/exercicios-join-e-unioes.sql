USE sakila;

-- 1. Liste o título de cada filme com o nome da sua categoria (INNER JOIN ... ON, tabelas film, film_category, category).
SELECT f.title as Titulo, cat.name as Categoria 
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category cat ON fc.category_id = cat.category_id
ORDER BY Titulo; 

-- 2. Refaça o exercício anterior com USING (film_id) onde der, e compare com o ON.
SELECT f.title as Titulo, cat.name as Categoria 
FROM film f 
INNER JOIN film_category fc USING (film_id)
INNER JOIN category cat USING (category_id)
ORDER BY Titulo; 
 -- o USING só funciona porque as colunas relacionadas tem o mesmo nome
 
-- 3. Liste os atores do filme ACADEMY DINOSAUR.
SELECT CONCAT(ac.first_name,' ',ac.last_name) as Nome_Ator
FROM actor ac
INNER JOIN film_actor USING (actor_id)
INNER JOIN film f USING (film_id)
WHERE f.title = 'ACADEMY DINOSAUR'
ORDER BY Nome_Ator;

-- 4. Mostre cada cliente com a cidade e o país onde mora (customer, address, city, country), usando apelidos nas tabelas.
SELECT CONCAT(cus.first_name,' ',cus.last_name) as Nome_Completo,
	   ci.city as Cidade,
       co.country as País
FROM customer cus
INNER JOIN address USING (address_id)
INNER JOIN city ci USING (city_id)
INNER JOIN country co USING (country_id)
ORDER BY Nome_Completo;

-- 5. Faça uma lista única com nomes de atores e de clientes (UNION) e depois com UNION ALL. Compare quantas linhas cada um traz.

-- union (remove valores duplicados) 
SELECT COUNT(*) as Total_Linhas
FROM (SELECT first_name FROM actor
	  UNION 
	  SELECT first_name FROM customer
	 ) as Nomes;
     
-- retorno: 647 linhas


-- union all (não remove valores duplicados) - 799
SELECT COUNT(*) as Total_Linhas
FROM (SELECT first_name FROM actor
	  UNION ALL
	  SELECT first_name FROM customer
	 ) as Nomes;
     
-- retorno: 799 linhas
