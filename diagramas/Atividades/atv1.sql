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
    custo MONEY NOT NULL,
    ativo BOOL NOT NULL,
    id SERIAL8 NOT NULL,
    idtipoequipamento INT2 NOT NULL,

    CONSTRAINT pk_equipamento PRIMARY KEY(id),

    CONSTRAINT fk_tipoequipamento
    FOREIGN KEY (idtipoequipamento)
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

/*

-- POPULAR TABELAS DO BANCO DE DADOS

INSERT INTO tipoambiente (nome) VALUES
('Depósito'),
('Lab Informática'),
('Sala de Aula'),
('Biblioteca'),
('Diretoria'),
('Secretaria'),
('Sala dos Professores'),
('Auditório'),
('Sala de Reunião'),
('Almoxarifado');

INSERT INTO pessoa (nome, email, telefone, cargo) VALUES
('Marcus Martins', 'marcusvmartins@gmail.com', '65 99810-6373', 'Coordenador'),
('Ana Paula Souza', 'ana.souza@email.com', '65 99999-1111', 'Técnica de TI'),
('Carlos Eduardo', 'carlos.eduardo@email.com', '65 98888-2222', 'Professor'),
('Fernanda Lima', 'fernanda.lima@email.com', '65 97777-3333', 'Diretora'),
('Roberto Alves', 'roberto.alves@email.com', '65 96666-4444', 'Assistente Administrativo'),
('Juliana Costa', 'juliana.costa@email.com', '65 95555-5555', 'Bibliotecária'),
('Pedro Henrique', 'pedro.henrique@email.com', '65 94444-6666', 'Auxiliar de Manutenção'),
('Mariana Silva', 'mariana.silva@email.com', '65 93333-7777', 'Secretária'),
('Lucas Mendes', 'lucas.mendes@email.com', '65 92222-8888', 'Técnico de Redes'),
('Camila Rocha', 'camila.rocha@email.com', '65 91111-9999', 'Professora');

INSERT INTO tipoequipamento (nome) VALUES
('Desktop'),
('Notebook'),
('Datashow'),
('Impressora Laser'),
('Roteador Wi-Fi'),
('Switch 24 portas'),
('Servidor de Rack'),
('Monitor 24"'),
('Mesa Digitalizadora');

INSERT INTO ambiente (nome, bloco, andar, idtipoambiente) VALUES
('LAB 1', 'D', 2, 2),
('LAB 2', 'D', 2, 2),
('Sala 101', 'A', 1, 3),
('Sala 102', 'A', 1, 3),
('Depósito Central', 'B', 0, 1),
('Biblioteca Principal', 'C', 1, 4),
('Sala da Direção', 'A', 2, 5),
('Auditório Principal', 'C', 0, 8),
('Sec Acadêmica', 'A', 0, 6),
('Reuniões 1', 'B', 1, 9);

INSERT INTO equipamento (nome, descricao, data_adicionado, patrimonio, custo, ativo, idtipoequipamento) VALUES
('ThinkCentre M720q', 'I7 8GB 500GB SSD', '2023-01-15', 239734, 2599.99, true, 1),
('Dell Latitude 3420', 'I5 16GB 256GB SSD', '2023-02-10', 239735, 4200.00, true, 2),
('Epson PowerLite X39', 'Projetor 3500 Lumens', '2022-05-20', 239736, 3100.50, true, 3),
('HP LaserJet Pro', 'Impressora Monocromática', '2022-08-11', 239737, 1250.00, true, 4),
('Cisco Catalyst 2960', 'Switch Gerenciável 24 portas', '2021-11-05', 239738, 5600.00, true, 6),
('Dell PowerEdge R440', 'Xeon Silver, 64GB RAM', '2023-06-30', 239739, 15000.00, true, 7),
('Monitor Dell P2419H', 'Monitor LED 24 polegadas IPS', '2023-01-15', 239740, 1100.00, true, 8),
('Wacom Intuos Pro', 'Mesa Digitalizadora Média', '2023-03-22', 239741, 1850.00, true, 9),
('ThinkCentre M720q', 'I7 8GB 500GB SSD', '2023-01-15', 239743, 2599.99, true, 1);

INSERT INTO manutencao (responsavel, nome_problema, descricao_problema, custo, descricao_manutencao, data_saida, data_entrada, idequipamento, idpessoa) VALUES
('Francisco Silva', 'Ruído Alto', 'Ao ligar o computador, ele apresenta forte ruído', 450.00, 'Conjunto de Arrefecimento Substituído', '2026-08-30', '2026-08-28', 1, 2),
('Ana Paula Souza', 'Não liga', 'Equipamento não dá sinal de energia', 150.00, 'Troca da fonte de alimentação', '2023-04-10', '2023-04-05', 2, 2),
('Lucas Mendes', 'Imagem borrada', 'Lente do projetor está suja e desregulada', 80.00, 'Limpeza e calibração', '2023-05-15', '2023-05-14', 3, 9),
('Empresa Terceirizada', 'Atolamento de papel', 'Impressora puxando várias folhas e travando', 200.00, 'Troca do rolete de tração', '2022-10-02', '2022-09-28', 4, 2),
('Ana Paula Souza', 'Lentidão no sistema', 'Windows demorando muito para iniciar', 0.00, 'Formatação e reinstalação do SO', '2023-02-25', '2023-02-24', 9, 2),
('Lucas Mendes', 'Portas queimadas', 'Switch com 4 portas inoperantes após chuva', 0.00, 'Isolamento das portas (sem conserto viável, aguardando troca)', '2022-03-05', '2022-03-01', 5, 9),
('Assistência Dell', 'Alerta RAID', 'Servidor apitando acusando falha no disco 2', 1200.00, 'Substituição do HD SAS e rebuild do array', '2023-07-15', '2023-07-10', 6, 2),
('Ana Paula Souza', 'Teclado falhando', 'Teclas A e S não funcionam', 50.00, 'Troca do teclado do notebook', '2023-05-02', '2023-04-30', 2, 2),
('Francisco Silva', 'Desligando sozinho', 'Desktop desliga após 30 min de uso', 180.00, 'Troca da pasta térmica e limpeza interna', '2023-08-10', '2023-08-08', 1, 2),
('Francisquito', 'Desligando', 'Desktop desliga após 15 min de uso', 180.00, 'Troca da pasta térmica e limpeza interna', NULL, '2023-08-08', 1, 2);

INSERT INTO lotacao (data_entrada, data_saida, idequipamento, idambiente, idpessoa) VALUES
('2023-01-16', '2023-08-25', 1, 1, 1),
('2023-08-26', NULL, 1, 7, 4),
('2023-02-11', NULL, 2, 9, 8),
('2022-05-21', NULL, 3, 3, 3),
('2022-08-12', NULL, 4, 6, 6),
('2021-11-06', NULL, 5, 5, 9),
('2023-07-01', NULL, 6, 5, 2),
('2023-01-16', NULL, 7, 1, 10),
('2023-03-23', '2023-06-10', 8, 2, 3),
('2023-06-11', NULL, 8, 3, 3);


INSERT INTO manutencao (idequipamento,data_entrada,data_saida,descricao_problema,descricao_manutencao,custo,contato,idusuario)
VALUES
(14,'2026-08-12','2026-08-12','Não liga','Colocar na tomada',DEFAULT,'Ariovaldo (1234-2222)',1),
(4,'2026-08-20',NULL,'Bateria não está carregando',NULL,DEFAULT,'Ariovaldo (1234-2222)',2);


-- Faça uma consulta que exiba todos os equipamentos inativos cujo valor seja menor do que 1000.
SELECT *
FROM equipamento
WHERE ativo=FALSE AND valor<1000;


-- Faça uma consulta que exiba todos os equipamentos ativos que ainda não foram patrimoniados
SELECT *
FROM equipamento
WHERE ativo=TRUE AND patrimoniado=FALSE;


-- Faça uma consulta que liste os equipamentos que tenham a palavra datashow na descrição.
SELECT *
FROM equipamento
WHERE UPPER(descricao) LIKE '%DATASHOW%';


-- Faça uma consulta que lista os equipamentos da categoria "Notebook"
SELECT *
FROM equipamento
WHERE idtipo_equipamento = (SELECT id 
                            FROM tipo_equipamento
                            WHERE UPPER(nome)='NOTEBOOK');


-- Faça uma consulta que liste a lotação atual do equipamento de código 2
SELECT identificacao, bloco, andar
FROM ambiente
WHERE id= (SELECT idambiente
          FROM lotacao
          WHERE idequipamento=2
          ORDER BY data DESC, id DESC
          LIMIT 1);


-- Faça uma consulta que liste a identificação do ambiente e o nome do tipo de ambiente 
-- ordenado por tipo de ambiente
SELECT t.nome AS tipo, a.identificacao, a.bloco, a.andar, a.area, a.capacidade 
FROM tipo_ambiente t INNER JOIN ambiente a ON t.id = a.idtipo_ambiente
ORDER BY t.nome ASC, a.bloco ASC, a.andar ASC;


-- Faça uma consulta que liste os equipamentos (nome, descricao, patrimonio)
-- que se encontram em manutenção
SELECT e.id AS patrimonio, e.nome AS equipamento, e.descricao, m.data_entrada AS manutencao_desde 
FROM equipamento e INNER JOIN manutencao m ON e.id=m.idequipamento
WHERE m.data_saida IS NULL;


-- Faça uma consulta que exiba todos os equipamentos inativos cujo valor seja menor do que 4000.
SELECT * FROM equipamento WHERE custo < 4000 AND ativo = false;


-- Faça uma consulta que exiba todos os equipamentos ativos que ainda não foram patrimoniados
SELECT * FROM equipamento WHERE patrimonio = 0 AND ativo = true;


-- Faça uma consulta que liste os equipamentos que tenham a palavra 500GB na descrição.
SELECT * FROM equipamento WHERE patrimonio LIKE '%500GB%';


-- Faça uma consulta que lista os equipamentos da categoria "Notebook"
SELECT * FROM equipamento WHERE idtipoequipamento = 2; ou SELECT * FROM equipamento WHERE idtipoequipamento = (SELECT id FROM tipoequipamento WHERE UPPER(nome) = 'NOTEBOOK');
SELECT * FROM lotacao WHERE idequipamento = 1; 


-- Faça uma consulta que liste a lotação atual do equipamento de código 2
SELECT idambiente FROM lotacao WHERE idequipamento ORDER BY data DESC LIMIT 1;
SELECT * FROM ambiente WHERE id = (SELECT idambiente FROM lotacao WHERE idequipamento = 2 ORDER BY data_entrada DESC, id DESC LIMIT 1);

-- Faça uma consulta que liste a identificação do ambiente e o nome do tipo de ambiente 
-- ordenado por tipo de ambiente
SELECT t.nome, a.nome, a.bloco, a.andar, a.bloco FROM tipoambiente t INNER JOIN ambiente a ON t.id = a.idtipoambiente ORDER BY t.nome ASC, a.nome ASC;

-- Faça uma consulta que liste os equipamentos (nome, descricao, patrimonio)
-- que se encontram em manutenção
SELECT * FROM manutencao  WHERE data_saida = NULL;

-- Faça uma consulta que liste os equipamentos (nome, descricao, patrimonio)
-- que se encontram em manutenção
SELECT e.nome, e.descricao, e.patrimonio, 
FROM equipamento e INNER JOIN manutencao m ON e.id = m.idequipamento
WHERE data_saida IS NULL;

-- Faça uma consulta que liste a lotação atual do equipamento de código 2.
-- No resultado deverá ser apresentado o nome do tipo de equipamento, 
-- a identificaçõ do ambiente, bem como o tipo de ambiente e o nome do usuário
-- que realizou a lotação
SELECT ta.nome AS Tipo_Ambiente, a.nome AS Ambiente,  te.nome AS Tipo_Equipamento, p.nome AS Responsavel
FROM equipamento e 
INNER JOIN lotacao l ON e.id = l.idequipamento
INNER JOIN ambiente a ON  a.id = l.idambiente
INNER JOIN tipoambiente ta ON ta.id = a.idtipoambiente
INNER JOIN pessoa p ON p.id = l.idpessoa
INNER JOIN tipoequipamento te ON te.id = e.idtipoequipamento
WHERE e.id = 2 AND l.data_saida IS NULL;


-- Faça uma consulta que apresente o menor e o maior valor de equipamento já adquirido
SELECT MIN(custo), MAX(custo) FROM equipamento;


-- Faça uma consulta que apresente o nome, a descrição e o tipo de equipamento de maior valor
SELECT nome, custo FROM equipamento 
WHERE custo = (SELECT MAX(custo) FROM equipamento);


-- Faça uma consulta que apresente a área total do bloco A
SELECT SUM(area) FROM AMBIENTE
WHERE bloco = 'A';


-- Faça uma consulta que apresente a qtde de ambientes do bloco A
SELECT COUNT(id) FROM AMBIENTE
WHERE bloco = 'A';


-- Faça uma consulta que apresente a média de dias que os equipamentos ficam em manutenção
SELECT AVG(data_saida-data_entrada) FROM manutencao WHERE data_saida IS NOT NULL;


-- Faça uma consulta que apresente a área total do bloco A
SELECT SUM(area) FROM ambiente WHERE bloco = 'A';

-- Faça uma consulta que apresente a qtde de ambientes por bloco
SELECT bloco, COUNT(bloco) AS Quantidade
FROM ambiente 
GROUP BY bloco
ORDER BY bloco;


-- Faça uma consulta que apresente a qtde de equipamentos por 
-- tipo de equipamento.
SELECT te.nome, COUNT(te.nome) AS QuantidadeEquipamento
FROM equipamento e INNER JOIN tipoequipamento te ON te.id  = e.idtipoequipamento
GROUP BY te.nome;


-- Faça uma consulta que apresente a qtde de manutenções mês a mês
SELECT EXTRACT(YEAR FROM data_entrada) AS Ano, EXTRACT(MONTH FROM data_entrada) AS Mes, COUNT(EXTRACT(MONTH FROM data_entrada)) AS QuantidadeManutencao
FROM manutencao
GROUP BY EXTRACT(MONTH FROM data_entrada),EXTRACT(YEAR FROM data_entrada)
ORDER BY EXTRACT(YEAR FROM data_entrada), EXTRACT(MONTH FROM data_entrada);

-- Faça uma consulta que apresente a qtde de equipamentos por ambiente
SELECT amb.nome AS nomeAmbiente, COUNT(amb.nome) AS qntEquipamento
FROM lotacao l INNER JOIN ambiente amb ON amb.id= l.idambiente 
WHERE l.data_saida IS NULL
GROUP BY (amb.nome)
ORDER BY amb.nome;

-- Faça uma consulta que apresente a qtde de operações (lotação e manutenção) 
-- de cada usuário em um determinado ano/mês
SELECT o.ano, o.mes, p.nome, COUNT(*) AS qtde_op
FROM 
(SELECT idpessoa, EXTRACT(YEAR FROM data_entrada) AS ano, EXTRACT(MONTH FROM data_entrada) AS mes FROM lotacao
UNION ALL
SELECT idpessoa, EXTRACT(YEAR FROM data_entrada) AS ano, EXTRACT(MONTH FROM data_entrada) AS mes FROM manutencao) o
INNER JOIN pessoa p ON p.id = o.idpessoa
GROUP BY o.ano, o.mes, p.nome 
ORDER BY o.ano, o.mes, p.nome;

*/

