--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.4
-- Dumped by pg_dump version 9.1.4
-- Started on 2013-06-07 11:42:31

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1858 (class 1262 OID 210067)
-- Name: authority; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE authority WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United Kingdom.1252' LC_CTYPE = 'English_United Kingdom.1252';


\connect authority

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 163 (class 3079 OID 11639)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1860 (class 0 OID 0)
-- Dependencies: 163
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 210073)
-- Dependencies: 5
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    user_name character varying(15) NOT NULL,
    role_name character varying(15) NOT NULL
);


--
-- TOC entry 161 (class 1259 OID 210068)
-- Dependencies: 5
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    user_name character varying(15) NOT NULL,
    user_pass character varying(15) NOT NULL
);


--
-- TOC entry 1855 (class 0 OID 210073)
-- Dependencies: 162
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_roles (user_name, role_name) VALUES ('ahmed', 'user');
INSERT INTO user_roles (user_name, role_name) VALUES ('ahmed', 'supervisor');
INSERT INTO user_roles (user_name, role_name) VALUES ('tanvir', 'teller');
INSERT INTO user_roles (user_name, role_name) VALUES ('tanvir', 'user');
INSERT INTO user_roles (user_name, role_name) VALUES ('ahmed', 'teller');


--
-- TOC entry 1854 (class 0 OID 210068)
-- Dependencies: 161
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users (user_name, user_pass) VALUES ('tanvir', 'tan');
INSERT INTO users (user_name, user_pass) VALUES ('ahmed', 'ahm');


--
-- TOC entry 1853 (class 2606 OID 210077)
-- Dependencies: 162 162 162
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_name, role_name);


--
-- TOC entry 1851 (class 2606 OID 210072)
-- Dependencies: 161 161
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_name);


-- Completed on 2013-06-07 11:42:32

--
-- PostgreSQL database dump complete
--

