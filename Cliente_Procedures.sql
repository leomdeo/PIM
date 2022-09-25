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

CREATE PROCEDURE GetAllClients 
AS
SELECT * FROM CLIENTES 
GO;
S
CREATE PROCEDURE nome
AS

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
INSERT INTO CLIENTES (nome, email, senha, dataNascimento, cpf, cnh, telefone ,tipoCliente, isAtivo)
VALUES(@NOME, NULL, NULL, @DATANASCIMENTO, @CPF, @CNH, @TELEFONE, 0, 'TRUE')
GO;
CREATE PROCEDURE PostClientPj 
@RAZAOSOCIAL VARCHAR(50),
@CNPJ VARCHAR(20),
@TELEFONE VARCHAR(20),
@DATACRIACAO VARCHAR(10)
AS 
SELECT PARSE(@DATACRIACAO as date USING 'AR-LB')
INSERT INTO CLIENTES(razaoSocial, email, senha, dataCriacao, cnpj, telefone, tipoCliente, isAtivo)
VALUES(@RAZAOSOCIAL, NULL, NULL, @DATACRIACAO, @CNPJ, @TELEFONE, 1, 'TRUE') 
GO;
/* -- PUTS  --- */
CREATE PROCEDURE PutClient
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@TELEFONE VARCHAR(20),
@ID INT
AS
UPDATE CLIENTES
SET CLIENTES.email = @EMAIL, CLIENTES.senha = @SENHA, CLIENTES.telefone = @TELEFONE
WHERE CLIENTES.id = @ID
GO;
CREATE PROCEDURE PutLoginClientPf
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@CPF VARCHAR(50)
AS
UPDATE CLIENTES
SET CLIENTES.email = @EMAIL, CLIENTES.senha = @SENHA
WHERE CLIENTES.cpf = @CPF
GO;
CREATE PROCEDURE PutLoginClientPJ
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@CNPJ VARCHAR(50)
AS
UPDATE CLIENTES 
SET CLIENTES.email = @EMAIL, CLIENTES.senha = @SENHA
WHERE CLIENTES.cnpj = @CNPJ
GO;
CREATE PROCEDURE ChangeStatusClientById 
@ID INT,
@STATUS BIT 
AS 
UPDATE CLIENTES
SET CLIENTES.isAtivo = @STATUS
WHERE CLIENTES.id = @ID 
GO;
CREATE PROCEDURE DeleteClient 
@ID INT
AS
DELETE FROM CLIENTES 
WHERE CLIENTES.id = @ID
GO;


EXEC GetAllClients;

EXEC PostClientPf @NOME = 'Leozin Bananeiro', @DATANASCIMENTO = '26/11/1996', @CPF = '12345678911', @CNH = '98765432100', @TELEFONE ='11988323723';
EXEC PostClientPj @RAZAOSOCIAL = 'Construtora ENG', @DATACRIACAO = '27/12/1988', @CNPJ = '98765432100', @TELEFONE ='40028922';

EXEC PutLoginClientPf @EMAIL = 'mudouPF@gmail.com', @SENHA = '52485', @CPF ='12345678911' ;
EXEC PutLoginClientPJ @EMAIL= 'mudouPJ@gmail.com', @SENHA = '55948542', @CNPJ = '98765432100';

EXEC PutClient @EMAIL ='exemploCPF@gmail.com', @SENHA ='123456', @TELEFONE = '119999999', @ID = 1;

EXEC ChangeStatusClientById @ID = 1, @STATUS = 'FALSE';

EXEC DeleteClient @ID = 2;