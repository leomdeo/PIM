USE TSBSEGUROS

CREATE TABLE FUNCIONARIO(
	Id INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	Data_Nascimento DATETIME,
	Cpf VARCHAR(11) NOT NULL,
	Rg VARCHAR(11) NOT NULL,
	Ctps VARCHAR(20) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	Cargo VARCHAR(50) NULL,
	IsAtivo BIT NOT NULL,
);

