CREATE PROCEDURE ReturnClientProperties
@EMAIL VARCHAR(50),
@SENHA VARCHAR(18)
AS
SELECT client.*, automovel.*, plano.*, coberturas.*,assistencia.*, apolice.*
FROM CLIENTES client
JOIN AUTOMOVEIS automovel
ON automovel.auto_cli_id  = client.cli_id
JOIN APOLICES apolice
ON client.cli_id = apolice.apol_cli_id 
JOIN PLANOS plano
ON plano.plan_id = apolice.apol_plan_id 
JOIN COBERTURAS coberturas 
ON coberturas.cober_plan_id  = plano.plan_id 
JOIN ASSISTENCIAS assistencia 
ON assistencia.assist_plan_id  = plano.plan_id
WHERE client.cli_email = @EMAIL AND client.cli_senha = @SENHA
;
