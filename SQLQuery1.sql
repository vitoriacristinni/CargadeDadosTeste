CREATE DATABASE FazendaAuto;
USE FazendaAuto;

CREATE TABLE TBFazendaAuto
(
    IdFazenda INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    NomeFazenda VARCHAR(50),
    Endereco VARCHAR(200),
    EstacaoAno VARCHAR(10),
    Temperatura INT
);

INSERT INTO TBFazendaAuto(NomeFazenda, Endereco, EstacaoAno, Temperatura) 
VALUES('Agrotech Solutions', 'Rua Tadeu Alvares Pires, 70 - Aguá Branca, São Paulo/SP', 'Outono', 30);

INSERT INTO TBFazendaAuto(NomeFazenda, Endereco, EstacaoAno, Temperatura) 
VALUES('Agrotech Solutions', 'Rua Penteado Abreu, 8 - Aguá Branca, São Paulo/SP', 'Outono', 30);

SELECT * FROM TBFazendaAuto;

CREATE TABLE TBColheita
(
    IdColheita INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Fk_Fazenda INT,
    ClasseColheita VARCHAR(30),
    NomeColheita VARCHAR(30),
    DataProducao DATE,
    PrazoConsumo DATE,
    MetodoCultivo VARCHAR(30),
    RegistroMovimentacao VARCHAR(30),
    CONSTRAINT Fk_IdFazenda FOREIGN KEY (Fk_Fazenda) REFERENCES TBFazendaAuto(IdFazenda)
);
GO

CREATE PROCEDURE InserirColheita
    @Fk_Fazenda INT,
    @ClasseColheita VARCHAR(30),
    @NomeColheita VARCHAR(30),
    @DataProducao DATE,
    @PrazoConsumo DATE,
    @MetodoCultivo VARCHAR(30),
    @RegistroMovimentacao VARCHAR(30)
AS
BEGIN
    INSERT INTO TBColheita (Fk_Fazenda, ClasseColheita, NomeColheita, DataProducao, PrazoConsumo, MetodoCultivo, RegistroMovimentacao)
    VALUES (@Fk_Fazenda, @ClasseColheita, @NomeColheita, @DataProducao, @PrazoConsumo, @MetodoCultivo, @RegistroMovimentacao);
END;
GO

EXEC InserirColheita 
    @Fk_Fazenda = 1,
    @ClasseColheita = 'Hortaliças',
    @NomeColheita = 'Tomate Italiano',
    @DataProducao = '2024-05-02',
    @PrazoConsumo = '2024-05-10',
    @MetodoCultivo = 'Hidroponia',
    @RegistroMovimentacao = 'Embalagem';

EXEC InserirColheita 
    @Fk_Fazenda = 2,
    @ClasseColheita = 'Hortaliças',
    @NomeColheita = 'Batata Doce',
    @DataProducao = '2024-05-10',
    @PrazoConsumo = '2024-05-20',
    @MetodoCultivo = 'Hidroponia',
    @RegistroMovimentacao = 'Embalagem';

EXEC InserirColheita 
    @Fk_Fazenda = 1,
    @ClasseColheita = 'Frutas',
    @NomeColheita = 'Banana Prata',
    @DataProducao = '2024-05-11',
    @PrazoConsumo = '2024-05-16',
    @MetodoCultivo = 'Campo Aberto',
    @RegistroMovimentacao = 'Distribuição';
GO

SELECT * FROM TBColheita;