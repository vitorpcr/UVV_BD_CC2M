SELECT F.numero_departamento, D.nome_departamento,
AVG(F.salario)
FROM funcionario AS F
INNER JOIN departamento AS D
ON (F.numero_departamento = D.numero_departamento)
GROUP BY D.numero_departamento, F.numero_departamento
ORDER BY D.numero_departamento ASC;


SELECT CASE F.sexo
WHEN 'M' THEM 'masculino'
WHEN 'F' THEN 'feminino'
END AS "Sexo"
AVG(F.salario)
FROM funcionario AS F
ORDER BY F.sexo ASC;



SELECT D.nome_departamento,
CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
F.data_nascimento AS "data nascimento"
DATE_PART('year', AGE(CURRENT_DATE, F.data_nascimento)) AS "idade",
F.salario AS "salario"
FROM departamento AS D
INNER JOIN funcionario AS F
ON (D.numero_departamento = F.numero_departamento)
ORDER BY D.nome_departamento ASC;


SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
DATE_PART('year', AGE(CURRENT_DATE, F.data_nascimento)) AS "idade",
F.salario AS "salario atual",
F.salario * 1.2 AS "salario com reajuste"
FROM funcionario AS F
WHERE F.salario < 35.000
UNION
SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
DATE_PART('year', AGE(CURRENT_DATE, F.data_nascimento)) AS "idade",
F.salario AS "salario atual",
F.salario * 1.15 AS "salario com reajuste"
FROM funcionario AS F
WHERE F.salario >= 35.000
ORDER BY "Nome funcionario";


SELECT D.nome_departamento AS "Nome departamento",
CONCAT(F1.primeiro_nome, ' ',F1.nome_meio, ' ', F1.ultimo_nome) AS "Nome gerente",
CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario"
FROM departamento AS D, funcionario AS F
INNER JOIN funcionario AS F1
ON D.cpf_gerente = F2.cpf
ORDER BY D.nome_departamento ASC, F1.salario DESC;



SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
D.departamento AS "Nome departamento",
DP.nome_dependente AS "Nome dependente",
DATE_PART('year', AGE(CURRENT_DATE, DP.data_nascimento)) AS "idade dependente",
CASE DP.sexo
WHEN 'M' THEN "masculino"
WHEN 'F' THEN "feminino"
END AS "sexo dependente"
FROM funcionario AS F
INNER JOIN departamento AS D
ON F.numero_departamento = D.numero_departamento
INNER JOIN
dependente AS DP
ON F.cpf = DP.cpf_funcionario
ORDER BY "idade dependente" ASC;


SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
D.nome_departamento AS "nome_departamento",
f.salario AS "salario"
FROM funcionario AS F
INNER JOIN departamento AS D
ON F.numero_departamento = D.numero_departamento
WHERE NOT EXISTS F.cpf = dependente.cpf_funcionario
ORDER BY "Nome funcionario" ASC;


SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
D.nome_departamento AS "Nome departamento",
P.nome_projeto AS "Nome projeto",
T.horas AS "Horas trabalhadas"
FROM departamento AS D
projeto AS P
trabalha_em AS T
INNER JOIN funcionario AS F
ON F.cpf = T.cpf_funcionario
ORDER BY D.nome_departamento ASC, P.nome_projeto ASC, "Nome funcionario" ASC;


SELECT D.nome_departamento AS "Nome Departamento",
P.nome_projeto AS "Nome projeto",
SUM(T.horas) AS "Horas trabalhadas"
FROM trablha_em AS T, projeto AS P, departamento AS D
GROUP BY D.nome_departamento, P.nome_projeto
ORDER BY D.nome_departamento ASC, P.nome_projeto ASC;


SELECT D.nome_departamento AS "Nome departamento",
AVG(F.salario) AS "Media salarial"
FROM departamento AS D, funcionario AS F
GROUP BY D.nome_departamento
ORDER BY D.nome_departamento ASC;


SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
P.nome_projeto AS "Nome projeto", 
CAST(50 * T.horas AS MONEY) AS "valor"
FROM trabalha_em AS T 
projeto AS P
INNER JOIN funcionario AS F
ON T.cpf_funcionario = F.cpf
ORDER BY "Nome funcionario" ASC;

SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
D.nome_departamento AS "Nome departamento",
P.nome_projeto AS "Nome projeto"
FROM departamento AS D, projeto AS P, funcionario AS F
INNER JOIN trablha_em AS T
ON T.cpf_funcionario = F.cpf
WHERE T.horas IS NULL;


SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
CASE F.sexo
WHEN 'M' THEN 'masculino' 
WHEN 'F' THEN 'feminino' 
END AS "sexo",
DATE_PART('year', AGE(CURRENT_DATE, F.data_nascimento)) AS "idade",
FROM dependente AS DP
ORDER BY "idade" DESC;


SELECT D.nome_departamento AS "Nome departamento",
COUNT(F.cpf) AS "Numero funcionarios"
FROM departamento AS D, funcionario AS F
GROUP BY D.numero_departamento
ORDER BY "Nome departamento" ASC;


SELECT CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
P.nome_projeto AS "Nome projeto",
D.nome_departamento AS "Nome departamento"
FROM departamento AS D, projeto AS P, trabalha_em AS T
RIGHT OUTER JOIN funcionario AS F
ON T.cpf_funcionario = F.cpf
ORDER BY "Nome funcionario" ASC, "Nome departamento" ASC;





