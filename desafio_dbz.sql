CREATE DATABASE db_Desafio;

USE db_Desafio;

SELECT * FROM tbl_Personagem;

--Inicio tabela Personagem
CREATE TABLE tbl_Personagem(
    id_Personagem SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nome_Personagem VARCHAR(100) NOT NULL, 
    powerLevel_Personagem FLOAT NOT NULL
)

ALTER TABLE tbl_Personagem
ADD id_Raca SMALLINT NOT NULL
CONSTRAINT fk_idRaca FOREIGN KEY(id_Raca)
REFERENCES tbl_Raca;

ALTER TABLE tbl_Personagem 
ADD id_Classe SMALLINT NOT NULL
CONSTRAINT fk_idClasse FOREIGN KEY(id_Classe)
REFERENCES tbl_Classe;
--Fim tabela ersonagem


--Inicio tabela Raça
CREATE TABLE tbl_Raca(
    id_Raca SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    nome_Raca VARCHAR(100) NOT NULL
)
--Fim tabela Raça

------------------------------------------------------------------------------------
--Inicio tabela Info Raça
CREATE TABLE tbl_infoRaca(
    desc_Raca VARCHAR(100) NOT NULL
)

ALTER TABLE tbl_infoRaca
ADD id_Raca SMALLINT NOT NULL
CONSTRAINT fk_idRacaInfoRaca FOREIGN KEY(id_Raca)
REFERENCES tbl_Raca;
--Fim tabela Info Raça

--Inicio tabela Classe
CREATE TABLE tbl_Classe(
    id_Classe SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    desc_Classe VARCHAR(100) NOT NULL
)
--Fim tabela Classe

--Início da Procedures de Classe
GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_SelectClasse
        AS 
            BEGIN
                SELECT * FROM tbl_Classe
            END

            --EXEC DBZ_SelectClasse;
GO 
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_InsertClasse(
        @DescClasse VARCHAR(5)
    )
    AS 
        BEGIN 
            INSERT INTO tbl_Classe(
                desc_Classe
            )
            VALUES(
                @DescClasse
            );
        END

        --EXEC DBZ_InsertClasse 'ALTA';
        --EXEC DBZ_InsertClasse 'Baixa';
GO


GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_AlteraClasse(
        @ID SMALLINT,
        @DescClasse VARCHAR(5)
    )
    AS
        BEGIN
            UPDATE tbl_Classe
                SET desc_Classe = @DescClasse
            WHERE id_Classe = @ID;
        END

        --EXEC DBZ_AlteraClasse 2, 'BAIXA';

GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_ExcluiClasse(
        @ID SMALLINT
    )
    AS 
        BEGIN   
            DELETE FROM tbl_Classe
            WHERE id_Classe = @ID
        END
--Final das procedures da Classe

--Início das procedures de Raça

GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_SelectRaca
        AS
            BEGIN
                SELECT * FROM tbl_Raca
            END
            --EXEC DBZ_SelectRaca;
GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_InsertRaca(
        @NomeRaca VARCHAR(100)
    )
    AS 
        BEGIN
            INSERT INTO tbl_Raca(
                nome_Raca
            )
            VALUES(
                @NomeRaca
            );
        END

        EXEC DBZ_InsertRaca 'Androide';
        EXEC DBZ_InsertRaca 'Animal';
        EXEC DBZ_InsertRaca 'Dragão';
        EXEC DBZ_InsertRaca 'Terráqueo';
        EXEC DBZ_InsertRaca 'Shin-Jin';
        EXEC DBZ_InsertRaca 'Majin';
        EXEC DBZ_InsertRaca 'Saiyajin';
        EXEC DBZ_InsertRaca 'Anjo';
        EXEC DBZ_InsertRaca 'Hakaishin';
GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_AlteraRaca(
        @ID SMALLINT,
        @NomeRaca VARCHAR (100)
    )
    AS 
        BEGIN
            UPDATE tbl_Raca
                SET nome_Raca = @NomeRaca
            WHERE id_Raca = @ID;
        END

GO
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_ExcluiRaca(
        @ID SMALLINT
    )
    AS
        BEGIN 
            DELETE FROM tbl_Raca  
            WHERE id_Raca = @ID;
        END
--Aqui terminam as procedures de Raça
GO


--Aqui começam as procedures de Personagem
------------------------------------------------------------------------------------
GO 
    CREATE PROCEDURE DBZ_SelectPersonagem
        AS
            BEGIN 
                SELECT * FROM tbl_Personagem;
            END
            EXEC DBZ_SelectPersonagem
------------------------------------------------------------------------------------
GO
    CREATE PROCEDURE DBZ_InsertPersonagem(
        @NomePersonagem VARCHAR(100),
        @PowerLevel FLOAT,
        @idRaca SMALLINT,
        @idClasse SMALLINT
    )
    AS
        BEGIN 
            INSERT INTO tbl_Personagem(
                nome_Personagem,
                powerLevel_Personagem,
                id_Raca,
                id_Classe
            )
            VALUES(
                @NomePersonagem,
                @PowerLevel,
                @idRaca,
                @idClasse
            )
        END 

        EXEC DBZ_InsertPersonagem 'Androide 18',2342,1,1;
        EXEC DBZ_InsertPersonagem 'Freeza',1000000,2,1;
        EXEC DBZ_InsertPersonagem 'Piccolo',4542,3,2;
        EXEC DBZ_InsertPersonagem 'Mr Satan',0, 4, 2;
        EXEC DBZ_InsertPersonagem 'Velho Kaiohshin',30000,5, 1;
        EXEC DBZ_InsertPersonagem 'Majin Boo',10000000, 6, 1;
        EXEC DBZ_InsertPersonagem 'Goku',150000000,7, 1;
        EXEC DBZ_InsertPersonagem 'Whis',20000000,8, 1;
        EXEC DBZ_InsertPersonagem 'Beerus',30000000, 9, 1;


TRUNCATE TABLE tbl_Personagem;

EXEC DBZ_SelectPersonagem
------------------------------------------------------------------------------------
GO
    CREATE PROCEDURE DBZ_AlteraPersonagem(
        @ID SMALLINT,
        @NomePersonagem VARCHAR(100),
        @PowerLevel FLOAT,
        @idRaca SMALLINT,
        @idClasse SMALLINT
    )
    AS
        BEGIN 
            UPDATE tbl_Personagem
                SET 
                    nome_Personagem = @NomePersonagem,
                    powerLevel_Personagem = @PowerLevel
                WHERE 
                    id_Personagem = @ID;
        END
------------------------------------------------------------------------------------
GO
    CREATE PROCEDURE DBZ_ExcluiPersonagem(
        @ID SMALLINT
    )
    AS
        BEGIN 
            DELETE FROM tbl_Personagem
            WHERE id_Personagem = @ID;
        END
--Aqui terminamam as procedures de Personagem
GO 
------------------------------------------------------------------------------------
--Aqui começam as procedures das Informações das Raças
    CREATE PROCEDURE DBZ_SelectInformacoesRaca
    AS
        BEGIN 
            SELECT * FROM tbl_infoRaca
        END

------------------------------------------------------------------------------------
GO 
    CREATE PROCEDURE DBZ_InsertInformacoesRaca(
        @ID SMALLINT,
        @Descricao VARCHAR(255)
    )
    AS
        BEGIN
            INSERT INTO tbl_infoRaca(
                id_Raca,
                desc_Raca
            )
            VALUES(
                @ID,
                @Descricao
            )
        END

        EXEC DBZ_InsertInformacoesRaca 1, 'Humanos Articiais, são terráqueos cyborgs/robóticos, sendo a maioria deles criada pelo Dr. Gero';
        EXEC DBZ_InsertInformacoesRaca 2, 'Os membros da família de Freeza são mutantes especialmente fortes com um nível anormal de crueldade.';
        EXEC DBZ_InsertInformacoesRaca 3, 'Eles estão entre as raças mais importantes, pois eles são os criadores das Esferas do Dragão.';
        EXEC DBZ_InsertInformacoesRaca 4, '1% dos terráqueos são híbridos, 7% são tipo monstro, 17% são tipo animal, e os restantes são normais';
        EXEC DBZ_InsertInformacoesRaca 5, 'Os Shin-jins nascem de frutas mágicas que nascem das árvores Kaiju, possuem habilidades especiais.';
        EXEC DBZ_InsertInformacoesRaca 6, 'Um dos aspectos mais interessantes sobre os Majins são seus corpos que mudam de forma.';
        EXEC DBZ_InsertInformacoesRaca 7, 'Os Saiyajins são uma raça guerreira que foi quase toda extinta por Freeza, sua origem é de Sadala.';
        EXEC DBZ_InsertInformacoesRaca 8, 'Os anjos são seres que acompanham os deuses, agindo como seus treinadores e conselheiros.';
        EXEC DBZ_InsertInformacoesRaca 9, 'Deuses da Destruição são seres que destroem planetas, ao contrário dos Kaiohshins que são da Criação';

EXEC DBZ_SelectInformacoesRaca


EXEC DBZ_AlteraRaca 3, 'Namekuseijin';
GO 
------------------------------------------------------------------------------------
    CREATE PROCEDURE DBZ_AlteraInformacoesRaca(
        @ID SMALLINT,
        @Descricao VARCHAR(255)
    )
    AS  
        BEGIN 
            UPDATE tbl_infoRaca
                SET desc_Raca = @Descricao
            WHERE 
                id_Raca = @ID;
        END
GO 
    CREATE PROCEDURE DBZ_ExcluiInformacoesRaca(
        @ID SMALLINT
    )
    AS 
        BEGIN 
            DELETE FROM tbl_infoRaca
            WHERE id_Raca = @ID;
        END 
GO 
--Aqui terminam as procedures das informações das raças
------------------------------------------------------------------------------------
GO 
    CREATE PROCEDURE DBZ_BuscaInfoPersonagem(
        @ID SMALLINT
    )
    AS 
        BEGIN 
            SELECT TP.nome_Personagem,
                   TR.nome_Raca,
                   TIF.desc_Raca, 
                   TP.powerLevel_Personagem,
                   CASE
                        WHEN TP.powerLevel_Personagem > 8000 THEN 'É MAIS DE 8 MIL!' 
                        ELSE 'É 37 ANOS, CARALHO!' END AS 'MENSAGEM'
                FROM tbl_Personagem AS TP 
                    INNER JOIN tbl_Raca AS TR
                        ON TP.id_Raca = TR.id_Raca
                    INNER JOIN tbl_infoRaca AS TIF
                        ON TR.id_Raca = TIF.id_Raca
                WHERE TP.id_Personagem = @ID;
                
                /*
                DECLARE @Valor FLOAT;
                DECLARE @ID2 SMALLINT;
                
                SET @Valor = (SELECT tbl_Personagem.powerLevel_Personagem FROM tbl_Personagem WHERE id_Personagem = @ID);
                
                IF(@Valor > 8000)
                    BEGIN 
                        SELECT 'MENSAGEM' 
                    END                  
                ELSE
                    BEGIN
                        SELECT 'MENSAGEM!'
                    END */
        END
 
        EXEC DBZ_BuscaInfoPersonagem 12;
GO

USE db_Desafio

GO
------------------------------------------------------------------------------------
CREATE PROCEDURE DBZ_RightJoin(
    @ID SMALLINT
)
AS
    BEGIN 
        SELECT TP.id_Personagem, TP.nome_Personagem, TC.id_Classe, TC.desc_Classe
            FROM tbl_Personagem AS TP
                RIGHT JOIN tbl_Classe AS TC 
                    ON TP.id_Classe = TC.id_Classe
          --WHERE TP.id_Classe = @ID;
    END 

GO
------------------------------------------------------------------------------------
--TRANSACTION RIGHT JOIN
BEGIN TRANSACTION 
    EXEC DBZ_RightJoin 15
ROLLBACK TRANSACTION

DROP PROCEDURE  DBZ_RightJoin

GO 
------------------------------------------------------------------------------------
CREATE PROCEDURE DBZ_LeftJoin(
    @ID SMALLINT 
)
AS 
    BEGIN 
        SELECT TR.id_Raca, TR.nome_Raca, TIF.desc_Raca
            FROM tbl_Raca AS TR
                LEFT JOIN tbl_infoRaca AS TIF
                    ON TR.id_Raca = TIF.id_Raca
            WHERE TR.id_Raca = @ID
    END 

DROP PROCEDURE DBZ_LeftJoin
----------------------------------------------------------------------------------
GO 
CREATE PROCEDURE DBZ_SelectDinamica(
    @Tabela VARCHAR(50),
    @Colunas VARCHAR(500),
    @ChaveTabela VARCHAR(50),
    @ChaveValor VARCHAR(50) = NULL
)
AS 
    BEGIN 
        DECLARE @Comando VARCHAR(2000)

        SET @Comando = 'SELECT ' +@Colunas + ' FROM ' +@Tabela+ ' WHERE ' +@ChaveTabela+ ' = ' + ISNULL(@ChaveValor, 0)
        EXEC(@Comando)
    END 
GO
----DROP PROCEDURE DBZ_ExcluiDinamica -------------------------------------------------------------------------------
GO 
CREATE PROCEDURE DBZ_ExcluiDinamica(
    @Tabela VARCHAR(50),
    @ChaveTabela VARCHAR(50),
    @ValorChave VARCHAR(50) 
)
AS 
    BEGIN 
        DECLARE @Comando VARCHAR(2000)
        SET @Comando = 'DELETE FROM ' + @Tabela + ' WHERE ' +@ChaveTabela + ' = ' + @ValorChave 
        EXEC (@Comando)
    END 
------------------------------------------------------------------------------------
GO 
--PROC PARA SELECIONAR DINAMICAMENTE
BEGIN TRANSACTION 
    EXEC DBZ_SelectDinamica 'tbl_infoRaca', 'id_Raca, desc_Raca', 'id_Raca', '5'
ROLLBACK TRANSACTION 

GO 
--PROC PARA INSERIR DINAMICAMENTE
BEGIN TRANSACTION 
    EXEC DBZ_InsertDinamica 'tbl_Classe', 'desc_Classe', 'NEUTR'
ROLLBACK TRANSACTION 

--PROC PARA EXCLUIR DINAMICAMENTE 
BEGIN TRANSACTION 
    EXEC DBZ_ExcluiDinamica 'tbl_Classe', 'id_Classe', '2'
ROLLBACK TRANSACTION 

--TRANSACTION LEFT JOIN
BEGIN TRANSACTION 
    EXEC DBZ_LeftJoin 1
ROLLBACK TRANSACTION
GO 

--COMEÇANDO USAR TRANSACTIONS
BEGIN TRANSACTION
    EXEC DBZ_ExcluiPersonagem 12;
ROLLBACK TRANSACTION
