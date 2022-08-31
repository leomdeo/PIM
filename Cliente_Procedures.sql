CREATE PROCEDURE GetAllClients
AS
SELECT * FROM CLIENTE
GO;

CREATE PROCEDURE GetClientById @Id_Cliente INT
AS
SELECT * FROM CLIENTE cliente WHERE cliente.Id = @Id_Cliente;



EXEC GetAllClients;
EXEC GetClientById @Id_Cliente = 1;


/*
INSERT INTO CLIENTE (Email, Senha, Nome, Razao_Social, CNPJ, CPF,CNH, Data_Nascimento, Data_Criacao, TipoCliente)
VALUES(null, null, 'Nicolas', null,null,'4263367800','21232524262728',2000-11-17, NULL, 'PF')
*/