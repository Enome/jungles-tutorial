--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: cast_varchar_to_intarray(character varying); Type: FUNCTION; Schema: public; Owner: jungles
--

CREATE FUNCTION cast_varchar_to_intarray(s character varying) RETURNS integer[]
    LANGUAGE plpgsql
    AS $_$

DECLARE
  
BEGIN
  RETURN regexp_split_to_array(trim(leading '/' from $1), E'/');
END;

$_$;


ALTER FUNCTION public.cast_varchar_to_intarray(s character varying) OWNER TO jungles;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: instances; Type: TABLE; Schema: public; Owner: jungles; Tablespace: 
--

CREATE TABLE instances (
    id integer NOT NULL,
    type text NOT NULL,
    path text NOT NULL,
    name text NOT NULL,
    sort integer[] NOT NULL,
    data text
);


ALTER TABLE public.instances OWNER TO jungles;

--
-- Name: instances_id_seq; Type: SEQUENCE; Schema: public; Owner: jungles
--

CREATE SEQUENCE instances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instances_id_seq OWNER TO jungles;

--
-- Name: instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jungles
--

ALTER SEQUENCE instances_id_seq OWNED BY instances.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: jungles; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    key character varying(64) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.settings OWNER TO jungles;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: jungles
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO jungles;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jungles
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jungles
--

ALTER TABLE ONLY instances ALTER COLUMN id SET DEFAULT nextval('instances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jungles
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Data for Name: instances; Type: TABLE DATA; Schema: public; Owner: jungles
--

COPY instances (id, type, path, name, sort, data) FROM stdin;
4	page	/test	Test	{1}	{"title":"Test","description":"This is a test","body":"# This is a test","files":["631b69e9-91a9-41c8-864c-9561f2967421.JPG","03d7e29e-f856-4d16-bb9f-3b13be608b34.JPG","b8400764-e870-4641-a175-fc16e257b03c.JPG","1572e212-8567-478a-b2f4-9447e436beac.JPG"]}
\.


--
-- Name: instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jungles
--

SELECT pg_catalog.setval('instances_id_seq', 4, true);


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: jungles
--

COPY settings (id, key, value) FROM stdin;
1	version	2
\.


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jungles
--

SELECT pg_catalog.setval('settings_id_seq', 73, true);


--
-- Name: instances_pkey; Type: CONSTRAINT; Schema: public; Owner: jungles; Tablespace: 
--

ALTER TABLE ONLY instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: settings_key_key; Type: CONSTRAINT; Schema: public; Owner: jungles; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_key_key UNIQUE (key);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: jungles; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


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

