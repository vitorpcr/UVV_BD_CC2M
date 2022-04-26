# Script PostgreSQL



## O QUE É UM SCHEMA?
São coleções de objetos dentro de um determinado banco de dados, que organizam vários aspectos e são importantes para segmentação da segurança, facilitando a administração dos objetos e dos dados.

## O QUE É UMA CONSTRAINT??


As CONSTRAINTS, que nada mais são restrições que você estabelece para uma coluna no banco de dados, que nada mais é de um método para validar a integridade de todos os dados que entram em sua base.



**Passo a Passo:**

1º - Criei todas as tabela através do CREATE TABLE e em seguida inseri as colunas com seus devidos atributos.

***Criando tabelas:***
---

*Nome:  funcionario ;*

*Tipo: TABLE ;*  

*Schema: elsmari ;*

***EXEMPLO***
```
CREATE TABLE elmasri.funcionario (
                cpf CHAR(11) NOT NULL DEFAULT nextval('elmasri.funcionario_cpf_seq'),
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo VARCHAR(1),
                salario NUMERIC(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT cpf PRIMARY KEY (cpf)
);

```


# INSERINDO DADOS 
---

2º - INSERI TODOS OS DADOS NA TABELA EM SUAS DEVIDAS COLUNAS UTILIZANDO O INSERT INTO E VALUES (valores), PARA DEFINIR OS VALORES DESEJADOS.



***Dados tabela funcionario:***

***EXEMPLO***
```
INSERT INTO elmasri.funcionario
(primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES
('joao','B', 'silva', '12345678966', '09-01-1965', 'Rua das Flores 751 São Paulo SP', 'M', 30.000, '33344555587', 5);
('Fernando','T', 'Wong', '33344555587', '08-12-1955', 'Rua das Lapa 34 São Paulo SP', 'M', 40.000, '88866555576', 5);
('Alice','J', 'Zelaya', '99988777767', '19-01-1968', 'Rua SOuza Lima 35 Curitiba PR', 'F', 25.000, '98765432168', 4);
('Jeniffer','S', 'Souza', '98765432168', '20-06-1941', 'Av Arthur de Lima 54 Santo Andre SP', 'F', 43.000, '88866555576', 4);
('Ronaldo','K', 'Lima', '66688444476', '15-09-1965', 'Rua Rebouças 65 Piracicaba SP', 'M', 38.000, '33344555587', 5);
('Joice','A', 'Leite', '45345345376', '31-07-1972', 'Av Lucas Obes 74 São Paulo SP', 'F', 25.000, '33344555587', 5);
('André','V', 'Pereira', '98798798733', '29-03-1969', 'Rua Timbira 35 São Paulo SP', 'M', 25.000, '98765432168', 4);
('Jorge','E', 'Brito', '88866555576', '10-11-1937', 'Rua do Horto 35 São Paulo SP', 'M', 55.000, 'null', 1);
```


# FAZENDO O RELACIONAMENTO ENTRE AS TABELAS

**Fazendo o relacionamento entre tabelas:**

3º - Fiz o relacionamento utilizando ALTER TABLE (alterando a tabela), em seguida, usei o REFERENCES para se referir a tabela desejada para fazer o relacionamento

***EXEMPLO***
```
ALTER TABLE elmasri.funcionario ADD CONSTRAINT funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
```
