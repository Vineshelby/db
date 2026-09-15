--
-- PostgreSQL database dump
--

\restrict zQAKmV9KFCs3LfCUWaY83uMKMtyQYn81gMJAgstV22yaxFueM5cel9L6VlgNN34

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ambiente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ambiente (
    nome character varying(20) NOT NULL,
    bloco character(1) NOT NULL,
    andar smallint NOT NULL,
    id integer NOT NULL,
    idtipoambiente smallint NOT NULL,
    area numeric(8,2) DEFAULT 0
);


ALTER TABLE public.ambiente OWNER TO postgres;

--
-- Name: ambiente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ambiente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ambiente_id_seq OWNER TO postgres;

--
-- Name: ambiente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ambiente_id_seq OWNED BY public.ambiente.id;


--
-- Name: equipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamento (
    nome character varying(40) NOT NULL,
    descricao character varying(100),
    data_adicionado date,
    patrimonio integer,
    custo money NOT NULL,
    ativo boolean NOT NULL,
    id bigint NOT NULL,
    idtipoequipamento smallint NOT NULL
);


ALTER TABLE public.equipamento OWNER TO postgres;

--
-- Name: equipamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipamento_id_seq OWNER TO postgres;

--
-- Name: equipamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipamento_id_seq OWNED BY public.equipamento.id;


--
-- Name: lotacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lotacao (
    data_entrada date NOT NULL,
    data_saida date,
    id bigint NOT NULL,
    idequipamento bigint NOT NULL,
    idambiente integer NOT NULL,
    idpessoa smallint NOT NULL
);


ALTER TABLE public.lotacao OWNER TO postgres;

--
-- Name: lotacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lotacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lotacao_id_seq OWNER TO postgres;

--
-- Name: lotacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lotacao_id_seq OWNED BY public.lotacao.id;


--
-- Name: manutencao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manutencao (
    responsavel character varying(60) NOT NULL,
    nome_problema character varying(60) NOT NULL,
    descricao_problema character varying(200),
    custo numeric(8,2) NOT NULL,
    descricao_manutencao character varying(200),
    data_saida date,
    data_entrada date NOT NULL,
    id bigint NOT NULL,
    idequipamento bigint NOT NULL,
    idpessoa smallint NOT NULL
);


ALTER TABLE public.manutencao OWNER TO postgres;

--
-- Name: manutencao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manutencao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manutencao_id_seq OWNER TO postgres;

--
-- Name: manutencao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manutencao_id_seq OWNED BY public.manutencao.id;


--
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    nome character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    telefone character(14) NOT NULL,
    cargo character varying(40),
    id smallint NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- Name: pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoa_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pessoa_id_seq OWNER TO postgres;

--
-- Name: pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoa_id_seq OWNED BY public.pessoa.id;


--
-- Name: tipoambiente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoambiente (
    nome character varying(30) NOT NULL,
    id smallint NOT NULL
);


ALTER TABLE public.tipoambiente OWNER TO postgres;

--
-- Name: tipoambiente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipoambiente_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipoambiente_id_seq OWNER TO postgres;

--
-- Name: tipoambiente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipoambiente_id_seq OWNED BY public.tipoambiente.id;


--
-- Name: tipoequipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoequipamento (
    nome character varying(30) NOT NULL,
    id smallint NOT NULL
);


ALTER TABLE public.tipoequipamento OWNER TO postgres;

--
-- Name: tipoequipamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipoequipamento_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipoequipamento_id_seq OWNER TO postgres;

--
-- Name: tipoequipamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipoequipamento_id_seq OWNED BY public.tipoequipamento.id;


--
-- Name: ambiente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambiente ALTER COLUMN id SET DEFAULT nextval('public.ambiente_id_seq'::regclass);


--
-- Name: equipamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento ALTER COLUMN id SET DEFAULT nextval('public.equipamento_id_seq'::regclass);


--
-- Name: lotacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao ALTER COLUMN id SET DEFAULT nextval('public.lotacao_id_seq'::regclass);


--
-- Name: manutencao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manutencao ALTER COLUMN id SET DEFAULT nextval('public.manutencao_id_seq'::regclass);


--
-- Name: pessoa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa ALTER COLUMN id SET DEFAULT nextval('public.pessoa_id_seq'::regclass);


--
-- Name: tipoambiente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoambiente ALTER COLUMN id SET DEFAULT nextval('public.tipoambiente_id_seq'::regclass);


--
-- Name: tipoequipamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoequipamento ALTER COLUMN id SET DEFAULT nextval('public.tipoequipamento_id_seq'::regclass);


--
-- Data for Name: ambiente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ambiente (nome, bloco, andar, id, idtipoambiente, area) FROM stdin;
LAB 1	D	2	1	2	20.00
LAB 2	D	2	2	2	20.00
Sala 101	A	1	3	3	20.00
Sala 102	A	1	4	3	20.00
DepÃ³sito Central	B	0	5	1	20.00
Biblioteca Principal	C	1	6	4	20.00
Sala da DireÃ§Ã£o	A	2	7	5	20.00
AuditÃ³rio Principal	C	0	8	8	20.00
Sec AcadÃªmica	A	0	9	6	20.00
ReuniÃµes 1	B	1	10	9	20.00
\.


--
-- Data for Name: equipamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamento (nome, descricao, data_adicionado, patrimonio, custo, ativo, id, idtipoequipamento) FROM stdin;
ThinkCentre M720q	I7 8GB 500GB SSD	2023-01-15	239734	R$ 2.599,99	t	1	1
Dell Latitude 3420	I5 16GB 256GB SSD	2023-02-10	239735	R$ 4.200,00	t	2	2
Epson PowerLite X39	Projetor 3500 Lumens	2022-05-20	239736	R$ 3.100,50	t	3	3
HP LaserJet Pro	Impressora MonocromÃ¡tica	2022-08-11	239737	R$ 1.250,00	t	4	4
Cisco Catalyst 2960	Switch GerenciÃ¡vel 24 portas	2021-11-05	239738	R$ 5.600,00	t	5	6
Dell PowerEdge R440	Xeon Silver, 64GB RAM	2023-06-30	239739	R$ 15.000,00	t	6	7
Monitor Dell P2419H	Monitor LED 24 polegadas IPS	2023-01-15	239740	R$ 1.100,00	t	7	8
Wacom Intuos Pro	Mesa Digitalizadora MÃ©dia	2023-03-22	239741	R$ 1.850,00	t	8	9
ThinkCentre M720q	I7 8GB 500GB SSD	2023-01-15	239743	R$ 2.599,99	t	9	1
\.


--
-- Data for Name: lotacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lotacao (data_entrada, data_saida, id, idequipamento, idambiente, idpessoa) FROM stdin;
2023-01-16	2023-08-25	1	1	1	1
2023-08-26	\N	2	1	7	4
2023-02-11	\N	3	2	9	8
2022-05-21	\N	4	3	3	3
2022-08-12	\N	5	4	6	6
2021-11-06	\N	6	5	5	9
2023-07-01	\N	7	6	5	2
2023-01-16	\N	8	7	1	10
2023-03-23	2023-06-10	9	8	2	3
2023-06-11	\N	10	8	3	3
\.


--
-- Data for Name: manutencao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manutencao (responsavel, nome_problema, descricao_problema, custo, descricao_manutencao, data_saida, data_entrada, id, idequipamento, idpessoa) FROM stdin;
Francisco Silva	RuÃ­do Alto	Ao ligar o computador, ele apresenta forte ruÃ­do	450.00	Conjunto de Arrefecimento SubstituÃ­do	2026-08-30	2026-08-28	1	1	2
Ana Paula Souza	NÃ£o liga	Equipamento nÃ£o dÃ¡ sinal de energia	150.00	Troca da fonte de alimentaÃ§Ã£o	2023-04-10	2023-04-05	2	2	2
Lucas Mendes	Imagem borrada	Lente do projetor estÃ¡ suja e desregulada	80.00	Limpeza e calibraÃ§Ã£o	2023-05-15	2023-05-14	3	3	9
Empresa Terceirizada	Atolamento de papel	Impressora puxando vÃ¡rias folhas e travando	200.00	Troca do rolete de traÃ§Ã£o	2022-10-02	2022-09-28	4	4	2
Ana Paula Souza	LentidÃ£o no sistema	Windows demorando muito para iniciar	0.00	FormataÃ§Ã£o e reinstalaÃ§Ã£o do SO	2023-02-25	2023-02-24	5	9	2
Lucas Mendes	Portas queimadas	Switch com 4 portas inoperantes apÃ³s chuva	0.00	Isolamento das portas (sem conserto viÃ¡vel, aguardando troca)	2022-03-05	2022-03-01	6	5	9
AssistÃªncia Dell	Alerta RAID	Servidor apitando acusando falha no disco 2	1200.00	SubstituiÃ§Ã£o do HD SAS e rebuild do array	2023-07-15	2023-07-10	7	6	2
Ana Paula Souza	Teclado falhando	Teclas A e S nÃ£o funcionam	50.00	Troca do teclado do notebook	2023-05-02	2023-04-30	8	2	2
Francisco Silva	Desligando sozinho	Desktop desliga apÃ³s 30 min de uso	180.00	Troca da pasta tÃ©rmica e limpeza interna	2023-08-10	2023-08-08	9	1	2
Francisquito	Desligando	Desktop desliga apÃ³s 15 min de uso	180.00	Troca da pasta tÃ©rmica e limpeza interna	\N	2023-08-08	10	1	2
\.


--
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoa (nome, email, telefone, cargo, id) FROM stdin;
Marcus Martins	marcusvmartins@gmail.com	65 99810-6373 	Coordenador	1
Ana Paula Souza	ana.souza@email.com	65 99999-1111 	TÃ©cnica de TI	2
Carlos Eduardo	carlos.eduardo@email.com	65 98888-2222 	Professor	3
Fernanda Lima	fernanda.lima@email.com	65 97777-3333 	Diretora	4
Roberto Alves	roberto.alves@email.com	65 96666-4444 	Assistente Administrativo	5
Juliana Costa	juliana.costa@email.com	65 95555-5555 	BibliotecÃ¡ria	6
Pedro Henrique	pedro.henrique@email.com	65 94444-6666 	Auxiliar de ManutenÃ§Ã£o	7
Mariana Silva	mariana.silva@email.com	65 93333-7777 	SecretÃ¡ria	8
Lucas Mendes	lucas.mendes@email.com	65 92222-8888 	TÃ©cnico de Redes	9
Camila Rocha	camila.rocha@email.com	65 91111-9999 	Professora	10
\.


--
-- Data for Name: tipoambiente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoambiente (nome, id) FROM stdin;
DepÃ³sito	1
Lab InformÃ¡tica	2
Sala de Aula	3
Biblioteca	4
Diretoria	5
Secretaria	6
Sala dos Professores	7
AuditÃ³rio	8
Sala de ReuniÃ£o	9
Almoxarifado	10
\.


--
-- Data for Name: tipoequipamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoequipamento (nome, id) FROM stdin;
Desktop	1
Notebook	2
Datashow	3
Impressora Laser	4
Roteador Wi-Fi	5
Switch 24 portas	6
Servidor de Rack	7
Monitor 24"	8
Mesa Digitalizadora	9
\.


--
-- Name: ambiente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ambiente_id_seq', 10, true);


--
-- Name: equipamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipamento_id_seq', 9, true);


--
-- Name: lotacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lotacao_id_seq', 10, true);


--
-- Name: manutencao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manutencao_id_seq', 10, true);


--
-- Name: pessoa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoa_id_seq', 10, true);


--
-- Name: tipoambiente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipoambiente_id_seq', 10, true);


--
-- Name: tipoequipamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipoequipamento_id_seq', 9, true);


--
-- Name: ambiente pk_ambiente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambiente
    ADD CONSTRAINT pk_ambiente PRIMARY KEY (id);


--
-- Name: equipamento pk_equipamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT pk_equipamento PRIMARY KEY (id);


--
-- Name: lotacao pk_lotacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT pk_lotacao PRIMARY KEY (id);


--
-- Name: manutencao pk_manutencao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT pk_manutencao PRIMARY KEY (id);


--
-- Name: pessoa pk_pessoa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pk_pessoa PRIMARY KEY (id);


--
-- Name: tipoambiente pk_tipoambiente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoambiente
    ADD CONSTRAINT pk_tipoambiente PRIMARY KEY (id);


--
-- Name: tipoequipamento pk_tipoequipamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoequipamento
    ADD CONSTRAINT pk_tipoequipamento PRIMARY KEY (id);


--
-- Name: lotacao fk_ambiente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT fk_ambiente FOREIGN KEY (idequipamento) REFERENCES public.equipamento(id);


--
-- Name: lotacao fk_equipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT fk_equipamento FOREIGN KEY (idequipamento) REFERENCES public.equipamento(id);


--
-- Name: manutencao fk_equipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT fk_equipamento FOREIGN KEY (idequipamento) REFERENCES public.equipamento(id);


--
-- Name: lotacao fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lotacao
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (idpessoa) REFERENCES public.pessoa(id);


--
-- Name: manutencao fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manutencao
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (idpessoa) REFERENCES public.pessoa(id);


--
-- Name: ambiente fk_tipoambiente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambiente
    ADD CONSTRAINT fk_tipoambiente FOREIGN KEY (idtipoambiente) REFERENCES public.tipoambiente(id);


--
-- Name: equipamento fk_tipoequipamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento
    ADD CONSTRAINT fk_tipoequipamento FOREIGN KEY (idtipoequipamento) REFERENCES public.tipoequipamento(id);


--
-- PostgreSQL database dump complete
--

\unrestrict zQAKmV9KFCs3LfCUWaY83uMKMtyQYn81gMJAgstV22yaxFueM5cel9L6VlgNN34

