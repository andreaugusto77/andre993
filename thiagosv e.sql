CREATE DATABASE SLAP;

USE SLAP;

CREATE TABLE produto (
	id 					int primary key auto_increment,
    nome 				varchar(255) not null,
    valor 				float(8,2) not null,
    total_em_estoque	int default 0 
);

create table orcamento(
	id					int primary key auto_increment,
	data_orcamento 		datetime,
	status_orcamento 	int default 0,
	valor_total 		float(22,2) default 0,
	cliente 			varchar(255) not null,
	validade 			datetime 
);

create table orcamento_produto (
	id_orcamento int,
    id_produto int,
    valor_produto float(8,2) not null,
    qtd_produto int not null
);
alter table orcamento_produto
add foreign key (id_produto) references produto (id);

alter table orcamento_produto
add foreign key (id_orcamento) references orcamento (id);

insert into produto
(nome, valor, total_em_estoque) values
('produto 1', 10.00, 50),
('produto 2', 20.00, 150),
('produto 3', 5.00, 5),
('produto 4', 0.50, 1050);

insert into orcamento 
(data_orcamento, status_orcamento, valor_total, cliente, validade) values
(sysdate(), 0, 0, 'Thiago', sysdate());

insert into orcamento_produto
(id_orcamento, id_produto, valor_produto, qtd_produto)
select 1, id, valor, 2 from produto;

select * from produto;
select * from orcamento;
select * from orcamento_produto;