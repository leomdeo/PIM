CREATE PROCEDURE GetAllApolices
AS
SELECT * FROM APOLICES
GO;

CREATE PROCEDURE PostApolice
@IDCLIENTE INT,
@IDPLANO INT,
@IDFUNCIONARIO INT,
@FORMAPAGAMENTO INT,
@VALORSEGURO DECIMAL,
@DATACRIACAOAPOLICE DATETIME,
@TEMPOCONTRATACAOPORMES INT
AS
INSERT INTO APOLICES(
apol_cli_id, apol_plan_id, apol_fun_id ,apol_formaPagamento,
apol_valorSeguro,apol_dataCriacaoApolice,apol_tempoContratacaoPorMes)
VALUES(@IDPLANO, @IDPLANO, @IDFUNCIONARIO, @FORMAPAGAMENTO, @VALORSEGURO, @DATACRIACAOAPOLICE, @TEMPOCONTRATACAOPORMES)
GO;

CREATE PROCEDURE PutApolice
@ID INT,
@FORMAPAGAMENTO INT,
@VALORSEGURO DECIMAL,
@TEMPOCONTRATACAOPORMES INT
AS
UPDATE APOLICES 
SET APOLICES.apol_formaPagamento = @FORMAPAGAMENTO, 
APOLICES.apol_valorSeguro = @VALORSEGURO, 
APOLICES.apol_tempoContratacaoPorMes = @TEMPOCONTRATACAOPORMES
WHERE APOLICES.apol_id = @ID
GO;

CREATE PROCEDURE DeleteApolice
@ID INT
AS
DELETE FROM APOLICES
WHERE APOLICES.id = @ID;
GO;