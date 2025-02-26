--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-02-26 17:37:22

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

DROP DATABASE IF EXISTS "RendezvenyApp";
--
-- TOC entry 4795 (class 1262 OID 16395)
-- Name: RendezvenyApp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "RendezvenyApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'hu-HU';


ALTER DATABASE "RendezvenyApp" OWNER TO postgres;

\connect "RendezvenyApp"

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

--
-- TOC entry 4788 (class 0 OID 16396)
-- Dependencies: 217
-- Data for Name: kerveny; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kerveny (id, nev, helyszin, statusz, email, telefon, letszam) FROM stdin;
\.


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 218
-- Name: kerveny_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kerveny_id_seq', 1, false);


-- Completed on 2025-02-26 17:37:22

--
-- PostgreSQL database dump complete
--

