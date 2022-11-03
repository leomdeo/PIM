CREATE PROCEDURE GetAllClients 
AS
SELECT * FROM CLIENTES 
GO;



CREATE PROCEDURE GetAllClientsPf
AS 
SELECT cli_id, cli_nome, cli_email, cli_senha, cli_dataNascimento, 
cli_cpf, cli_cnh, cli_telefone, cli_tipoCliente, cli_status,
cli_cep,cli_logradouro, cli_estadoCivil, cli_sexo, cli_rg 
FROM CLIENTES 
WHERE CLIENTES.cli_tipoCliente = 0
;

CREATE PROCEDURE GetAllClientsPj
AS 
SELECT cli_id,cli_razaoSocial, cli_contratoSocial, cli_email, cli_senha, cli_dataCriacao, cli_cnpj, cli_telefone, cli_tipoCliente, cli_status,
cli_cep, cli_logradouro
FROM CLIENTES 
WHERE CLIENTES.cli_tipoCliente = 1
;


/* -- POSTS --- */
CREATE PROCEDURE PostClientPf 
@NOME VARCHAR(50),
@EMAIL VARCHAR(50),
@CPF VARCHAR(11),
@CNH VARCHAR(11), 
@RG VARCHAR(11),
@TELEFONE VARCHAR(11),
@DATANASCIMENTO VARCHAR(10),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50),
@ESTADOCIVIL INT,
@SEXO INT
AS 
SELECT PARSE(@DATANASCIMENTO as date USING 'AR-LB')
INSERT INTO CLIENTES (
cli_nome, cli_email, cli_senha, cli_dataNascimento, 
cli_cpf, cli_cnh, cli_telefone, cli_tipoCliente, cli_status,
cli_cep,cli_logradouro, cli_estadoCivil, cli_sexo, cli_rg)
VALUES(@NOME, @EMAIL, NULL, @DATANASCIMENTO, @CPF, @CNH, @TELEFONE, 0, 0, @CEP, @LOGRADOURO, @ESTADOCIVIL, @SEXO, @RG);

GO;

CREATE PROCEDURE PostClientPj 
@RAZAOSOCIAL VARCHAR(50),
@CONTRATOSOCIAL VARCHAR(50),
@EMAIL VARCHAR(50),
@CNPJ VARCHAR(20),
@TELEFONE VARCHAR(20),
@DATACRIACAO VARCHAR(10),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50)
AS 
SELECT PARSE(@DATACRIACAO as date USING 'AR-LB')
INSERT INTO CLIENTES(cli_razaoSocial, cli_contratoSocial, cli_email, cli_senha, cli_dataCriacao, cli_cnpj, cli_telefone, cli_tipoCliente, cli_status,
cli_cep, cli_logradouro)
VALUES(@RAZAOSOCIAL, @CONTRATOSOCIAL,@EMAIL, NULL, @DATACRIACAO, @CNPJ, @TELEFONE, 1, 0, @CEP, @LOGRADOURO) 
GO;

/* -- PUTS  --- */
CREATE PROCEDURE PutClient
@TELEFONE VARCHAR(20),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50),
@ESTADOCIVIL INT,
@ID INT
AS
UPDATE CLIENTES
SET
CLIENTES.cli_telefone = @TELEFONE,
CLIENTES.cli_cep  = @CEP,
CLIENTES.cli_logradouro = @LOGRADOURO,
CLIENTES.cli_estadoCivil = @ESTADOCIVIL
WHERE CLIENTES.cli_id = @ID
GO;

CREATE PROCEDURE PutLoginClientPf
@SENHA VARCHAR(50),
@CPF VARCHAR(50)
AS
UPDATE CLIENTES
SET  CLIENTES.cli_senha = @SENHA
WHERE CLIENTES.cli_cpf = @CPF
GO;

CREATE PROCEDURE PutLoginClientPJ
@SENHA VARCHAR(50),
@CNPJ VARCHAR(50)
AS
UPDATE CLIENTES 
SET CLIENTES.cli_senha = @SENHA
WHERE CLIENTES.cli_cnpj = @CNPJ
GO;

CREATE PROCEDURE ChangeStatusClientById 
@ID INT,
@STATUS INT 
AS 
UPDATE CLIENTES
SET CLIENTES.cli_status = @STATUS
WHERE CLIENTES.cli_id = @ID 
GO;

CREATE PROCEDURE DeleteClient 
@ID INT
AS
DELETE FROM CLIENTES 
WHERE CLIENTES.cli_id = @ID
GO;


EXEC GetAllClients

EXEC PostClientPf @NOME = 'Nicolas',
@EMAIL = 'nic@gmail.com',
@CPF = '12345678911',
@CNH = '1111111111', 
@RG = '1111111111',
@TELEFONE ='11999999999',
@DATANASCIMENTO ='17/11/2000',
@CEP ='00000000',
@LOGRADOURO= 'aaaaaa',
@ESTADOCIVIL = 0,
@SEXO = 0