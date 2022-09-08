CREATE PROCEDURE ReturnClientProperties
@EMAIL VARCHAR(50),
@SENHA VARCHAR(12)
AS
SELECT client.*, automovel.*, plano.*, coberturas.*,assistencia.*,apolice.*
FROM CLIENTES client
JOIN [dbo].[AUTOMOVEIS] automovel
ON automovel.idCliente = client.id
JOIN [dbo].[APOLICES] apolice
ON client.id = apolice.idCliente
JOIN [dbo].[PLANOS] plano
ON plano.id = apolice.idPlano
JOIN [dbo].[COBERTURAS] coberturas 
ON coberturas.idPlano = plano.id 
JOIN [dbo].[ASSISTENCIAS] assistencia 
ON assistencia.idPlano = plano.id
WHERE client.email = @EMAIL AND client.senha = @SENHA
;

DROP PROCEDURE ReturnClientProperties

EXEC ReturnClientProperties @EMAIL= 'mudouPF@gmail.com', @SENHA = '52485';


EXEC PostAutomovel @IDCLIENTE = 1,
@MODELO = 'Celta',
@MARCA = 'Marca aleatória',
@ANOMODELO = '2012',
@COR = 'Preto',
@RENAVAM = '1512351651',
@NUMEROMOTOR = '15dw1d1e451',
@CRLV = '1151545145';


EXEC GetAllClients;

EXEC PostClientPf @NOME = 'Leozin Bananeiro', @DATANASCIMENTO = '26/11/1996', @CPF = '12345678911', @CNH = '98765432100', @TELEFONE ='119823723';
EXEC PostClientPj @RAZAOSOCIAL = 'Construtora ENG', @DATACRIACAO = '27/12/1988', @CNPJ = '98765432100', @TELEFONE ='40028922';

EXEC PutLoginClientPf @EMAIL = 'mudouPF@gmail.com', @SENHA = '52485', @CPF ='12345678911' ;
EXEC PutLoginClientPJ @EMAIL= 'mudouPJ@gmail.com', @SENHA = '55948542', @CNPJ = '98765432100';

EXEC PutClient @EMAIL ='exemploCPF@gmail.com', @SENHA ='123456', @TELEFONE = '119999999', @ID = 1;

EXEC ChangeStatusClientById @ID = 1, @STATUS = 'FALSE';

EXEC DeleteClient @ID = 2;