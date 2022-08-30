USE TSBSEGUROS


/*
	Tabelas:
		Funcionario
		Cliente
		Automovel
		Seguradora
		Cobertura
		Assistencia
		Plano
		Apolice

	Tabelas de Relacionamento:
		Cliente_Automovel
		Plano: Seguradora + Assistencia + Cobertura
		Apolice: Cliente + Plano + Funcionario + 

*/


CREATE TABLE FUNCIONARIO(
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(50),
	Senha VARCHAR(50),
	Data_Nascimento DATETIME NOT NULL,
	Cpf VARCHAR(11) NOT NULL,
	Rg VARCHAR(11) NOT NULL,
	Ctps VARCHAR(20) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	Cargo VARCHAR(50) NULL,
	IsAtivo BIT NOT NULL,
);

CREATE TABLE CLIENTE (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nome VARCHAR(50)
	PRIMARY KEY(ClienteId),
);

CREATE TABLE AUTOMOVEL (
    ld INT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50),
	IdCliente INT,
	PRIMARY KEY(Automoveld),
	FOREIGN KEY (IdCliente) REFERENCES Cliente(ClienteId) ON DELETE CASCADE,
);

CREATE TABLE PLANO(
	TipoPlano varchar(20) NOT NULL, CHECK (TipoPlano IN('PADRAO', 'PREMIUM', 'SUPER'))
);

CREATE TABLE SEGURADORA(

);

CREATE TABLE ASSISTENCIA(

);

CREATE TABLE COBERTURA(

);

CREATE TABLE APOLICE(
	FormaPagamento varchar(20) NOT NULL, CHECK (FormaPagamento IN('CARTAO_CREDITO', 'PIX', 'BOLETO'))
);


SELECT * FROM TIPO_PLANO



































 

/*
SELECT * FROM CLIENTE
SELECT * FROM AUTOMOVEL
SELECT * FROM CLIENTE_AUTOMOVEL

INSERT INTO Cliente VALUES('Nicolas');
INSERT INTO Cliente VALUES('Antonio');

INSERT INTO Automovel VALUES('Golf', 1);
INSERT INTO Automovel VALUES('Azira', 3);
INSERT INTO Automovel VALUES('Strada',1);
INSERT INTO Automovel VALUES('Marea', 3);
INSERT INTO Automovel VALUES('Astra', 1);


CREATE TABLE CLIENTE_AUTOMOVEL (
	Id INT IDENTITY(1,1) NOT NULL,
    Id_Cliente INT,
    Id_Automovel INT,
	FOREIGN KEY (IdAutomovel) REFERENCES AUTOMOVEL(Id) ON DELETE CASCADE,
	FOREIGN KEY (IdCliente) REFERENCES CLIENTE(Id) ON DELETE CASCADE,
);


SELECT c.ClienteId, c.Nome, ca.IdCliente, ca.IdAutomovel, a.Nome FROM Cliente c
JOIN Cliente_Automovel ca
ON c.ClienteId = ca.IdCliente
JOIN Automovel a
ON ca.IdAutomovel = a.Automoveld

DELETE oba FROM Automovel oba
WHERE oba.Automoveld = 3

DELETE a FROM Cliente a
WHERE a.ClienteId = 2


DROP TABLE Cliente
DROP TABLE Automovel
DROP TABLE Cliente_Automovel
*/