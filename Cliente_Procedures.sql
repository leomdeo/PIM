/*
	Procedures:
	GetAllClientsByType : Retorna todos os clientes pf ou pj.
	GetClientById : Retorna o cliente baseado no Id.
	PostClientPf  : Cria um novo Cliente PF.
	PostClientPj  : Cria um novo Cliente PJ.
	PostLoginClientPf : Cria o login do Cliente.
	PostLoginClientPj : Cria o login do Cliente.
	PutClientPf : Altera dados do Cliente PF.
	PutClientPj : Altera dados do Cliente PJ.
	DeleteClientById : Deleta um cliente pelo id.
*/

CREATE PROCEDURE GetAllClients
AS
SELECT * FROM CLIENTE 
GO;

CREATE PROCEDURE GetClientById @Id_Cliente INT
AS
SELECT * FROM CLIENTE cliente WHERE cliente.Id = @Id_Cliente 
GO;

CREATE PROCEDURE PostClientPf 
@NOME VARCHAR(50),
@CPF VARCHAR(11),
@CNH VARCHAR(11), 
@TELEFONE VARCHAR(11)
AS 
INSERT INTO CLIENTE (Nome, Email, Senha, Data_Nascimento, Data_Criacao, CPF, CNH, Telefone,TipoCliente)
VALUES(@NOME, NULL, NULL, 2000-11-17, 1900-11-17, @CPF, @CNH, @TELEFONE, 0)
;

CREATE PROCEDURE PostClientPj 
@RAZAOSOCIAL VARCHAR(50),
@CNPJ VARCHAR(20),
@TELEFONE VARCHAR(20)
AS 
INSERT INTO CLIENTE (Razao_Social, Email, Senha, Data_Criacao, Data_Nascimento, CNPJ, Telefone, TipoCliente)
VALUES(@RAZAOSOCIAL, NULL, NULL, 2000-11-17, 1900-11-17, @CNPJ, @TELEFONE, 1) 
;

CREATE PROCEDURE PutClientPf
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@TELEFONE VARCHAR(20),
@ID INT
AS
UPDATE CLIENTE 
SET CLIENTE.Email = @EMAIL, CLIENTE.Senha = @SENHA, CLIENTE.Telefone = @TELEFONE
WHERE CLIENTE.Id = @ID
GO;

CREATE PROCEDURE PutClientPj 
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@TELEFONE VARCHAR(20),
@ID INT
AS
UPDATE CLIENTE 
SET CLIENTE.Email = @EMAIL, CLIENTE.Senha = @SENHA, CLIENTE.Telefone = @TELEFONE
WHERE CLIENTE.Id = @ID
GO;

CREATE PROCEDURE PutLoginClientPf
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@CPF VARCHAR(50)
AS
UPDATE CLIENTE 
SET CLIENTE.Email = @EMAIL, CLIENTE.Senha = @SENHA
WHERE CLIENTE.CPF = @CPF
GO;

CREATE PROCEDURE PutLoginClientPJ
@EMAIL VARCHAR(50),
@SENHA VARCHAR(50),
@CNPJ VARCHAR(50)
AS
UPDATE CLIENTE 
SET CLIENTE.Email = @EMAIL, CLIENTE.Senha = @SENHA
WHERE CLIENTE.CNPJ = @CNPJ
GO;

CREATE PROCEDURE DeleteClientById @Id_Cliente INT
AS 
DELETE FROM CLIENTE WHERE CLIENTE.Id = @Id_Cliente;


SELECT * FROM CLIENTE

EXEC DeleteClientById @Id_Cliente = 2;
EXEC GetAllClients;
EXEC PostClientPf @NOME = 'Leozin Bananeiro' ,@CPF = '12345678911', @CNH = '98765432100', @TELEFONE ='426336571455';
EXEC PostClientPj @RAZAOSOCIAL = 'Construtora ENG', @CNPJ = '98765432100', @TELEFONE ='426336571455';
EXEC PutClientPf @EMAIL ='exemploCPF@gmail.com', @SENHA ='123456', @TELEFONE = '119999999', @ID = 1;
EXEC PutClientPj @EMAIL ='exemploCPNJ@gmail.com', @SENHA = '654321', @TELEFONE = '119999999', @ID = 2;
EXEC PutLoginClientPf @EMAIL = 'mudouPF@gmail.com',@SENHA = '52485'  ,@CPF ='12345678911' ;
EXEC PutLoginClientPJ @EMAIL= 'mudouPJ@gmail.com' ,@SENHA = '55948542' , @CNPJ = '98765432100';
