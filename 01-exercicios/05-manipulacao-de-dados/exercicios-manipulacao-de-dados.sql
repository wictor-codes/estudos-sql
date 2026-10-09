USE sakila;

-- 1. Crie uma cópia da tabela de atores (CREATE TABLE).
CREATE TABLE atores_backup as 
SELECT * FROM actor;

-- 2. Insira um ator novo na tabela (INSERT INTO, VALUES)
DESCRIBE atores_backup;

ALTER TABLE atores_backup
MODIFY actor_id INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (actor_id);

INSERT INTO atores_backup (actor_id, first_name, last_name)
VALUES (default, 'JOSÉ', 'RAMOS'),
	   (default, 'MARIA','LÚCIA');

-- 3. Altere o sobrenome de um ator específico (UPDATE, SET, WHERE).
UPDATE atores_backup
SET last_name = 'ANTÔNIO'
WHERE actor_id = 201;

-- 4. Apague os atores com sobrenome começando em "Z" (DELETE FROM, WHERE).
DELETE FROM atores_backup
WHERE actor_id IN (SELECT actor_id
                   FROM (SELECT actor_id
						FROM atores_backup
                        WHERE last_name LIKE 'Z%') AS atores_z
				  );