SELECT AVG(salario) FROM funcionario
ORDER BY departamento;

SELECT AVG(salario) FROM funcionario
WHERE sexo = H (AND sexo = M);

SELECT AVG(salario) FROM funcionario
WHERE sexo = M;

SELECT primeiro_nome, nome_meio, ultimo_nome, idade, salario,
CASE
    WHEN salario < 35.000 THEN salario = 28.000
    WHEN salario >= 35.000 THEN salario = 29.750
END;

SELECT nome_gerente, primeiro_nome,
FROM funcionario
ORDER BY (departamento ASC, salario DESC);

SELECT primeiro_nome, nome_meio, ultimo_nome, nome_departamento, salario,
FROM funcionario
WHERE nome_dependente IS NULL;
