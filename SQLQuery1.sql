CREATE DATABASE HOSPITAL;
 
USE HOSPITAL;
 
CREATE TABLE MEDICO(
	MED_INT_ID INT NOT NULL IDENTITY (1,1) ,
	MED_STR_NOME VARCHAR (70) NOT NULL,
	MED_STR_CPF CHAR (11) NOT NULL,
	CONSTRAINT PK_MEDICO_ID PRIMARY KEY(MED_INT_ID),
	CONSTRAINT UK_MEDICO_CPF UNIQUE(MED_STR_CPF),
)
 
CREATE TABLE PACIENTE (
	PAC_INT_ID INT NOT NULL IDENTITY (1,1),
	PAC_STR_NOME VARCHAR (70) NOT NULL,
	PAC_STR_CPF CHAR (11) NOT NULL,
	CONSTRAINT PK_PACIENTE_ID PRIMARY KEY(PAC_INT_ID),
	CONSTRAINT UK_PACIENTE_CPF UNIQUE (PAC_STR_CPF)
)
 
CREATE TABLE CONSULTA (
	CON_INT_ID INT NOT NULL IDENTITY (1,1),
	PAC_INT_ID INT,
	MED_INT_ID INT,
	CONSTRAINT PK_CONSULTA_ID PRIMARY KEY (CON_INT_ID),
	CONSTRAINT FK_CONSULTA_PAC_ID FOREIGN KEY (PAC_INT_ID) REFERENCES PACIENTE (PAC_INT_ID),
	CONSTRAINT FK_CONSULTA_MED_ID FOREIGN KEY (MED_INT_ID) REFERENCES MEDICO (MED_INT_ID)
)
 
CREATE TABLE MEDICAMENTO (
	 MEC_INT_ID INT NOT NULL IDENTITY(1,1),
	 MEC_STR_DESCRICAO VARCHAR (70) NOT NULL,
	 MEC_STR_CODBARRAS VARCHAR (70) NOT NULL
	 CONSTRAINT PK_MEDICAMENTO_ID PRIMARY KEY (MEC_INT_ID),
	 CONSTRAINT UK_MEDICAMENTO_CODBARRAS UNIQUE (MEC_STR_CODBARRAS)
)
 
CREATE TABLE RECEITA(
	CON_INT_ID INT NOT NULL,
	MEC_INT_ID INT NOT NULL,
	CONSTRAINT FK_RECEITA_MEDICAMENTO_ID FOREIGN KEY (MEC_INT_ID) REFERENCES MEDICAMENTO (MEC_INT_ID),
	CONSTRAINT FK_RECEITA_CONSULTA_ID FOREIGN KEY (CON_INT_ID) REFERENCES CONSULTA (CON_INT_ID),
)
 
--DML--------------------
 
--INSERT, UPDATE E DELETE
 
--insert medicos
INSERT INTO MEDICO (MED_STR_NOME, MED_STR_CPF) VALUES ('NOME','11111111111');
 
INSERT INTO MEDICO (MED_STR_NOME, MED_STR_CPF) VALUES ('GABRIEL','20145678955');

INSERT INTO MEDICO (MED_STR_NOME, MED_STR_CPF) VALUES ('Roberto Carlos','08243205051');

INSERT INTO MEDICO (MED_STR_NOME, MED_STR_CPF) VALUES ('Marcelo','08263205051');

INSERT INTO MEDICO (MED_STR_NOME, MED_STR_CPF) VALUES ('loangelelson','7357393873');

--insert paciente

INSERT INTO PACIENTE (PAC_STR_NOME, PAC_STR_CPF) VALUES ('Marcos', '34391424002')

INSERT INTO PACIENTE (PAC_STR_NOME, PAC_STR_CPF) VALUES ('Robson', '34234424002')

INSERT INTO PACIENTE (PAC_STR_NOME, PAC_STR_CPF) VALUES ('Zizao', '34391358002')

INSERT INTO PACIENTE (PAC_STR_NOME, PAC_STR_CPF) VALUES ('Guerrero', '3439142807')
 

--selects
SELECT * FROM MEDICO  

SELECT * FROM PACIENTE


--insert medicamento 

INSERT INTO MEDICAMENTO (MEC_STR_DESCRICAO, MEC_STR_CODBARRAS) VALUES ('dipirona','2244')

INSERT INTO MEDICAMENTO (MEC_STR_DESCRICAO, MEC_STR_CODBARRAS) VALUES ('prednisona','2344')
--consulta em uma entidade tercearia

INSERT INTO CONSULTA (MED_INT_ID, PAC_INT_ID) VALUES (2,1)

--RELA��O ENTRE MUITOS PARA MUITOS^^^^^^^^^^^^

--INNER JOIN

SELECT * FROM CONSULTA

SELECT
M.MED_STR_NOME AS [MEDICO],
P.PAC_STR_NOME AS [PACIENTE],
ME.MEC_STR_DESCRICAO AS [MEDICA��O]
C.CON_INT_ID
FROM MEDICO AS M INNER JOIN CONSULTA AS C ON M.MED_INT_ID = C.MED_INT_ID
INNER JOIN PACIENTE AS P ON P.PAC_INT_ID = C.PAC_INT_ID 
INNER JOIN MEDICAMENTO AS ME ON ME.MEC_INT_ID = C.MEC_INT_ID

--UPDATE

UPDATE MEDICO
SET MED_STR_NOME = 'Jubiscreuda Augustto'
WHERE MED_INT_ID = 3