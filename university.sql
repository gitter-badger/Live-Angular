--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-08-18 14:31:55

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 175 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 175
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 41270)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE course (
    cid character varying(8) NOT NULL,
    cname text NOT NULL
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 41294)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE enrollment (
    sid integer NOT NULL,
    cid character varying(8) NOT NULL
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 41278)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE student (
    sid integer NOT NULL,
    sname text NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 41286)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE teacher (
    tid character varying(8) NOT NULL,
    tname text NOT NULL
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 41309)
-- Name: teaches; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE teaches (
    cid character varying(8) NOT NULL,
    tid character varying(8) NOT NULL
);


ALTER TABLE public.teaches OWNER TO postgres;




--
-- TOC entry 1841 (class 2606 OID 41277)
-- Name: course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (cid);


--
-- TOC entry 1847 (class 2606 OID 41298)
-- Name: enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (sid, cid);


--
-- TOC entry 1843 (class 2606 OID 41285)
-- Name: student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_pkey PRIMARY KEY (sid);


--
-- TOC entry 1845 (class 2606 OID 41293)
-- Name: teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (tid);


--
-- TOC entry 1849 (class 2606 OID 41313)
-- Name: teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY teaches
    ADD CONSTRAINT teaches_pkey PRIMARY KEY (cid);


--
-- TOC entry 1850 (class 2606 OID 41299)
-- Name: enrollment_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enrollment
    ADD CONSTRAINT enrollment_cid_fkey FOREIGN KEY (cid) REFERENCES course(cid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1851 (class 2606 OID 41304)
-- Name: enrollment_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enrollment
    ADD CONSTRAINT enrollment_sid_fkey FOREIGN KEY (sid) REFERENCES student(sid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1852 (class 2606 OID 41314)
-- Name: teaches_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teaches
    ADD CONSTRAINT teaches_cid_fkey FOREIGN KEY (cid) REFERENCES course(cid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1853 (class 2606 OID 41319)
-- Name: teaches_tid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teaches
    ADD CONSTRAINT teaches_tid_fkey FOREIGN KEY (tid) REFERENCES teacher(tid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-08-18 14:31:56

--
-- PostgreSQL database dump complete
--
