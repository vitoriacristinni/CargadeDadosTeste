create database FazendaUrbana
use FazendaUrbana

create table TBFazendaUrb
(
IdFazenda INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
NomeFazenda VARCHAR (50),
Endereco VARCHAR(200),
EstacaoAno VARCHAR(10),
Temperatura INT,
);

insert into TBFazendaUrb(NomeFazenda, Endereco, EstacaoAno,Temperatura) 
values('Agrotech Solutions', 'Rua Tadeu Alvares Pires, 70 - Aguá Branca, São Paulo/SP', 'Outono', '30');

insert into TBFazendaUrb(NomeFazenda, Endereco, EstacaoAno,Temperatura) 
values('Agrotech Solutions', 'Rua Penteado Abreu, 8 - Aguá Branca, São Paulo/SP', 'Outono', '30');

select * from TBFazendaUrb

create table TBColheita
(
IdColheita INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Fk_Fazenda INT,
ClasseColheita VARCHAR(30),
NomeColheita VARCHAR(30),
DataProducao DATE,
PrazoConsumo DATE,
MetodoCultivo VARCHAR(30),
RegistroMovimentacao VARCHAR(30),
CONSTRAINT Fk_IdFazenda FOREIGN KEY (Fk_Fazenda) REFERENCES TBFazendaUrb(IdFazenda)
);

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (1, 'Hortaliças', 'Tomate Italiano', '02/05/2024', '10/05/2024', 'Hidroponia', 'Embalagem')

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (1, 'Hortaliças', 'Tomate Cereja', '02/05/2024', '10/05/2024', 'Hidroponia', 'Embalagem')

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (1, 'Hortaliças', 'Batata Inglesa', '10/05/2024', '20/05/2024', 'Hidroponia', 'Embalagem')

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (2, 'Hortaliças', 'Batata Doce', '10/05/2024', '17/05/2024', 'Hidroponia', 'Distribuição')

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (1, 'Frutas', 'Banana-Prata', '11/05/2024', '16/05/2024', 'Campo Aberto', 'Distribuição')

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (1, 'Frutas', 'Banana-da-Terra', '11/05/2024', '16/05/2024', 'Campo Aberto', 'Distribuição')

insert into TBColheita(Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao) 
values (2, 'Leguminosas', 'Feijão de Corda', '11/05/2024', '16/01/2025', 'Campo Aberto', 'Lavagem')

select * from TBColheita

create table TBUsuario
(
IdUsuario INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Fk_FazendaU INT,
TipoUsuario BIT,
LoginUser VARCHAR (20) UNIQUE,
SenhaUser INT,
CONSTRAINT Fk_IdFazendaUser FOREIGN KEY (Fk_FazendaU) REFERENCES TBFazendaUrb(IdFazenda)
);

insert into TBUsuario(Fk_FazendaU, TipoUsuario, LoginUser, SenhaUser) values (1, 0, 'admin_Italo', '279354')
insert into TBUsuario(Fk_FazendaU, TipoUsuario, LoginUser, SenhaUser) values (2, 0, 'admin_Ricardo', '359728')
insert into TBUsuario(Fk_FazendaU, TipoUsuario, LoginUser, SenhaUser) values (1, 1, 'PauloCesar', '487326')
insert into TBUsuario(Fk_FazendaU, TipoUsuario, LoginUser, SenhaUser) values (1, 1, 'AleChagas', '765149')
insert into TBUsuario(Fk_FazendaU, TipoUsuario, LoginUser, SenhaUser) values (1, 1, 'CarlaPessoa', '812746')

select * from TBUsuario