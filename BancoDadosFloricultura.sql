
create table Produto(
	Id int PRIMARY KEY,
	Nome varchar(200),
	Tipo varchar(100),
	Valor float
);

create table Endereco(
	Id int PRIMARY KEY,
	Rua varchar(150),
	Bairro varchar(150),
	Cidade varchar (100)
);

create table Cliente(
	Id int PRIMARY KEY,
	Nome varchar(150),
	CPF int,
	Id_Endereco int REFERENCES Endereco(Id)
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