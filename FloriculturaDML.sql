--insert produtos
--deu um erro e com isso fiz uma alteração na tabela produto, alterando o tipo de dado da coluna valor para numeric(6,2)
ALTER TABLE Produto
ALTER COLUMN Valor TYPE numeric(6,2);


INSERT INTO Produto (Id, Nome, Tipo, Valor)
VALUES (1, 'Orquidia', 'Flor', 50.00);

INSERT INTO Produto (Id, Nome, Tipo, Valor)
VALUES (2, 'Rosa', 'Flor', 30.00);

INSERT INTO Produto (Id, Nome, Tipo, Valor)
VALUES (3, 'Vaso Ceramica', 'Vaso', 60.00);

INSERT INTO Produto (Id, Nome, Tipo, Valor)
VALUES (4, 'Samambaia', 'pteridófitas', 25.00);

INSERT INTO Produto (Id, Nome, Tipo, Valor)
VALUES (5, 'Estatua de anão', 'decoração para jardim estatueta', 125.00);

SELECT * FROM Produto;

--insert endereço

INSERT INTO Endereco (Id, Rua, Bairro, Cidade) 
VALUES (1, 'Rua Otto Heckert', 'São Luiz', 'Brusque-SC');

INSERT INTO Endereco (Id, Rua, Bairro, Cidade) 
VALUES (2, 'Rua Anita Garibaldi,222', 'Centro I', 'Brusque-SC');

INSERT INTO Endereco (Id, Rua, Bairro, Cidade) 
VALUES (3, 'Av Otto Renaux,415', 'Centro I', 'Brusque-SC');

INSERT INTO Endereco (Id, Rua, Bairro, Cidade) 
VALUES (4, 'R Victor Meirelles,222', 'Santa Rita', 'Brusque-SC');

INSERT INTO Endereco (Id, Rua, Bairro, Cidade) 
VALUES (5, 'R Pedro Gracher,333', 'São Luiz', 'Brusque-SC');

SELECT * FROM Endereco;



--insert cliente
--deu um erro na tabela e com isso foi feito uma alteração na tabela cliente, alterando o tipo de dado da coluna cpf para bigint
ALTER TABLE Cliente
ALTER COLUMN CPF TYPE bigint;


INSERT INTO Cliente (Id, Nome, CPF, Id_Endereco) 
VALUES (1, 'Ana Silva', 123456789, 1);

INSERT INTO Cliente (Id, Nome, CPF, Id_Endereco)
 VALUES (2, 'Carlos Souza', 234567891, 2);

INSERT INTO Cliente (Id, Nome, CPF, Id_Endereco) 
VALUES (3, 'Beatriz Gomes', 345678912, 3);

INSERT INTO Cliente (Id, Nome, CPF, Id_Endereco) 
VALUES (4, 'Lucas Martins', 456789123, 4);

INSERT INTO Cliente (Id, Nome, CPF, Id_Endereco) 
VALUES (5, 'Juliana Pereira', 567891234, 5);

SELECT * FROM Cliente;

--insert Venda

INSERT INTO Venda (Id, ValorTotal, DataCompra, Id_Cliente) 
VALUES (1, 200.50, '2024-01-01', 1);

INSERT INTO Venda (Id, ValorTotal, DataCompra, Id_Cliente)
 VALUES (2, 1500.00, '2024-01-10', 2);

INSERT INTO Venda (Id, ValorTotal, DataCompra, Id_Cliente) 
VALUES (3, 750.30, '2024-01-15', 3);

INSERT INTO Venda (Id, ValorTotal, DataCompra, Id_Cliente) 
VALUES (4, 300.00, '2024-01-20', 4);

INSERT INTO Venda (Id, ValorTotal, DataCompra, Id_Cliente) 
VALUES (5, 1200.25, '2024-01-20', 5);

SELECT * FROM Venda;

--insert Venda

INSERT INTO Contato (Id, NumTelefone, Id_Cliente) 
VALUES (1, '47987654321', 1);

INSERT INTO Contato (Id, NumTelefone, Id_Cliente) 
VALUES (2, '47987654321', 2);

INSERT INTO Contato (Id, NumTelefone, Id_Cliente) 
VALUES (3, '47987654321', 3);

INSERT INTO Contato (Id, NumTelefone, Id_Cliente) 
VALUES (4, '47987654321', 4);

INSERT INTO Contato (Id, NumTelefone, Id_Cliente) 
VALUES (5, '47987654321', 5);

SELECT * FROM Contato;

-- Associando vendas e produtos
INSERT INTO Venda_Produto (id_Venda, id_Produto)
 VALUES (1, 1);

INSERT INTO Venda_Produto (id_Venda, id_Produto) 
VALUES (1, 2);

INSERT INTO Venda_Produto (id_Venda, id_Produto) 
VALUES (2, 2);

INSERT INTO Venda_Produto (id_Venda, id_Produto) 
VALUES (2, 3);

INSERT INTO Venda_Produto (id_Venda, id_Produto) 
VALUES (3, 1);

