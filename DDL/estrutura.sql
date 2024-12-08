CREATE TABLE UDR_CRM_CAMPANHAS (
    CAMPANHA_ID NUMBER(38,0) NOT NULL,
    NOME VARCHAR2(100) NOT NULL,
    DATA_INICIO DATE,
    DATA_FIM DATE,
    ORCAMENTO NUMBER(10,2),
    CONSTRAINT PK_UDR_CRM_CAMPANHAS PRIMARY KEY (CAMPANHA_ID)
);

CREATE TABLE UDR_CRM_INTERACOES (
    INTERACAO_ID NUMBER(38,0) NOT NULL,
    CLIENTE_ID NUMBER(38,0) NOT NULL,
    CAMPANHA_ID NUMBER(38,0) NOT NULL,
    DATA_INTERACAO DATE,
    TIPO VARCHAR2(100),
    METRICA VARCHAR2(100),
    VALOR NUMBER(38,0),
    CONSTRAINT PK_UDR_CRM_INTERACOES PRIMARY KEY (INTERACAO_ID),
    CONSTRAINT FK_UDR_CRM_INTERACOES_CAMPANHA FOREIGN KEY (CAMPANHA_ID) 
        REFERENCES UDR_CRM_CAMPANHAS(CAMPANHA_ID)
);

CREATE TABLE UDR_CRM_CLIENTES (
    CLIENTE_ID NUMBER(38,0) NOT NULL,  
    NOME VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100),
    TELEFONE VARCHAR2(20),
    DATA_CADASTRO DATE,
    CONSTRAINT PK_UDR_CRM_CLIENTES PRIMARY KEY (CLIENTE_ID)
);

ALTER TABLE UDR_CRM_INTERACOES ADD CONSTRAINT FK_UDR_CRM_INTERACOES_CLIENTE
    FOREIGN KEY (CLIENTE_ID) REFERENCES UDR_CRM_CLIENTES(CLIENTE_ID);