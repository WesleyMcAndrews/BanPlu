--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.climadia DROP CONSTRAINT "FK_IDEstacao_Climadia";
ALTER TABLE ONLY public.anosestacao DROP CONSTRAINT "FK_IDEstacao_AnosEstacao";
ALTER TABLE ONLY public.analises DROP CONSTRAINT "FK_IDEstacao_Analises";
ALTER TABLE ONLY public.estacoes DROP CONSTRAINT "FK_CodigoMunicipio_Estcoes";
ALTER TABLE ONLY public.estacoes DROP CONSTRAINT "FK_CodigoFonte_Estacaoes";
DROP INDEX public."IX_idestacao_Climadia";
ALTER TABLE ONLY public.parametrostemp DROP CONSTRAINT pk_parametrostemp;
ALTER TABLE ONLY public.municipiosibge DROP CONSTRAINT pk_municipiosibge;
ALTER TABLE ONLY public.fontes DROP CONSTRAINT pk_fontes;
ALTER TABLE ONLY public.estacoes DROP CONSTRAINT pk_estacoes;
ALTER TABLE ONLY public.decendios DROP CONSTRAINT pk_decendios;
ALTER TABLE ONLY public.climadecendio DROP CONSTRAINT pk_climadecendio;
ALTER TABLE ONLY public.anosestacao DROP CONSTRAINT pk_anosestacao;
ALTER TABLE ONLY public.equacoestemp DROP CONSTRAINT "PK_equacoestemp";
ALTER TABLE ONLY public.climadia DROP CONSTRAINT "PK_Climadia";
ALTER TABLE public.fontes ALTER COLUMN codigofonte DROP DEFAULT;
ALTER TABLE public.estacoes ALTER COLUMN idestacao DROP DEFAULT;
DROP VIEW public.sumarioestacoes;
DROP TABLE public.statsestacoes;
DROP TABLE public.quinzenas;
DROP TABLE public.pentadas;
DROP TABLE public.parametrostemp;
DROP TABLE public.municipiosibge;
DROP SEQUENCE public.fontes_codigofonte_seq;
DROP TABLE public.fontes;
DROP SEQUENCE public.estacoes_idestacao_seq;
DROP TABLE public.estacoes;
DROP TABLE public.equacoestemp;
DROP TABLE public.decendios;
DROP TABLE public.climadia;
DROP TABLE public.climadecendio;
DROP TABLE public.anosestacao;
DROP TABLE public.analises;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: analises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE analises (
    idestacao integer NOT NULL,
    ano integer NOT NULL,
    mes integer NOT NULL,
    v05 double precision DEFAULT 0 NOT NULL,
    v0610 double precision DEFAULT 0 NOT NULL,
    v1115 double precision DEFAULT 0 NOT NULL,
    v1620 double precision DEFAULT 0 NOT NULL,
    v2125 double precision DEFAULT 0 NOT NULL,
    v2630 double precision DEFAULT 0 NOT NULL,
    v3135 double precision DEFAULT 0 NOT NULL,
    chuvasmaioresq60 double precision DEFAULT 0 NOT NULL,
    chuvasmaioresq70 double precision DEFAULT 0 NOT NULL,
    chuvasmaioresq80 double precision DEFAULT 0 NOT NULL,
    chuvasmaioresq90 double precision DEFAULT 0 NOT NULL,
    chuvasmaioresq100 double precision DEFAULT 0 NOT NULL,
    chuvatotal double precision DEFAULT 0 NOT NULL,
    diaschuvosos double precision DEFAULT 0 NOT NULL,
    uf character varying(2)
);


ALTER TABLE analises OWNER TO postgres;

--
-- Name: anosestacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anosestacao (
    idestacao integer NOT NULL,
    ano integer NOT NULL,
    completude integer,
    obs integer
);


ALTER TABLE anosestacao OWNER TO postgres;

--
-- Name: climadecendio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE climadecendio (
    idestacao integer NOT NULL,
    ano integer NOT NULL,
    decendio integer NOT NULL,
    etp double precision
);


ALTER TABLE climadecendio OWNER TO postgres;

--
-- Name: climadia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE climadia (
    idestacao integer NOT NULL,
    data timestamp without time zone NOT NULL,
    uf character varying(2),
    chuva double precision,
    tempmax double precision,
    tempmin double precision,
    velvento double precision,
    direcao character varying(20),
    tempbulboseco double precision,
    tempbulboumido double precision,
    umidrel double precision,
    pressatmest double precision,
    coberturanuvens integer,
    nuvensbaixas integer,
    nuvensmedias integer,
    tempo integer,
    orvalho double precision,
    frshtt character varying(6)
);


ALTER TABLE climadia OWNER TO postgres;

--
-- Name: decendios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE decendios (
    ordem integer,
    codigo integer NOT NULL,
    mes character varying(3),
    diaini integer,
    mesini integer,
    diafim integer,
    mesfim integer,
    inicio character varying(6),
    fim character varying(6),
    diasacumulado integer
);


ALTER TABLE decendios OWNER TO postgres;

--
-- Name: equacoestemp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE equacoestemp (
    medida character varying(3) NOT NULL,
    uf character varying(2) NOT NULL,
    equacao character varying(500) NOT NULL
);


ALTER TABLE equacoestemp OWNER TO postgres;

--
-- Name: estacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estacoes (
    idestacao integer NOT NULL,
    codigoestacao character varying(15) NOT NULL,
    codigomunicipio character varying(7),
    pais character varying(30),
    uf character varying(2) NOT NULL,
    nomeestacao character varying(50) NOT NULL,
    latdecimal double precision,
    latg character varying(3) NOT NULL,
    latm character varying(3) NOT NULL,
    lats character varying(3) NOT NULL,
    longdecimal double precision,
    longg character varying(3) NOT NULL,
    longm character varying(3) NOT NULL,
    longs character varying(3) NOT NULL,
    altitude double precision DEFAULT 0 NOT NULL,
    ponto point,
    datainicial timestamp without time zone,
    datafinal timestamp without time zone,
    codigosolo integer,
    teorareia double precision,
    codigofonte integer NOT NULL,
    idzonahomogenea integer,
    contato character varying(50),
    endereco character varying(100),
    cep character varying(10),
    fone character varying(20),
    arquivo character varying(50) NOT NULL,
    status character varying(20),
    dtcadastro timestamp without time zone DEFAULT now() NOT NULL,
    usuariocadastro character varying(18) NOT NULL,
    dtedicao timestamp without time zone DEFAULT now() NOT NULL,
    usuarioedicao character varying(18) NOT NULL,
    hidroweb integer,
    processada bit(1),
    disteuclid double precision
);


ALTER TABLE estacoes OWNER TO postgres;

--
-- Name: estacoes_idestacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estacoes_idestacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estacoes_idestacao_seq OWNER TO postgres;

--
-- Name: estacoes_idestacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estacoes_idestacao_seq OWNED BY estacoes.idestacao;


--
-- Name: fontes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fontes (
    codigofonte integer NOT NULL,
    nomefonte character varying(50) NOT NULL,
    sigla character varying(10),
    endereco character varying(200),
    cidade character varying(20) NOT NULL,
    uf character varying(2) NOT NULL,
    cep character varying(10),
    contato character varying(100),
    fone character varying(50),
    email character varying(50),
    url character varying(50),
    tipo character varying(20) NOT NULL,
    dtcadastro timestamp without time zone NOT NULL,
    usuariocadastro character varying(18) NOT NULL,
    dtedicao timestamp without time zone NOT NULL,
    usuarioedicao character varying(18) NOT NULL
);


ALTER TABLE fontes OWNER TO postgres;

--
-- Name: fontes_codigofonte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fontes_codigofonte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fontes_codigofonte_seq OWNER TO postgres;

--
-- Name: fontes_codigofonte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fontes_codigofonte_seq OWNED BY fontes.codigofonte;


--
-- Name: municipiosibge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE municipiosibge (
    codigoregiao character varying(1) NOT NULL,
    nomeregiao character varying(100) NOT NULL,
    codigouf character varying(2) NOT NULL,
    uf character varying(2),
    nomeuf character varying(100) NOT NULL,
    codigomesorregiao character varying(4) NOT NULL,
    nomemesorregiao character varying(100) NOT NULL,
    codigomicrorregiao character varying(5) NOT NULL,
    nomemicrorregiao character varying(100) NOT NULL,
    codigomunicipio character varying(7) NOT NULL,
    nomemunicipio character varying(100) NOT NULL,
    latdecimal double precision,
    longdecimal double precision,
    sede bit(1),
    poligonos polygon,
    pontosede polygon
);


ALTER TABLE municipiosibge OWNER TO postgres;

--
-- Name: parametrostemp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE parametrostemp (
    medida character varying(3) NOT NULL,
    uf character varying(2) NOT NULL,
    mes character varying(10) NOT NULL,
    a double precision,
    b double precision,
    c double precision,
    d double precision,
    e double precision,
    f double precision,
    g double precision,
    h double precision,
    i double precision,
    j double precision,
    r2 double precision
);


ALTER TABLE parametrostemp OWNER TO postgres;

--
-- Name: pentadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pentadas (
    ordem integer,
    diaini integer,
    mesini integer,
    diafim integer,
    mesfim integer,
    diasacumulado integer
);


ALTER TABLE pentadas OWNER TO postgres;

--
-- Name: quinzenas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE quinzenas (
    ordem integer,
    mes character varying(3),
    diaini integer,
    mesini integer,
    diafim integer,
    mesfim integer,
    diasacumulado integer
);


ALTER TABLE quinzenas OWNER TO postgres;

--
-- Name: statsestacoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE statsestacoes (
    idestacao integer NOT NULL,
    chuvamedia double precision,
    tempmedia double precision,
    umidmedia double precision,
    limite double precision
);


ALTER TABLE statsestacoes OWNER TO postgres;

--
-- Name: sumarioestacoes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW sumarioestacoes AS
 SELECT e.idestacao,
    e.codigoestacao,
    e.uf,
    e.nomeestacao,
    e.altitude,
    e.codigomunicipio,
    e.latdecimal,
    e.latg,
    e.latm,
    e.lats,
    e.longdecimal,
    e.longg,
    e.longm,
    e.longs,
    e.arquivo,
    a.anoini,
    a.anofim,
    a.anos,
    a.completude,
    m.nomemunicipio,
    m.uf AS ufmun,
    e.codigofonte,
    f.sigla,
    s.chuvamedia,
    s.tempmedia,
    s.umidmedia,
    s.limite
   FROM ((((estacoes e
     LEFT JOIN municipiosibge m ON (((m.codigomunicipio)::text = (e.codigomunicipio)::text)))
     LEFT JOIN fontes f ON ((f.codigofonte = e.codigofonte)))
     LEFT JOIN statsestacoes s ON ((s.idestacao = e.idestacao)))
     RIGHT JOIN ( SELECT anosestacao.idestacao,
            min(anosestacao.ano) AS anoini,
            max(anosestacao.ano) AS anofim,
            count(anosestacao.ano) AS anos,
            avg(anosestacao.completude) AS completude
           FROM anosestacao
          GROUP BY anosestacao.idestacao) a ON ((a.idestacao = e.idestacao)));


ALTER TABLE sumarioestacoes OWNER TO postgres;

--
-- Name: idestacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estacoes ALTER COLUMN idestacao SET DEFAULT nextval('estacoes_idestacao_seq'::regclass);


--
-- Name: codigofonte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fontes ALTER COLUMN codigofonte SET DEFAULT nextval('fontes_codigofonte_seq'::regclass);


--
-- Data for Name: analises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY analises (idestacao, ano, mes, v05, v0610, v1115, v1620, v2125, v2630, v3135, chuvasmaioresq60, chuvasmaioresq70, chuvasmaioresq80, chuvasmaioresq90, chuvasmaioresq100, chuvatotal, diaschuvosos, uf) FROM stdin;
\.
COPY analises (idestacao, ano, mes, v05, v0610, v1115, v1620, v2125, v2630, v3135, chuvasmaioresq60, chuvasmaioresq70, chuvasmaioresq80, chuvasmaioresq90, chuvasmaioresq100, chuvatotal, diaschuvosos, uf) FROM '$$PATH$$/2204.dat';

--
-- Data for Name: anosestacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY anosestacao (idestacao, ano, completude, obs) FROM stdin;
\.
COPY anosestacao (idestacao, ano, completude, obs) FROM '$$PATH$$/2203.dat';

--
-- Data for Name: climadecendio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY climadecendio (idestacao, ano, decendio, etp) FROM stdin;
\.
COPY climadecendio (idestacao, ano, decendio, etp) FROM '$$PATH$$/2207.dat';

--
-- Data for Name: climadia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY climadia (idestacao, data, uf, chuva, tempmax, tempmin, velvento, direcao, tempbulboseco, tempbulboumido, umidrel, pressatmest, coberturanuvens, nuvensbaixas, nuvensmedias, tempo, orvalho, frshtt) FROM stdin;
\.
COPY climadia (idestacao, data, uf, chuva, tempmax, tempmin, velvento, direcao, tempbulboseco, tempbulboumido, umidrel, pressatmest, coberturanuvens, nuvensbaixas, nuvensmedias, tempo, orvalho, frshtt) FROM '$$PATH$$/2196.dat';

--
-- Data for Name: decendios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY decendios (ordem, codigo, mes, diaini, mesini, diafim, mesfim, inicio, fim, diasacumulado) FROM stdin;
\.
COPY decendios (ordem, codigo, mes, diaini, mesini, diafim, mesfim, inicio, fim, diasacumulado) FROM '$$PATH$$/2210.dat';

--
-- Data for Name: equacoestemp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equacoestemp (medida, uf, equacao) FROM stdin;
\.
COPY equacoestemp (medida, uf, equacao) FROM '$$PATH$$/2205.dat';

--
-- Data for Name: estacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estacoes (idestacao, codigoestacao, codigomunicipio, pais, uf, nomeestacao, latdecimal, latg, latm, lats, longdecimal, longg, longm, longs, altitude, ponto, datainicial, datafinal, codigosolo, teorareia, codigofonte, idzonahomogenea, contato, endereco, cep, fone, arquivo, status, dtcadastro, usuariocadastro, dtedicao, usuarioedicao, hidroweb, processada, disteuclid) FROM stdin;
\.
COPY estacoes (idestacao, codigoestacao, codigomunicipio, pais, uf, nomeestacao, latdecimal, latg, latm, lats, longdecimal, longg, longm, longs, altitude, ponto, datainicial, datafinal, codigosolo, teorareia, codigofonte, idzonahomogenea, contato, endereco, cep, fone, arquivo, status, dtcadastro, usuariocadastro, dtedicao, usuarioedicao, hidroweb, processada, disteuclid) FROM '$$PATH$$/2202.dat';

--
-- Name: estacoes_idestacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estacoes_idestacao_seq', 10760, true);


--
-- Data for Name: fontes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fontes (codigofonte, nomefonte, sigla, endereco, cidade, uf, cep, contato, fone, email, url, tipo, dtcadastro, usuariocadastro, dtedicao, usuarioedicao) FROM stdin;
\.
COPY fontes (codigofonte, nomefonte, sigla, endereco, cidade, uf, cep, contato, fone, email, url, tipo, dtcadastro, usuariocadastro, dtedicao, usuarioedicao) FROM '$$PATH$$/2198.dat';

--
-- Name: fontes_codigofonte_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fontes_codigofonte_seq', 1, false);


--
-- Data for Name: municipiosibge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY municipiosibge (codigoregiao, nomeregiao, codigouf, uf, nomeuf, codigomesorregiao, nomemesorregiao, codigomicrorregiao, nomemicrorregiao, codigomunicipio, nomemunicipio, latdecimal, longdecimal, sede, poligonos, pontosede) FROM stdin;
\.
COPY municipiosibge (codigoregiao, nomeregiao, codigouf, uf, nomeuf, codigomesorregiao, nomemesorregiao, codigomicrorregiao, nomemicrorregiao, codigomunicipio, nomemunicipio, latdecimal, longdecimal, sede, poligonos, pontosede) FROM '$$PATH$$/2200.dat';

--
-- Data for Name: parametrostemp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parametrostemp (medida, uf, mes, a, b, c, d, e, f, g, h, i, j, r2) FROM stdin;
\.
COPY parametrostemp (medida, uf, mes, a, b, c, d, e, f, g, h, i, j, r2) FROM '$$PATH$$/2206.dat';

--
-- Data for Name: pentadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pentadas (ordem, diaini, mesini, diafim, mesfim, diasacumulado) FROM stdin;
\.
COPY pentadas (ordem, diaini, mesini, diafim, mesfim, diasacumulado) FROM '$$PATH$$/2208.dat';

--
-- Data for Name: quinzenas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quinzenas (ordem, mes, diaini, mesini, diafim, mesfim, diasacumulado) FROM stdin;
\.
COPY quinzenas (ordem, mes, diaini, mesini, diafim, mesfim, diasacumulado) FROM '$$PATH$$/2209.dat';

--
-- Data for Name: statsestacoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY statsestacoes (idestacao, chuvamedia, tempmedia, umidmedia, limite) FROM stdin;
\.
COPY statsestacoes (idestacao, chuvamedia, tempmedia, umidmedia, limite) FROM '$$PATH$$/2199.dat';

--
-- Name: PK_Climadia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY climadia
    ADD CONSTRAINT "PK_Climadia" PRIMARY KEY (idestacao, data);


--
-- Name: PK_equacoestemp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equacoestemp
    ADD CONSTRAINT "PK_equacoestemp" PRIMARY KEY (medida, uf);


--
-- Name: pk_anosestacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anosestacao
    ADD CONSTRAINT pk_anosestacao PRIMARY KEY (idestacao, ano);


--
-- Name: pk_climadecendio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY climadecendio
    ADD CONSTRAINT pk_climadecendio PRIMARY KEY (idestacao, ano, decendio);


--
-- Name: pk_decendios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY decendios
    ADD CONSTRAINT pk_decendios PRIMARY KEY (codigo);


--
-- Name: pk_estacoes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estacoes
    ADD CONSTRAINT pk_estacoes PRIMARY KEY (idestacao);


--
-- Name: pk_fontes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fontes
    ADD CONSTRAINT pk_fontes PRIMARY KEY (codigofonte);


--
-- Name: pk_municipiosibge; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipiosibge
    ADD CONSTRAINT pk_municipiosibge PRIMARY KEY (codigomunicipio);


--
-- Name: pk_parametrostemp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametrostemp
    ADD CONSTRAINT pk_parametrostemp PRIMARY KEY (medida, uf, mes);


--
-- Name: IX_idestacao_Climadia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_idestacao_Climadia" ON climadia USING btree (idestacao);


--
-- Name: FK_CodigoFonte_Estacaoes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estacoes
    ADD CONSTRAINT "FK_CodigoFonte_Estacaoes" FOREIGN KEY (codigofonte) REFERENCES fontes(codigofonte);


--
-- Name: FK_CodigoMunicipio_Estcoes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estacoes
    ADD CONSTRAINT "FK_CodigoMunicipio_Estcoes" FOREIGN KEY (codigomunicipio) REFERENCES municipiosibge(codigomunicipio);


--
-- Name: FK_IDEstacao_Analises; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analises
    ADD CONSTRAINT "FK_IDEstacao_Analises" FOREIGN KEY (idestacao) REFERENCES estacoes(idestacao);


--
-- Name: FK_IDEstacao_AnosEstacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anosestacao
    ADD CONSTRAINT "FK_IDEstacao_AnosEstacao" FOREIGN KEY (idestacao) REFERENCES estacoes(idestacao);


--
-- Name: FK_IDEstacao_Climadia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY climadia
    ADD CONSTRAINT "FK_IDEstacao_Climadia" FOREIGN KEY (idestacao) REFERENCES estacoes(idestacao);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

