--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-05-15 13:43:16 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 17890)
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 18013)
-- Name: favorito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE favorito (
    id_favorito integer NOT NULL,
    favorito integer NOT NULL,
    usuario integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE favorito OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 18017)
-- Name: favorito_id_favorito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE favorito_id_favorito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorito_id_favorito_seq OWNER TO postgres;

--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 175
-- Name: favorito_id_favorito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE favorito_id_favorito_seq OWNED BY favorito.id_favorito;


--
-- TOC entry 176 (class 1259 OID 18019)
-- Name: idioma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idioma (
    id_idioma integer NOT NULL,
    idioma character varying(50)
);


ALTER TABLE idioma OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 18022)
-- Name: idioma_id_idioma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idioma_id_idioma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idioma_id_idioma_seq OWNER TO postgres;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 177
-- Name: idioma_id_idioma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idioma_id_idioma_seq OWNED BY idioma.id_idioma;


--
-- TOC entry 178 (class 1259 OID 18024)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    id_pais integer NOT NULL,
    pais character varying(50)
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 18027)
-- Name: pais_id_pais_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pais_id_pais_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pais_id_pais_seq OWNER TO postgres;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 179
-- Name: pais_id_pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pais_id_pais_seq OWNED BY pais.id_pais;


--
-- TOC entry 180 (class 1259 OID 18029)
-- Name: pregunta_secreta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pregunta_secreta (
    id_pregunta_secreta integer NOT NULL,
    pregunta_secreta character varying(50)
);


ALTER TABLE pregunta_secreta OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 18032)
-- Name: pregunta_secreta_id_pregunta_secreta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_secreta_id_pregunta_secreta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pregunta_secreta_id_pregunta_secreta_seq OWNER TO postgres;

--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 181
-- Name: pregunta_secreta_id_pregunta_secreta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_secreta_id_pregunta_secreta_seq OWNED BY pregunta_secreta.id_pregunta_secreta;


--
-- TOC entry 182 (class 1259 OID 18034)
-- Name: retweet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retweet (
    id_retweet integer NOT NULL,
    retweet integer NOT NULL,
    usuario integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE retweet OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 18038)
-- Name: retweet_id_retweet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE retweet_id_retweet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retweet_id_retweet_seq OWNER TO postgres;

--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 183
-- Name: retweet_id_retweet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE retweet_id_retweet_seq OWNED BY retweet.id_retweet;


--
-- TOC entry 184 (class 1259 OID 18040)
-- Name: seguidor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE seguidor (
    id_seguidor integer NOT NULL,
    seguidor integer NOT NULL,
    siguiendo integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE seguidor OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 18044)
-- Name: seguidor_id_seguidor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seguidor_id_seguidor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seguidor_id_seguidor_seq OWNER TO postgres;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 185
-- Name: seguidor_id_seguidor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE seguidor_id_seguidor_seq OWNED BY seguidor.id_seguidor;


--
-- TOC entry 186 (class 1259 OID 18046)
-- Name: tweet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tweet (
    id_tweet integer NOT NULL,
    tweet character varying(140) NOT NULL,
    foto character varying(50),
    usuario integer NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE tweet OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 18050)
-- Name: tweet_id_tweet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tweet_id_tweet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tweet_id_tweet_seq OWNER TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 187
-- Name: tweet_id_tweet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tweet_id_tweet_seq OWNED BY tweet.id_tweet;


--
-- TOC entry 190 (class 1259 OID 18109)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    usuario character varying(30) NOT NULL,
    correo character varying(80) NOT NULL,
    nombre_completo character varying(100) NOT NULL,
    password character varying(256) NOT NULL,
    sitioweb character varying(60),
    biografia character varying(200),
    fk_idioma integer,
    fk_pais integer,
    fk_pregunta_secreta integer,
    respuesta_secreta character varying(256),
    telefono character varying(15),
    foto_perfil character varying(100),
    imagen_fondo character varying(100),
    activo boolean,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 18052)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 18107)
-- Name: usuario_id_usuario_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq1 OWNER TO postgres;

--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 189
-- Name: usuario_id_usuario_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq1 OWNED BY usuario.id_usuario;


--
-- TOC entry 2028 (class 2604 OID 18054)
-- Name: id_favorito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favorito ALTER COLUMN id_favorito SET DEFAULT nextval('favorito_id_favorito_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 18055)
-- Name: id_idioma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma ALTER COLUMN id_idioma SET DEFAULT nextval('idioma_id_idioma_seq'::regclass);


--
-- TOC entry 2030 (class 2604 OID 18056)
-- Name: id_pais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN id_pais SET DEFAULT nextval('pais_id_pais_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 18057)
-- Name: id_pregunta_secreta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta_secreta ALTER COLUMN id_pregunta_secreta SET DEFAULT nextval('pregunta_secreta_id_pregunta_secreta_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 18058)
-- Name: id_retweet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retweet ALTER COLUMN id_retweet SET DEFAULT nextval('retweet_id_retweet_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 18059)
-- Name: id_seguidor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor ALTER COLUMN id_seguidor SET DEFAULT nextval('seguidor_id_seguidor_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 18060)
-- Name: id_tweet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tweet ALTER COLUMN id_tweet SET DEFAULT nextval('tweet_id_tweet_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 18112)
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq1'::regclass);


--
-- TOC entry 2174 (class 0 OID 18013)
-- Dependencies: 174
-- Data for Name: favorito; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 175
-- Name: favorito_id_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('favorito_id_favorito_seq', 1, false);


--
-- TOC entry 2176 (class 0 OID 18019)
-- Dependencies: 176
-- Data for Name: idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO idioma (id_idioma, idioma) VALUES (1, 'Español');
INSERT INTO idioma (id_idioma, idioma) VALUES (2, 'Ingles');
INSERT INTO idioma (id_idioma, idioma) VALUES (3, 'Frances');
INSERT INTO idioma (id_idioma, idioma) VALUES (4, 'Ruso');
INSERT INTO idioma (id_idioma, idioma) VALUES (5, 'Chino');
INSERT INTO idioma (id_idioma, idioma) VALUES (6, 'Japones');
INSERT INTO idioma (id_idioma, idioma) VALUES (7, 'Arabe');
INSERT INTO idioma (id_idioma, idioma) VALUES (8, 'Aleman');


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 177
-- Name: idioma_id_idioma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idioma_id_idioma_seq', 8, true);


--
-- TOC entry 2178 (class 0 OID 18024)
-- Dependencies: 178
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pais (id_pais, pais) VALUES (1, 'Venezuela');
INSERT INTO pais (id_pais, pais) VALUES (2, 'Argentina');
INSERT INTO pais (id_pais, pais) VALUES (3, 'Canada');
INSERT INTO pais (id_pais, pais) VALUES (4, 'Peru');
INSERT INTO pais (id_pais, pais) VALUES (5, 'Brasil');
INSERT INTO pais (id_pais, pais) VALUES (7, 'Colombia');
INSERT INTO pais (id_pais, pais) VALUES (6, 'España');
INSERT INTO pais (id_pais, pais) VALUES (8, 'Chile');
INSERT INTO pais (id_pais, pais) VALUES (9, 'Ecuador');
INSERT INTO pais (id_pais, pais) VALUES (10, 'Panama');


--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 179
-- Name: pais_id_pais_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pais_id_pais_seq', 10, true);


--
-- TOC entry 2180 (class 0 OID 18029)
-- Dependencies: 180
-- Data for Name: pregunta_secreta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pregunta_secreta (id_pregunta_secreta, pregunta_secreta) VALUES (2, 'nombre de tú mejor amig@?');
INSERT INTO pregunta_secreta (id_pregunta_secreta, pregunta_secreta) VALUES (3, 'Cual es tú equipo de Fútbol favorito?');
INSERT INTO pregunta_secreta (id_pregunta_secreta, pregunta_secreta) VALUES (1, 'Nombre de primer novi@');
INSERT INTO pregunta_secreta (id_pregunta_secreta, pregunta_secreta) VALUES (4, 'nombre de tú mascota?');


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 181
-- Name: pregunta_secreta_id_pregunta_secreta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_secreta_id_pregunta_secreta_seq', 4, true);


--
-- TOC entry 2182 (class 0 OID 18034)
-- Dependencies: 182
-- Data for Name: retweet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 183
-- Name: retweet_id_retweet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('retweet_id_retweet_seq', 1, false);


--
-- TOC entry 2184 (class 0 OID 18040)
-- Dependencies: 184
-- Data for Name: seguidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (1, 39, 37, '2016-05-14 14:37:53.620778');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (2, 39, 1, '2016-05-14 14:40:45.952374');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (3, 39, 23, '2016-05-14 14:41:25.490404');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (110, 40, 31, '2016-05-14 15:32:49.079599');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (5, 39, 23, '2016-05-14 14:41:29.170502');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (6, 39, 36, '2016-05-14 14:41:48.330981');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (111, 1, 23, '2016-05-14 15:34:11.740675');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (8, 39, 40, '2016-05-14 14:43:10.622504');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (10, 1, 33, '2016-05-14 14:43:32.02057');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (12, 36, 1, '2016-05-14 14:43:48.931519');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (16, 26, 39, '2016-05-14 14:46:29.219149');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (18, 40, 43, '2016-05-14 14:46:42.130811');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (19, 39, 26, '2016-05-14 14:47:47.01751');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (20, 26, 23, '2016-05-14 14:47:55.196413');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (21, 39, 28, '2016-05-14 14:47:55.346996');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (22, 26, 29, '2016-05-14 14:48:01.547132');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (26, 36, 41, '2016-05-14 14:50:23.806191');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (27, 36, 45, '2016-05-14 14:50:28.337461');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (28, 36, 46, '2016-05-14 14:50:31.926338');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (32, 36, 46, '2016-05-14 14:54:18.344576');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (33, 36, 45, '2016-05-14 14:54:20.660418');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (34, 36, 41, '2016-05-14 14:54:23.475703');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (35, 36, 39, '2016-05-14 14:54:31.090851');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (36, 37, 36, '2016-05-14 14:58:58.586806');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (39, 40, 28, '2016-05-14 15:10:39.835038');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (47, 40, 37, '2016-05-14 15:11:30.393437');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (51, 1, 29, '2016-05-14 15:11:37.749065');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (58, 40, 28, '2016-05-14 15:11:46.783447');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (59, 37, 1, '2016-05-14 15:11:50.666331');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (60, 40, 38, '2016-05-14 15:11:59.23936');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (63, 37, 29, '2016-05-14 15:12:24.935504');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (65, 37, 28, '2016-05-14 15:12:38.604184');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (68, 36, 37, '2016-05-14 15:13:37.498975');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (70, 36, 29, '2016-05-14 15:13:43.038239');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (71, 36, 28, '2016-05-14 15:13:46.378431');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (72, 36, 31, '2016-05-14 15:13:48.541626');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (73, 36, 38, '2016-05-14 15:13:50.701306');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (75, 36, 33, '2016-05-14 15:14:37.050567');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (82, 40, 38, '2016-05-14 15:19:11.672049');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (84, 37, 41, '2016-05-14 15:21:00.444556');
INSERT INTO seguidor (id_seguidor, seguidor, siguiendo, fecha_creacion) VALUES (101, 40, 37, '2016-05-14 15:30:13.220038');


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 185
-- Name: seguidor_id_seguidor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seguidor_id_seguidor_seq', 111, true);


--
-- TOC entry 2186 (class 0 OID 18046)
-- Dependencies: 186
-- Data for Name: tweet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 187
-- Name: tweet_id_tweet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tweet_id_tweet_seq', 1, false);


--
-- TOC entry 2190 (class 0 OID 18109)
-- Dependencies: 190
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (37, 'Lennis', 'yorlenischetik@gmail.com', 'Lennis Martinez', 'e10adc3949ba59abbe56e057f20f883e', '', '', 1, 5, 1, 'maria', '04265123310', 'facebook_1463236928030.jpg', NULL, true, '2016-05-14 10:21:31.248927');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (29, 'Joel Palma', 'joelpalma13@hotmail.com', 'Joel Alejandro Palma Rodriguez', '123456', '', '', 1, 2, 1, 'silesky', '', 'IMG_1376.JPG', '', false, '2016-05-14 10:06:10.052369');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (39, 'Asandoval', 'asandoval@gmail.com', 'Angela Sandoval', 'e10adc3949ba59abbe56e057f20f883e', '', 'Otaku', 1, 1, 4, 'Falkor', '04168154040', 'n1134713744_7238.jpg', NULL, false, '2016-05-14 11:16:29.615777');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (28, 'Carlos', 'noob.carlosvelasquez@gmail.com', 'Carlos Eduardo Velásquez Quintero', 'holamundo', 'lol.com', 'Pienso luego existo.', 2, 1, 1, 'Forever Alone', '04264061824', 'IMG-20160508-WA0030.jpg', 'Pa'' Despues.', false, '2016-05-14 09:59:38.853724');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (31, 'daguilera', 'daguilera14@gmail.com', 'Darwin Aguilera', '12345678.+', '', '', 1, 1, 1, 'catalina', '12345', NULL, '', false, '2016-05-14 10:15:30.690263');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (38, 'Deborah', 'deborah.torres13@gmail.com', 'Deborah Carolina Torres', '123456', '', 'Cumpleañera, especializada en los abrazos. Bella por naturaleza y una gran GRAN amiga.', 1, 1, 1, 'Mika', '04128244431', 'IMG-20160508-WA0033.jpg', '', false, '2016-05-14 10:23:32.916469');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (23, 'Noel', 'noel@gmail.com', 'Noel Alberto Espinoza Martinez', '123456', 'www.twitter', 'Leonard', 1, 2, 1, 'Quien es Mi Hijo', '04162170863', 'IMG_20150509_175728_1.jpg', '', false, '2016-05-14 09:47:12.13332');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (33, 'Joselyn', 'yossyandrade@gmail.com', 'Joselyn Andrade', '123456', '', '', 1, 4, 1, '', '04263126488', '552227_441391175919872_626754387_n.jpg', NULL, false, '2016-05-14 10:18:07.591366');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (41, 'hola', 'hola@gmail.com', 'hola ', '12345', '', '', 1, 1, 3, 'magallanes', '', 'IMG_1376.JPG', '', false, '2016-05-14 11:51:13.876087');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (1, 'leninmhs', 'leninmhs@gmail.com', 'Lenin Hernandez', 'e10adc3949ba59abbe56e057f20f883e', 'leninmhs.wordpress.com', 'Programador', 1, 1, 1, 'hola', NULL, 'leninmhs.jpg', NULL, true, '2016-05-07 11:57:54.707259');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (42, 'noel', 'noel@gmail.com', 'nespinoza', '123456', 'www.twitter', '', 2, 2, 1, 'Quien es Mi Hijo', '04162170863', 'IMG_20150509_175728_1.jpg', '', false, '2016-05-14 13:33:35.756419');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (43, 'Venezuela', 'venezuela@hotmail.com', 'Venezuela', '123456', '', '', 3, 5, 3, 'hola', '', 'IMG_1376.JPG', '', false, '2016-05-14 13:33:43.145033');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (44, 'carlos', 'carlos@hotmail.com', 'carlos', 'e10adc3949ba59abbe56e057f20f883e', '', '', 3, NULL, NULL, '', '', 'IMG_1375.JPG', '', false, '2016-05-14 13:37:10.975603');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (45, 'Noel1', 'noel@gmail.com', 'noel espinoza', '123456', 'www.twitter', 'Leonard', 1, 2, 3, 'Quien es Mi Hijo', '04162170863', 'IMG_20150509_175728_1.jpg', '', false, '2016-05-14 13:37:22.906467');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (46, 'noel', 'noel@hotmail.com', 'noel', 'e10adc3949ba59abbe56e057f20f883e', '', '', 1, NULL, NULL, '', '', 'IMG_1344.JPG', '', false, '2016-05-14 13:38:37.262412');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (47, 'Noel12', 'noel@gmail.com', 'noel alberto', 'e10adc3949ba59abbe56e057f20f883e', 'www.twitter', 'Leonard', 1, 2, 3, 'Quien es Mi Hijo', '04162170863', 'IMG_20150509_175728_1.jpg', '', false, '2016-05-14 13:40:28.323902');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (36, 'angelagscm', 'agsantacruzm20@gmail.com', 'Angela Santa Cruz', 'e10adc3949ba59abbe56e057f20f883e', '', '', 2, 1, 2, '', '', '2015-05-19 11.04.50.jpg', 'index.jpeg', true, '2016-05-14 10:21:13.387494');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (26, 'vorlanys', 'orlanys86@gmail.com', 'Vanessa Rodriguez', 'e10adc3949ba59abbe56e057f20f883e', '', '', 2, 1, 1, 'jhdsiuuhij', '04126348722', NULL, NULL, false, '2016-05-14 09:50:48.567945');
INSERT INTO usuario (id_usuario, usuario, correo, nombre_completo, password, sitioweb, biografia, fk_idioma, fk_pais, fk_pregunta_secreta, respuesta_secreta, telefono, foto_perfil, imagen_fondo, activo, fecha_creacion) VALUES (40, 'Lorecsy', 'lorecsy@gmail.com', 'Lorecsy Perez', 'e10adc3949ba59abbe56e057f20f883e', '', '', 1, 1, NULL, '', '', '734759_10207281221245395_4108071522611695882_n.jpg', '', NULL, '2016-05-14 11:28:41.432129');


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 188
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 4, true);


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 189
-- Name: usuario_id_usuario_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq1', 47, true);


--
-- TOC entry 2041 (class 2606 OID 18062)
-- Name: pk_favorito; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY favorito
    ADD CONSTRAINT pk_favorito PRIMARY KEY (id_favorito);


--
-- TOC entry 2043 (class 2606 OID 18064)
-- Name: pk_idioma; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT pk_idioma PRIMARY KEY (id_idioma);


--
-- TOC entry 2045 (class 2606 OID 18066)
-- Name: pk_pais; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id_pais);


--
-- TOC entry 2047 (class 2606 OID 18068)
-- Name: pk_pregunta_secreta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pregunta_secreta
    ADD CONSTRAINT pk_pregunta_secreta PRIMARY KEY (id_pregunta_secreta);


--
-- TOC entry 2049 (class 2606 OID 18070)
-- Name: pk_retweet; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY retweet
    ADD CONSTRAINT pk_retweet PRIMARY KEY (id_retweet);


--
-- TOC entry 2051 (class 2606 OID 18072)
-- Name: pk_seguidor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT pk_seguidor PRIMARY KEY (id_seguidor);


--
-- TOC entry 2053 (class 2606 OID 18074)
-- Name: pk_tweet; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tweet
    ADD CONSTRAINT pk_tweet PRIMARY KEY (id_tweet);


--
-- TOC entry 2055 (class 2606 OID 18118)
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2056 (class 2606 OID 18075)
-- Name: fk_favorito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favorito
    ADD CONSTRAINT fk_favorito FOREIGN KEY (favorito) REFERENCES tweet(id_tweet);


--
-- TOC entry 2064 (class 2606 OID 18146)
-- Name: fk_idioma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_idioma FOREIGN KEY (fk_idioma) REFERENCES idioma(id_idioma);


--
-- TOC entry 2062 (class 2606 OID 18136)
-- Name: fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_pais FOREIGN KEY (fk_pais) REFERENCES pais(id_pais);


--
-- TOC entry 2063 (class 2606 OID 18141)
-- Name: fk_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_pregunta FOREIGN KEY (fk_pregunta_secreta) REFERENCES pregunta_secreta(id_pregunta_secreta);


--
-- TOC entry 2057 (class 2606 OID 18080)
-- Name: fk_retweet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retweet
    ADD CONSTRAINT fk_retweet FOREIGN KEY (retweet) REFERENCES tweet(id_tweet);


--
-- TOC entry 2059 (class 2606 OID 18161)
-- Name: fk_seguidor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor FOREIGN KEY (seguidor) REFERENCES usuario(id_usuario);


--
-- TOC entry 2060 (class 2606 OID 18166)
-- Name: fk_siguiendo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_siguiendo FOREIGN KEY (siguiendo) REFERENCES usuario(id_usuario);


--
-- TOC entry 2061 (class 2606 OID 18151)
-- Name: fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tweet
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2058 (class 2606 OID 18156)
-- Name: fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retweet
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-05-15 13:43:16 VET

--
-- PostgreSQL database dump complete
--

