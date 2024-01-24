
CREATE TABLE Produto (
    Id INT PRIMARY KEY,
    Nome VARCHAR(200),
    Tipo VARCHAR(100),
    Valor NUMERIC(6, 2)  -- Alterado de float para numeric(6,2)
);

create table Endereco(
	Id int PRIMARY KEY,
	Rua varchar(150),
	Bairro varchar(150),
	Cidade varchar (100)
);

CREATE TABLE Cliente (
    Id INT PRIMARY KEY,
    Nome VARCHAR(150),
    CPF BIGINT,  -- Alterado de int para bigint
    Id_Endereco INT REFERENCES Endereco(Id)
);


create table Venda(
	Id int PRIMARY KEY,
	ValorTotal float,
	DataCompra date,
	Id_Cliente int REFERENCES Cliente(Id)
	
);

create table Contato(
	Id int PRIMARY KEY,
	NumTelefone varchar(20),
	Id_Cliente int REFERENCES Cliente(Id)
);

create table Venda_Produto(
	id_Venda int references Venda(id),
	id_Produto int references Produto(id)
);