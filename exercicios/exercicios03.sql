-- Ex. 01
SELECT Departamento, max(salario) as maior_salario, min(salario) as menor_salario, avg(salario) as media_salario
FROM Funcionarios
GROUP BY Departamento;

-- Ex. 02
SELECT max(salario) as maior_salario, min(salario) as menor_salario, avg(salario) as media_salario
FROM Funcionarios;

-- Ex. 03
SELECT nome, sobrenome
FROM Funcionarios
WHERE Departamento IN ('Vendas', 'Marketing');

-- Ex. 04
SELECT nome, sobrenome
FROM Funcionarios
WHERE Departamento IN ('TI', 'Financeiro');

--Consulta com union dos exercícios 03 e 04
SELECT nome, sobrenome
FROM Funcionarios
WHERE Departamento IN ('Vendas', 'Marketing')
UNION
SELECT nome, sobrenome
FROM Funcionarios
WHERE Departamento IN ('TI', 'Financeiro');

-- Ex. 05
SELECT substring(nome, 1, 3)
FROM Funcionarios;

-- Ex. 06
SELECT sobrenome 
FROM Funcionarios
WHERE sobrenome LIKE 'S%';

-- Ex. 07
SELECT sobrenome
FROM Funcionarios
WHERE sobrenome ILIKE '%a';

-- Ex. 08
SELECT REPLACE(nome, 'a', 'x')
FROM Funcionarios;

-- Ex. 09
SELECT REPLACE(Departamento, 'Vendas', 'Comercial')
FROM Funcionarios;