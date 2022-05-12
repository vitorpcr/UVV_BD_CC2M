# Pset 2 - Professor Abrantes

---

**Em primero lugar**

***construi a estrutura completa de cada questão, utilizando os comandos adequados e em seguida fui inserindo os dados necessários.***

```
SELECT F.numero_departamento, D.nome_departamento,
AVG(F.salario)
FROM funcionario AS F
INNER JOIN departamento AS D
ON (F.numero_departamento = D.numero_departamento)
GROUP BY D.numero_departamento, F.numero_departamento
ORDER BY D.numero_departamento ASC;
```

* O select é utilizado para selecionar as tuplas(linhas) de cada coluna.

* O AVG é utlizado para calcular a média.

* O FROM é utilizado para selecionar as colunas.

* O INNER JOIN é utilizado para fazer a relação entre as tabelas.

* O GROUP BY vai reunir os dados em comum.

* E finalmente, o ORDER BY vai exibir a ordem desejada.

---

## Na segunda questão,
**utilizei o comando CASE para fazer a possibilidade do sexo ser masculino ou feminino, esse comando vem acompanhado pelo WHEN (quando) para definir quais possibilidades e END para declarar o final do CASE.**

```
SELECT CASE F.sexo
WHEN 'M' THEM 'masculino'
WHEN 'F' THEN 'feminino'
END AS "Sexo"
AVG(F.salario)
FROM funcionario AS F
ORDER BY F.sexo ASC;
```
---
## Na terceira questão,
**utilizei o comando CONCAT para unir o nome completo dos funcionarios, em seguida, DATE_PART para definir a data de nascimento como a idade em anos e para finalizar o INNER JOIN para fazer a relação entre as tabelas.

```
SELECT D.nome_departamento,
CONCAT(F.primeiro_nome, ' ',F.nome_meio, ' ', F.ultimo_nome) AS "Nome funcionario",
F.data_nascimento AS "data nascimento"
DATE_PART('year', AGE(CURRENT_DATE, F.data_nascimento)) AS "idade",
F.salario AS "salario"
FROM departamento AS D
INNER JOIN funcionario AS F
ON (D.numero_departamento = F.numero_departamento)
ORDER BY D.nome_departamento ASC;
```

## No decorrer do código, fui desenvolvendo minha ideias com os códigos citados a cima e com isso consegui concluir a atividade do Pset 2.

