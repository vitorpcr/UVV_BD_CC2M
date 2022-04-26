CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo VARCHAR(1),
                salario NUMERIC(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                PRIMARY KEY (cpf),
               
);


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
               
);




CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
               
);




CREATE UNIQUE INDEX nome_departamento
ON departamento
(nome_departamento);



CREATE TABLE localizacoes_departamento (
                numero_departamento INTEGER NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY(numero_departamento, local)
               
);



CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                local_projeto VARCHAR(15),
                CONSTRAINT numero_projeto PRIMARY KEY (numero_projeto)
);




CREATE UNIQUE INDEX nome_projeto
ON projeto
(nome_projeto);


CREATE TABLE trabalha_em (

               /// cpf_funcionario mudar e colocar os dados///
                numero_projeto INTEGER NOT NULL,
                horas NUMERIC(3,1) NOT NULL
                
);




ALTER TABLE elmasri.funcionario 
ADD CONSTRAINT funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf);


ALTER TABLE elmasri.dependente 
ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario(cpf);


ALTER TABLE elmasri.departamento
ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf);


ALTER TABLE elmasri.trabalha_em 
ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf);


ALTER TABLE elmasri.projeto 
ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento);


ALTER TABLE elmasri.localizacoes_departamento 
ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento);


ALTER TABLE elmasri.trabalha_em 
ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto);

ALTER TABLE elmasri.trabalha_em 
ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf);




INSERT INTO elmasri.funcionario
(primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
values
('joao','B', 'silva', '12345678966', '09-01-1965', 'RuadasFlores751SãoPaul SP', 'M', 30.000, '33344555587', 5);
('Fernando','T', 'Wong', '33344555587', '08-12-1955', 'RuadaLapa34 São Paulo SP', 'M', 40.000, '88866555576', 5);
('Alice','J', 'Zelaya', '99988777767', '19-01-1968', 'RuaSOuz Lima35Curitiba PR', 'F', 25.000, '98765432168', 4);
('Jeniffer','S', 'Souza', '98765432168', '20-06-1941', 'A Arthur deLima 54 Santo Andre SP', 'F', 43.000, '88866555576', 4);
('Ronaldo','K', 'Lima', '66688444476', '15-09-1965', 'RuaRebouça65Piracicaba SP', 'M', 38.000, '33344555587', 5);
('Joice','A', 'Leite', '45345345376', '31-07-1972', 'Av LucasObes74 São Paulo SP', 'F', 25.000, '33344555587', 5);
('André','V', 'Pereira', '98798798733', '29-03-1969', 'Rua Timbira 35 São Paulo SP', 'M', 25.000, '98765432168', 4);
('Jorge','E', 'Brito', '88866555576', '10-11-1937', 'Rua do Horto 35 São Paulo SP', 'M', 55.000, 'null', 1);






INSERT INTO elmasri.projeto
(nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES('ProdutoX', 1, 'Santo André', 5);
VALUES('ProdutoY', 2, 'Itu', 5);
VALUES('ProdutoZ', 3, 'São Paulo', 5);
VALUES('Informatização', 10, 'Mauá', 4);
VALUES('Reorganização', 20, 'São Paulo', 1);
VALUES('Novosbenefícios', 30, 'Mauá', 4);


INSERT INTO elmasri.trabalha_em
(cpf_funcionario, numero_projeto, horas)
VALUES('1234567866', 1, 32,5);
VALUES('1234567866', 2, 7,5);
VALUES('66688444476', 3, 40);
VALUES('45345345376', 1, 20);
VALUES('45345345376', 2, 20);
VALUES('33344555587', 2, 10);
VALUES('33344555587', 3, 10);
VALUES('33344555587', 10, 10);
VALUES('33344555587', 20, 10);
VALUES('99988777767', 30, 30);
VALUES('99988777767', 10, 10);
VALUES('98798798733', 10, 35);
VALUES('98798798733', 30, 5);
VALUES('98765432168', 30, 20);
VALUES('98765432168', 20, 15);
VALUES('88866555576', 20, null);

