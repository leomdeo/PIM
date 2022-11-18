CREATE PROCEDURE GetAllFuncionarios
AS
SELECT * FROM FUNCIONARIOS
GO;


CREATE PROCEDURE PostFuncionario
@NOME VARCHAR(50),
@EMAIL VARCHAR(50),
@DATANASCIMENTO VARCHAR(10),
@DATAADMISSAO VARCHAR(10),
@CPF VARCHAR(11),
@RG VARCHAR(11),
@TELEFONE VARCHAR(11),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50),
@CARGO VARCHAR(50),
@SEXO INT,
@SALARIO DECIMAL,
@ESTADOCIVIL INT
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM FUNCIONARIOS WHERE FUNCIONARIOS.fun_cpf = @CPF AND FUNCIONARIOS.fun_rg = @RG)
	BEGIN
		SELECT PARSE(@DATAADMISSAO as date USING 'AR-LB')
		SELECT PARSE(@DATANASCIMENTO as date USING 'AR-LB')
		INSERT INTO FUNCIONARIOS(fun_nome, fun_email,fun_senha ,fun_dataNascimento, fun_dataAdmissao, fun_cpf, fun_rg,
		fun_telefone,fun_cep, fun_logradouro, fun_cargo, fun_sexo,fun_salario, fun_estadoCivil, fun_status)
		VALUES(@NOME, @EMAIL,@CPF, @DATANASCIMENTO, @DATAADMISSAO, @CPF, @RG, @TELEFONE, @CEP, @LOGRADOURO, @CARGO, @SEXO,@SALARIO, @ESTADOCIVIL,0)
	END
END
GO;

CREATE PROCEDURE PutFuncionario
@EMAIL VARCHAR(50),
@SENHA VARCHAR(11),
@TELEFONE VARCHAR(11),
@CARGO VARCHAR(50),
@CEP VARCHAR(8),
@LOGRADOURO VARCHAR(50),
@ESTADOCIVIL INT,
@SALARIO DECIMAL,
@ID INT
AS
UPDATE FUNCIONARIOS 
SET FUNCIONARIOS.fun_email = @EMAIL,
FUNCIONARIOS.fun_senha = @SENHA,
FUNCIONARIOS.fun_telefone = @TELEFONE,
FUNCIONARIOS.fun_cargo = @CARGO,
FUNCIONARIOS.fun_cep = @CEP,
FUNCIONARIOS.fun_logradouro = @LOGRADOURO,
FUNCIONARIOS.fun_estadoCivil = @ESTADOCIVIL,
FUNCIONARIOS.fun_salario = @SALARIO
WHERE FUNCIONARIOS.fun_id = @ID
GO;

CREATE PROCEDURE ChangeFuncionarioStatus
@STATUS BIT,
@ID INT
AS
UPDATE FUNCIONARIOS 
SET FUNCIONARIOS.fun_status = @STATUS
WHERE FUNCIONARIOS.fun_id = @ID
GO;

CREATE PROCEDURE DeleteFuncionario
@ID INT
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM APOLICES WHERE APOLICES.apol_fun_id = @ID)
	BEGIN
		DELETE FROM FUNCIONARIOS 
		WHERE FUNCIONARIOS.fun_id = @ID
	END
END
GO;