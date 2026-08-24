CREATE TABLE IF NOT EXISTS tipoambiente(
    nome VARCHAR(30) NOT NULL,

    id SERIAL2 NOT NULL,

    CONSTRAINt pk_tipoambiente PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS pessoa(
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone char(14) NOT NULL,
    cargo VARCHAR(40),

    id SERIAL2 NOT NULL,

    CONSTRAINT pk_pessoa PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tipoequipamento(
    nome VARCHAR(30) NOT NULL,

    id SERIAL2 NOT NULL,

    CONSTRAINt pk_tipoequipamento PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS ambiente(
    nome VARCHAR(20) NOT NULL,
    bloco char(1) NOT NULL,
    andar int2 NOT NULL,

    id SERIAL NOT NULL,
    idtipoambiente INT2 NOT NULL,

    CONSTRAINT pk_ambiente PRIMARY KEY(id),

    CONSTRAINT fk_tipoambiente
    FOREIGN KEY (idtipoambiente)
    REFERENCES tipoambiente(id)
);

CREATE TABLE IF NOT EXISTS equipamento(
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(100),
    data_adicionado DATE,
    patrimonio INT,

    id SERIAL8 NOT NULL,
    idtipoequiapmento INT2 NOT NULL,

    CONSTRAINT pk_equipamento PRIMARY KEY(id),

    CONSTRAINT fk_tipoequipamento
    FOREIGN KEY (idtipoequiapmento)
    REFERENCES tipoequipamento(id)
);

CREATE TABLE IF NOT EXISTS manutencao(
    responsavel VARCHAR(60) NOT NULL,
    nome_problema VARCHAR(60) NOT NULL,
    descricao_problema VARCHAR(200),
    custo DECIMAL(8,2) NOT NULL,
    descricao_manutencao VARCHAR(200),
    data_saida DATE,
    data_entrada DATE NOT NULL,

    id SERIAL8 NOT NULL,
    idequipamento INT8 NOT NULL,
    idpessoa INT2 NOT NULL,

    CONSTRAINT pk_manutencao PRIMARY KEY(id),

    CONSTRAINT fk_equipamento
    FOREIGN KEY (idequipamento)
    REFERENCES equipamento(id),

    
    CONSTRAINT fk_pessoa
    FOREIGN KEY (idpessoa)
    REFERENCES pessoa(id)
);


CREATE TABLE IF NOT EXISTS lotacao(
    data_entrada DATE NOT NULL,
    data_saida DATE, 

    id SERIAL8 NOT NULL,
    idequipamento INT8 NOT NULL,
    idambiente INT NOT NULL,
    idpessoa INT2 NOT NULL,

    CONSTRAINT pk_lotacao PRIMARY KEY(id),

    CONSTRAINT fk_equipamento
    FOREIGN KEY (idequipamento)
    REFERENCES equipamento(id),

    CONSTRAINT fk_ambiente
    FOREIGN KEY (idequipamento)
    REFERENCES equipamento(id),
    
    CONSTRAINT fk_pessoa
    FOREIGN KEY (idpessoa)
    REFERENCES pessoa(id)
);