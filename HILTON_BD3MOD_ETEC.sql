use master
if db_id('HILTON_BD3MOD_ETEC') is not null
    drop database HILTON_BD3MOD_ETEC
go
create database HILTON_BD3MOD_ETEC
go
use HILTON_BD3MOD_ETEC
go
create table Cod_Prod(
ID_PROD int primary key identity(1,1),
NOME_PROD nvarchar(50)NOT NULL,
MARCA_PROD nvarchar(50)NOT NULL,
MODELO_PROD nvarchar(50)NOT NULL,
VALOR_CUSTO money NOT NULL,
VALOR_VENDA money NOT NULL
);
INSERT INTO [dbo].[Cod_Prod]
           ([NOME_PROD]
           ,[MARCA_PROD]
           ,[MODELO_PROD]
           ,[VALOR_CUSTO]
           ,[VALOR_VENDA])
     VALUES
           ('VINHO','SALTON','TANNAT',15.50,20.30),
		   ('VINHO','ALMADEN','CABERNET',18.40,25.20),
		   ('GIN','SEAGERS','DRY',28.80,36.50),
		   ('AGUARDENTE','SELETA','OURO',20.40,32),
		   ('REFRIGERANTE','COCA-COLA','COCA-COLA 2,5L',3.90,5.50),
		   ('CERVEJA','SKOL','PILSEN 2L',5.50,9.90);
create table Prod_Vendido(
ID_PROD int NOT NULL,
ID_PROD_VEND int primary key identity(1,1),
ID_VEND int, --FOREIGN KEY REFERENCES Venda(ID_VEND),
DEPART_PROD_VEND nvarchar(20)NOT NULL,
QUANT_PROD_VEND float(10)NOT NULL,
UNID_PROD_VEND nvarchar(10)NOT NULL,
DESCRICAO_PROD_VEND nvarchar(30) NULL
);
INSERT INTO [dbo].[Prod_Vendido]
           ([ID_PROD]
           ,[ID_VEND]
           ,[DEPART_PROD_VEND]
           ,[QUANT_PROD_VEND]
           ,[UNID_PROD_VEND]
           ,[DESCRICAO_PROD_VEND])
     VALUES
          
		   (1,1,'VINHOS',15,'CX','6 UNID'),
		   (2,3,'VINHOS',12,'CX','6 UNID'),
		   (6,2,'CERVEJAS',10,'CX','12 UNID'),
		   (3,1,'DESTILADOS',40,'UN',''),
		   (1,5,'VINHOS',8,'CX','6 UNID'),
		   (4,4,'DESTILADOS',20,'UN',''),
		   (6,5,'CERVEJAS',120,'CX','12 UNID'),
		   (5,5,'REFRIGERANTES',50,'PCT','10 UNID');

create table Venda(
ID_PROD_VEND  int NOT NULL,
ID_VEND int primary key identity(1,1),
VENDEDOR nvarchar(50)NOT NULL,
VALOR_VEND money NOT NULL,
DATA_VEND date NOT NULL,
NOTA_FISCAL int NOT NULL,
ID_CLIENTE int NOT NULL
);
INSERT INTO [dbo].[Venda]
           ([ID_PROD_VEND]
           ,[VENDEDOR]
           ,[VALOR_VEND]
           ,[DATA_VEND]
           ,[NOTA_FISCAL]
           ,[ID_CLIENTE])
     VALUES
           

		   (1,'MANOEL',250.00,'2020-02-25',123,1),
		   (1,'JOSE',300.00,'2020-02-24',234,2),
		   (2,'JOAQUIM',350.00,'2020-02-25',345,3),
		   (2,'MANOEL',400.00,'2020-02-21',456,4),
		   (3,'JOAQUIM',150.00,'2020-02-23',567,5),
		   (3,'JOAQUIM',200.00,'2020-02-20',678,6),
		   (4,'MANOEL',100.00,'2020-02-26',789,1),
		   (5,'MANOEL',220.00,'2020-02-24',890,2),
		   (5,'JOSE',410.00,'2020-02-25',901,3),
		   (6,'JOSE',360.00,'2020-02-22',124,4),
		   (6,'MANOEL',420.00,'2020-02-26',235,5);
 create table Cliente(
 Id_Cliente int IDENTITY(1,1) PRIMARY KEY,
 Nome varchar(50)NOT NULL,
 Endereço nvarchar(50)NOT NULL,
 CPF_CNPJ varchar(20)NOT NULL,
 E_mail varchar(30)NOT NULL
 );
INSERT INTO [dbo].[Cliente]
           ([Nome]
           ,[Endereço]
           ,[CPF_CNPJ]
           ,[E_mail])
     VALUES
     

('PEDRO ALVARES CABRAL','R LISBOA 1500,PORTUGAL','12.123.123-12','PEDRO.LISBOA@GMAIL.COM'),
('LEONARDO DA VINCI','R ANCHIANO 1490,ITALIA','23.234.234-23','LEONARDO.ANCHIANO@GMAIL.COM'),
('ELVIS PRESLEY','R MISSISSIPI 1960,EUA','34.345.345-34','ELVIS.MISSISSIPI@GMAIL.COM'),
('NICOLAS TESLA','R SMILJAN 1880,CROACIA','45.456.456-45','NICOLAS.SMILJAN@GMAIL.COM'),
('ARIANO SUASSUNA','R PARAIBA 1970,BRASIL','56.567.567-56','ARIANO.PARAIBA@GMAIL.COM');

ALTER TABLE Prod_Vendido

ADD constraint fk_ID_VEND

FOREIGN KEY(ID_VEND) REFERENCES Venda
