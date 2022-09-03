/*
	Procedures:
	GetPjClients : Retorna todos os clientes Pj.
	GetPfClients : Retorna todos os clientes Pf.

	GetPjClientById : Retorna o cliente Pj baseado no Id.
	GetPjClientById : Retorna o cliente Pf baseado no Id.

	PostClientPf  : Cria um novo Cliente PF.
	PostClientPj  : Cria um novo Cliente PJ.
	PostLoginClientPf : Cria o login do Cliente PF.
	PostLoginClientPj : Cria o login do Cliente PJ.

	PutClientPf : Altera dados do Cliente PF.
	PutClientPj : Altera dados do Cliente PJ.

	ChangeStatusPfClientById : Muda o status do cliente Pf pelo Id.
	ChangeStatusPjClientById : Muda o status do cliente Pj pelo Id.
*/
/* -- GETS ALL  --- */

CREATE PROCEDURE GetPjClients 
AS
SELECT cliente.id, 
cliente.razaoSocial,
cliente.cnpj,
cliente.email,
cliente.senha,
cliente.isAtivo,
cliente.tipoCliente,
cliente.telefone,
cliente.dataCriacao  
FROM CLIENTES_PJ cliente
GO;
CREATE PROCEDURE GetPfClients
AS
SELECT cliente.id, 
cliente.nome,
cliente.cpf,
cliente.cnh,
cliente.email,
cliente.senha,
cliente.isAtivo,
cliente.tipoCliente,
cliente.telefone,
cliente.dataNascimento 
FROM CLIENTES_PF cliente
GO;

/* -- GETS BY ID  --- */
CREATE PROCEDURE GetPjClientById 
@IdClientePj INT
AS
SELECT * FROM CLIENTES_PJ cliente WHERE cliente.Id = @IdClientePj 
GO;
CREATE PROCEDURE GetPfClientById 
@IdClientePf INT
AS
SELECT * FROM CLIENTES_PF cliente WHERE cliente.Id = @IdClientePf
GO;

/* -- POSTS --- */
CREATE PROCEDURE PostClientPf 
@NOME VARCHAR(50),
@CPF VARCHAR(11),
@CNH VARCHAR(11), 
@TELEFONE VARCHAR(11),
@DATANASCIMENTO VARCHAR(10)
AS 
SELECT PARSE(@DATANASCIMENTO as date USING 'AR-LB')
INSERT INTO CLIENTES_PF (nome, email, senha, dataNascimento, cpf, cnh, telefone ,tipoCliente, isAtivo)
VALUES(@NOME, NULL, NULL, @DATANASCIMENTO, @CPF, @CNH, @TELEFONE, 0, 'TRUE')
GO;
CREATE PROCEDURE PostClientPj 
@RAZAOSOCIAL VARCHAR(50),
@CNPJ VARCHAR(20),
@TELEFONE VARCHAR(20),
@DATACRIACAO VARCHAR(10)
AS 
SELECT PARSE(@DATACRIACAO as date USING 'AR-LB')
INSERT INTO CLIENTES_PJ(razaoSocial, email, senha, dataCriacao, cnpj, telefone, tipoCliente, isAtivo)
VALUES(@RAZAOSOCIAL, NULL, NULL, @DATACRIACAO, @CNPJ, @TELEFONE, 1, 'TRUE') 
GO;

/* -- PUTS  --- */
CREATE PROCEDURE PutClientPf
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@TELEFONE VARCHAR(20),
@ID INT
AS
UPDATE CLIENTES_PF
SET CLIENTES_PF.email = @EMAIL, CLIENTES_PF.senha = @SENHA, CLIENTES_PF.telefone = @TELEFONE
WHERE CLIENTES_PF.id = @ID
GO;
CREATE PROCEDURE PutClientPj 
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@TELEFONE VARCHAR(20),
@ID INT
AS
UPDATE CLIENTES_PJ
SET CLIENTES_PJ.email = @EMAIL, CLIENTES_PJ.senha = @SENHA, CLIENTES_PJ.telefone = @TELEFONE
WHERE CLIENTES_PJ.id = @ID
GO;
CREATE PROCEDURE PutLoginClientPf
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@CPF VARCHAR(50)
AS
UPDATE CLIENTES_PF
SET CLIENTES_PF.email = @EMAIL, CLIENTES_PF.senha = @SENHA
WHERE CLIENTES_PF.cpf = @CPF
GO;
CREATE PROCEDURE PutLoginClientPJ
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@CNPJ VARCHAR(50)
AS
UPDATE CLIENTES_PJ 
SET CLIENTES_PJ.email = @EMAIL, CLIENTES_PJ.senha = @SENHA
WHERE CLIENTES_PJ.cnpj = @CNPJ
GO;


CREATE PROCEDURE ChangeStatusPjClientById 
@idClientePj INT,
@STATUS BIT 
AS 
UPDATE CLIENTES_PJ 
SET CLIENTES_PJ.isAtivo = @STATUS
WHERE CLIENTES_PJ.id = @idClientePj 
GO;
CREATE PROCEDURE ChangeStatusPfClientById 
@idClientePf INT,
@STATUS BIT 
AS 
UPDATE CLIENTES_PF
SET CLIENTES_PF.isAtivo = @STATUS
WHERE CLIENTES_PF.id = @idClientePf
GO;


CREATE PROCEDURE DeletePfClient 
@ID INT
AS
DELETE FROM CLIENTES_PF 
WHERE CLIENTES_PF.id = @ID
GO;
CREATE PROCEDURE DeletePjClient 
@ID INT
AS
DELETE FROM CLIENTES_PJ 
WHERE CLIENTES_PJ.id = @ID
GO;



EXEC GetPjClients;
EXEC GetPfClients;

EXEC PostClientPf @NOME = 'Leozin Bananeiro', @DATANASCIMENTO = '26/11/1996', @CPF = '12345678911', @CNH = '98765432100', @TELEFONE ='11988323723';
EXEC PostClientPj @RAZAOSOCIAL = 'Construtora ENG', @DATACRIACAO = '27/12/1988', @CNPJ = '98765432100', @TELEFONE ='40028922';

EXEC PutLoginClientPf @EMAIL = 'mudouPF@gmail.com', @SENHA = '52485', @CPF ='12345678911' ;
EXEC PutLoginClientPJ @EMAIL= 'mudouPJ@gmail.com', @SENHA = '55948542', @CNPJ = '98765432100';

EXEC PutClientPf @EMAIL ='exemploCPF@gmail.com', @SENHA ='123456', @TELEFONE = '119999999', @ID = 1;
EXEC PutClientPj @EMAIL ='exemploCPNJ@gmail.com', @SENHA = '654321', @TELEFONE = '119999999', @ID = 2;

EXEC ChangeStatusPfClientById @idClientePf = 1, @STATUS = 'FALSE';
EXEC ChangeStatusPJClientById @idClientePJ = 2, @STATUS = 'FALSE';

EXEC DeletePjClient @ID = 2;
EXEC DeletePfClient @ID = 1;