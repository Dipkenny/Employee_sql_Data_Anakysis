--
-- PostgreSQL database dump
--

\restrict NchIsRUg84hNojPOdJlo2dptvWZ3akX1Ia0AITZYZVCAqLUeVkIrg6sl6TLae9q

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-09 10:18:36

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
-- TOC entry 857 (class 1247 OID 16418)
-- Name: sex; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sex AS ENUM (
    'M',
    'F'
);


ALTER TYPE public.sex OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16432)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(40)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16438)
-- Name: dept_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_employee (
    emp_no integer,
    dept_no character varying(4),
    from_date date,
    to_date date
);


ALTER TABLE public.dept_employee OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16429)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(4),
    emp_no integer,
    from_date date,
    to_date date
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16423)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    birth_date date,
    first_name character varying(14),
    last_name character varying(16),
    gender public.sex,
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16441)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer,
    salary integer,
    from_date date,
    to_date date
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16444)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    emp_no integer,
    title character varying(50),
    from_date date,
    to_date date
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 16432)
-- Dependencies: 221
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (dept_no, dept_name) FROM stdin;
d001	HR
d002	Finance
d003	Marketing
d004	Engineering
d005	Sales
d006	IT
d007	Operations
d008	Research
d009	Quality Assurance
d010	Customer Service
\.


--
-- TOC entry 5032 (class 0 OID 16438)
-- Dependencies: 222
-- Data for Name: dept_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept_employee (emp_no, dept_no, from_date, to_date) FROM stdin;
10001	d001	2001-07-15	9999-01-01
10002	d002	2005-02-28	9999-01-01
10003	d003	2003-11-10	2010-12-31
10004	d004	2007-09-15	9999-01-01
10005	d005	2002-04-20	9999-01-01
10006	d001	2004-03-18	9999-01-01
10007	d002	2006-08-22	9999-01-01
10008	d003	2008-11-30	9999-01-01
10009	d004	2010-05-14	9999-01-01
10010	d005	2009-03-26	9999-01-01
\.


--
-- TOC entry 5030 (class 0 OID 16429)
-- Dependencies: 220
-- Data for Name: dept_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept_manager (dept_no, emp_no, from_date, to_date) FROM stdin;
d001	10001	2001-07-15	2005-02-28
d002	10002	2005-02-28	2007-09-15
d003	10003	2003-11-10	9999-01-01
d004	10004	2007-09-15	2010-12-31
d005	10005	2002-04-20	9999-01-01
d001	10006	2004-03-18	9999-01-01
d002	10007	2006-08-22	9999-01-01
d003	10008	2008-11-30	9999-01-01
d004	10009	2010-05-14	9999-01-01
d005	10010	2009-03-26	9999-01-01
\.


--
-- TOC entry 5029 (class 0 OID 16423)
-- Dependencies: 219
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (emp_no, birth_date, first_name, last_name, gender, hire_date) FROM stdin;
10001	1980-01-15	John	Smith	M	2001-07-15
10002	1982-03-25	Emily	Johnson	F	2005-02-28
10003	1975-12-10	Michael	Williams	M	2003-11-10
10004	1988-05-20	Jessica	Brown	F	2007-09-15
10005	1984-08-30	David	Jones	M	2002-04-20
10006	1981-06-12	Sarah	Anderson	F	2004-03-18
10007	1979-10-05	Christopher	Davis	M	2006-08-22
10008	1983-09-17	Anna	Miller	F	2008-11-30
10009	1986-02-28	Ryan	Moore	M	2010-05-14
10010	1989-07-19	Amanda	Wilson	F	2009-03-26
\.


--
-- TOC entry 5033 (class 0 OID 16441)
-- Dependencies: 223
-- Data for Name: salaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salaries (emp_no, salary, from_date, to_date) FROM stdin;
10001	60000	2001-07-15	2003-01-01
10001	65000	2003-01-01	2005-02-28
10001	70000	2005-02-28	9999-01-01
10002	55000	2005-02-28	2007-01-01
10002	60000	2007-01-01	9999-01-01
10003	62000	2003-11-10	2006-01-01
10003	65000	2006-01-01	2010-12-31
10004	70000	2007-09-15	9999-01-01
10005	58000	2002-04-20	2004-01-01
10005	62000	2004-01-01	9999-01-01
10006	63000	2004-03-18	9999-01-01
10007	60000	2006-08-22	9999-01-01
10008	64000	2008-11-30	9999-01-01
10009	67000	2010-05-14	9999-01-01
10010	59000	2009-03-26	9999-01-01
\.


--
-- TOC entry 5034 (class 0 OID 16444)
-- Dependencies: 224
-- Data for Name: titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.titles (emp_no, title, from_date, to_date) FROM stdin;
10001	Manager	2001-07-15	2005-02-28
10001	Senior Manager	2005-02-28	9999-01-01
10002	Analyst	2005-02-28	2007-01-01
10002	Senior Analyst	2007-01-01	9999-01-01
10003	Coordinator	2003-11-10	2006-01-01
10003	Manager	2006-01-01	2010-12-31
10004	Engineer	2007-09-15	9999-01-01
10005	Sales Associate	2002-04-20	9999-01-01
10006	Analyst	2004-03-18	9999-01-01
10007	Manager	2006-08-22	9999-01-01
10008	Coordinator	2008-11-30	9999-01-01
10009	Engineer	2010-05-14	9999-01-01
10010	Sales Associate	2009-03-26	9999-01-01
\.


--
-- TOC entry 4881 (class 2606 OID 16437)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 4879 (class 2606 OID 16428)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


-- Completed on 2026-10-09 10:18:36

--
-- PostgreSQL database dump complete
--

\unrestrict NchIsRUg84hNojPOdJlo2dptvWZ3akX1Ia0AITZYZVCAqLUeVkIrg6sl6TLae9q

