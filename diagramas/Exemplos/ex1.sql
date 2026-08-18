
CREATE TABLE IF NOT EXISTS categoria (
    nome VARCHAR(50) NOT NULL,
    id SERIAL2 NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY(id),
);

--Tabela produto
CREATE TABLE IF NOT EXISTS produto (
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(200),
    valor_unitario MONEY DEFAULT 0,
    qtde INT DEFAULT 0,
    imagem VARCHAR(100),

    id SERIAL4 NOT NULL,
    idcategoria INT2 NOT NULL,

    CONSTRAINT pk_produto PRIMARY KEY(id),

    CONSTRAINT fk_categoria 
    FOREIGN KEY (idcategoria)
    REFERENCES categoria(id)
);


-- Tabela lote
CREATE TABLE IF NOT EXISTS lote (
    data_fabricacao DATE NOT NULL,
    data_validade DATE NOT NULL,
    qtde INT2 NOT NULL,
    custo MONEY NOT NULL DEFAULT 0,
    localizacao CHAR(1) NOT NULL DEFAULT 'E',
    id SERIAL8 NOT NULL,
    idproduto INT NOT NULL,

    CONSTRAINT pk_lote PRIMARY KEY(id),

    CONSTRAINT fk_produto 
    FOREIGN KEY (idproduto)
    REFERENCES produto(id)
);