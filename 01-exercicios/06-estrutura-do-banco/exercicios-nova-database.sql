
-- 1. Crie um banco escola com CREATE DATABASE e, depois de testar, apague com DROP DATABASE.
CREATE DATABASE escola;
-- DROP DATABASE escola;

-- 2. Crie as tabelas cursos e alunos, usando tipos variados (INT, VARCHAR, DATE, DECIMAL) e chave primária.
USE escola;
CREATE TABLE alunos (aluno_id INT NOT NULL AUTO_INCREMENT,
					nome VARCHAR(50) NOT NULL,
                    data_matricula DATE NOT NULL,
                    rendimento_total DECIMAL(5,2) NOT NULL, -- máximo 2 casas decimais, sobrando 3 digitos para %
                    primary key (aluno_id) );
                    
CREATE TABLE cursos (curso_id INT NOT NULL AUTO_INCREMENT,
					nome VARCHAR(100) NOT NULL,
                    data_lancamento DATE NOT NULL,
                    aproveitamento_geral DECIMAL(5,2) NOT NULL,
                    primary key (curso_id) );
                    
-- 3. Acrescente uma coluna email na tabela alunos (ALTER TABLE ... ADD).
ALTER TABLE alunos ADD email VARCHAR(50);

-- 4. Crie uma chave estrangeira ligando alunos a cursos (REFERENCES) e tente inserir um aluno com curso inexistente para ver o erro.
ALTER TABLE alunos ADD curso_id INT NOT NULL, 
				   ADD FOREIGN KEY (curso_id) references cursos (curso_id);

