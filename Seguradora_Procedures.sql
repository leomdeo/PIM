CREATE PROCEDURE GetAllSeguradoras
AS
SELECT * FROM SEGURADORAS
GO;

CREATE PROCEDURE PostSeguradora
@RAZAOSOCIAL VARCHAR(50),
@CNPJ VARCHAR(50),
@CONTRATOSOCIAL VARCHAR(50),
@EMAIL VARCHAR(50),
@TELEFONE VARCHAR(11),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50)
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM SEGURADORAS WHERE SEGURADORAS.segu_razaoSocial = @RAZAOSOCIAL AND SEGURADORAS.segu_cnpj = @CNPJ)
	BEGIN
		INSERT INTO SEGURADORAS(
		segu_razaoSocial, segu_cnpj, segu_contratoSocial, segu_email, segu_telefone,
		segu_cep, segu_logradouro, segu_status)
		VALUES(@RAZAOSOCIAL, @CNPJ, @CONTRATOSOCIAL, @EMAIL, @TELEFONE, @CEP, @LOGRADOURO, 0)
	END 
END
GO;

CREATE PROCEDURE PutSeguradora
@ID INT,
@EMAIL VARCHAR(50),
@TELEFONE VARCHAR(11),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50)
AS
UPDATE SEGURADORAS 
SET SEGURADORAS.segu_email = @EMAIL,
SEGURADORAS.segu_telefone = @TELEFONE,
SEGURADORAS.segu_cep = @CEP,
SEGURADORAS.segu_logradouro = @LOGRADOURO
WHERE SEGURADORAS.segu_id = @ID
GO;

CREATE PROCEDURE DeleteSeguradora
@ID INT
AS
DELETE FROM SEGURADORAS
WHERE SEGURADORAS.segu_id = @ID;
GO;