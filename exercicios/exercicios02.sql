--QUESTÃO 1
SELECT IDFuncionario, SUM(ValorVenda) valorVendas
FROM Vendas
GROUP BY IDFuncionario;

--QUESTÃO 2
SELECT Departamento, count(*)
FROM Funcionarios
GROUP BY Departamento;

--QUESTÃO 3
SELECT IDFuncionario, COUNT(IDVenda) as vendas
FROM Vendas
GROUP BY IDFuncionario
ORDER BY vendas desc
LIMIT 1;

--QUESTÃO 4
SELECT Departamento, count(IDFuncionario) as funcionarios, SUM(Salario)
FROM Funcionarios
GROUP BY Departamento
HAVING count(IDFuncionario) > 5;

--QUESTÃO 5
DO $$
DECLARE
    v_valor_vendas NUMERIC;
BEGIN	
	
    SELECT SUM(ValorVenda) INTO v_valor_vendas
	FROM Vendas
	WHERE EXTRACT(YEAR FROM DataVenda) = 2023;
	
	INSERT INTO Vendas (IDVenda, IDFuncionario, ValorVenda, DataVenda) VALUES (13, 1, 1500.00, '2023-01-15');

    IF v_valor_vendas > 100000 THEN
		COMMIT;
        RAISE NOTICE 'Total de vendas em 2023 > 100000: %', v_valor_vendas;
    ELSE
		ROLLBACK;
        RAISE NOTICE 'Total de vendas em 2023 < 100000: %', v_valor_vendas;
    END IF;
END;
$$;