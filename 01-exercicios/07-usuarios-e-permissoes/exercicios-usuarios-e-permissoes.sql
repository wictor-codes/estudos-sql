USE sakila;

-- 1. Crie um usuário aluno_teste com senha fictícia.
CREATE USER aluno_teste@localhost IDENTIFIED BY '123';
SELECT * FROM mysql.user;

-- 2. Dê permissão só de leitura no Sakila e confira.
GRANT SELECT ON sakila.* TO aluno_teste@localhost;
SHOW GRANTS FOR aluno_teste@localhost;

-- 3. Dê todas as permissões em atores_backup (GRANT ALL).
GRANT ALL PRIVILEGES ON sakila.atores_backup
TO aluno_teste@localhost;
SHOW GRANTS FOR aluno_teste@localhost;

-- 4. Retire uma permissão (REVOKE) e confira de novo.
REVOKE update ON sakila.atores_backup FROM aluno_teste@localhost;
 SHOW GRANTS FOR aluno_teste@localhost;
 
-- 5. Apague o usuário (DROP USER).
DROP USER aluno_teste@localhost;
SELECT * FROM mysql.user;