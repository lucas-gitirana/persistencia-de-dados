--CRIAÇÃO DAS TABELAS:
--Alunos
CREATE TABLE aluno(
	codigo SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	data_nascimento DATE,	
	cpf VARCHAR(20),
	endereco TEXT,
	telefone VARCHAR(20)
);

--Professores
CREATE TABLE professor(
	codigo SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	especialidade VARCHAR(100),
	cpf VARCHAR(20),
	endereco TEXT,
	telefone VARCHAR(20)
);

--Disciplinas
CREATE TABLE disciplina(
	codigo SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	carga_horaria NUMERIC
);

--Classes 
CREATE TABLE classe(
	codigo SERIAL PRIMARY KEY,
	codigo_disciplina SERIAL,
	codigo_professor SERIAL,
	semestre_ano VARCHAR(6),
	FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo),
	FOREIGN KEY (codigo_professor) REFERENCES professor(codigo)
);

--Matrículas
CREATE TABLE matricula(
	codigo SERIAL PRIMARY KEY,
	codigo_aluno SERIAL,
	codigo_classe SERIAL,
	FOREIGN KEY (codigo_aluno) REFERENCES aluno(codigo),
	FOREIGN KEY (codigo_classe) REFERENCES classe(codigo)
);

--REGRAS DE NEGÓCIO
-- 4. A carga horária de uma disciplina não pode ser menor que 1 hora.
ALTER TABLE disciplina 
ADD CONSTRAINT check_carga_horaria
CHECK (carga_horaria >= 1);

--INSERIR DADOS
INSERT INTO aluno (nome, data_nascimento, cpf, endereco, telefone) VALUES
('João Silva', '2000-05-15', '123.456.789-00', 'Rua das Flores, 123', '(11) 98765-4321'),
('Maria Oliveira', '1999-10-20', '234.567.890-11', 'Avenida Central, 456', '(21) 98765-4322'),
('Carlos Santos', '2001-03-10', '345.678.901-22', 'Rua das Laranjeiras, 789', '(31) 98765-4323');

INSERT INTO professor (nome, especialidade, cpf, endereco, telefone) VALUES
('Ana Souza', 'Matemática', '456.789.012-33', 'Rua dos Sabiás, 101', '(41) 98765-4324'),
('Ricardo Lima', 'História', '567.890.123-44', 'Praça das Árvores, 202', '(51) 98765-4325'),
('Fernanda Costa', 'Química', '678.901.234-55', 'Rua das Palmeiras, 303', '(61) 98765-4326');

INSERT INTO disciplina (nome, carga_horaria) VALUES
('Matemática Básica', 60),
('História Geral', 45),
('Química Orgânica', 75);

INSERT INTO classe (codigo_disciplina, codigo_professor, semestre_ano) VALUES
(1, 1, '1/2024'),  -- Matemática Básica, Ana Souza 
(2, 2, '1/2024'),  -- História Geral,Ricardo Lima 
(3, 3, '2/2024');  -- Química Orgânica, Fernanda Costa

INSERT INTO matricula (codigo_aluno, codigo_classe)
VALUES
(1, 1),  -- João Silva, Matemática Básica
(2, 2),  -- Maria Oliveira, História Geral
(3, 3);  -- Carlos Santos, Química Orgânica

--LISTAGENS
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM disciplina;
SELECT * FROM classe;
SELECT * FROM matricula;
