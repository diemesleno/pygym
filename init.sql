--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-08-19 21:37:10 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12429)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 100972)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 100970)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 194 (class 1259 OID 100982)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 100980)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 190 (class 1259 OID 100964)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 100962)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 196 (class 1259 OID 100990)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 101000)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 100998)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 195 (class 1259 OID 100988)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 200 (class 1259 OID 101008)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 101006)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 206 (class 1259 OID 101106)
-- Name: day_day; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE day_day (
    id integer NOT NULL,
    day_number integer NOT NULL
);


ALTER TABLE day_day OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 101114)
-- Name: day_day_exercises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE day_day_exercises (
    id integer NOT NULL,
    day_id integer NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE day_day_exercises OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 101112)
-- Name: day_day_exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE day_day_exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE day_day_exercises_id_seq OWNER TO postgres;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 207
-- Name: day_day_exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE day_day_exercises_id_seq OWNED BY day_day_exercises.id;


--
-- TOC entry 205 (class 1259 OID 101104)
-- Name: day_day_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE day_day_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE day_day_id_seq OWNER TO postgres;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 205
-- Name: day_day_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE day_day_id_seq OWNED BY day_day.id;


--
-- TOC entry 202 (class 1259 OID 101068)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 101066)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 188 (class 1259 OID 100954)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 100952)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 186 (class 1259 OID 100943)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 100941)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 215 (class 1259 OID 101186)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 101098)
-- Name: exercise_exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE exercise_exercise (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE exercise_exercise OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 101096)
-- Name: exercise_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exercise_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exercise_exercise_id_seq OWNER TO postgres;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 203
-- Name: exercise_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exercise_exercise_id_seq OWNED BY exercise_exercise.id;


--
-- TOC entry 210 (class 1259 OID 101136)
-- Name: plan_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plan_plan (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE plan_plan OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 101144)
-- Name: plan_plan_days; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plan_plan_days (
    id integer NOT NULL,
    plan_id integer NOT NULL,
    day_id integer NOT NULL
);


ALTER TABLE plan_plan_days OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 101142)
-- Name: plan_plan_days_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plan_plan_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_plan_days_id_seq OWNER TO postgres;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 211
-- Name: plan_plan_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plan_plan_days_id_seq OWNED BY plan_plan_days.id;


--
-- TOC entry 209 (class 1259 OID 101134)
-- Name: plan_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plan_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_plan_id_seq OWNER TO postgres;

--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 209
-- Name: plan_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plan_plan_id_seq OWNED BY plan_plan.id;


--
-- TOC entry 214 (class 1259 OID 101152)
-- Name: plan_plan_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plan_plan_users (
    id integer NOT NULL,
    plan_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE plan_plan_users OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 101150)
-- Name: plan_plan_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plan_plan_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plan_plan_users_id_seq OWNER TO postgres;

--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 213
-- Name: plan_plan_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plan_plan_users_id_seq OWNED BY plan_plan_users.id;


--
-- TOC entry 2136 (class 2604 OID 100975)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 100985)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 100967)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 100993)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 101003)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 101011)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 101109)
-- Name: day_day id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day ALTER COLUMN id SET DEFAULT nextval('day_day_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 101117)
-- Name: day_day_exercises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day_exercises ALTER COLUMN id SET DEFAULT nextval('day_day_exercises_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 101071)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 100957)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 100946)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 101101)
-- Name: exercise_exercise id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exercise_exercise ALTER COLUMN id SET DEFAULT nextval('exercise_exercise_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 101139)
-- Name: plan_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan ALTER COLUMN id SET DEFAULT nextval('plan_plan_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 101147)
-- Name: plan_plan_days id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_days ALTER COLUMN id SET DEFAULT nextval('plan_plan_days_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 101155)
-- Name: plan_plan_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_users ALTER COLUMN id SET DEFAULT nextval('plan_plan_users_id_seq'::regclass);


--
-- TOC entry 2162 (class 2606 OID 100979)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2167 (class 2606 OID 101034)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2170 (class 2606 OID 100987)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 100977)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 101020)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2159 (class 2606 OID 100969)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 101005)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2181 (class 2606 OID 101049)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2172 (class 2606 OID 100995)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 101013)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2187 (class 2606 OID 101063)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2175 (class 2606 OID 101091)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2198 (class 2606 OID 101131)
-- Name: day_day_exercises day_day_exercises_day_id_exercise_id_4ab80223_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day_exercises
    ADD CONSTRAINT day_day_exercises_day_id_exercise_id_4ab80223_uniq UNIQUE (day_id, exercise_id);


--
-- TOC entry 2201 (class 2606 OID 101119)
-- Name: day_day_exercises day_day_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day_exercises
    ADD CONSTRAINT day_day_exercises_pkey PRIMARY KEY (id);


--
-- TOC entry 2195 (class 2606 OID 101111)
-- Name: day_day day_day_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day
    ADD CONSTRAINT day_day_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 101077)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 100961)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2154 (class 2606 OID 100959)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 2606 OID 100951)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 101193)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2193 (class 2606 OID 101103)
-- Name: exercise_exercise exercise_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exercise_exercise
    ADD CONSTRAINT exercise_exercise_pkey PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 101149)
-- Name: plan_plan_days plan_plan_days_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_days
    ADD CONSTRAINT plan_plan_days_pkey PRIMARY KEY (id);


--
-- TOC entry 2209 (class 2606 OID 101169)
-- Name: plan_plan_days plan_plan_days_plan_id_day_id_1fffadd9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_days
    ADD CONSTRAINT plan_plan_days_plan_id_day_id_1fffadd9_uniq UNIQUE (plan_id, day_id);


--
-- TOC entry 2203 (class 2606 OID 101141)
-- Name: plan_plan plan_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan
    ADD CONSTRAINT plan_plan_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 101157)
-- Name: plan_plan_users plan_plan_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_users
    ADD CONSTRAINT plan_plan_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2214 (class 2606 OID 101183)
-- Name: plan_plan_users plan_plan_users_plan_id_user_id_bcdb1101_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_users
    ADD CONSTRAINT plan_plan_users_plan_id_user_id_bcdb1101_uniq UNIQUE (plan_id, user_id);


--
-- TOC entry 2160 (class 1259 OID 101022)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2165 (class 1259 OID 101035)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2168 (class 1259 OID 101036)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2155 (class 1259 OID 101021)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2176 (class 1259 OID 101051)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2179 (class 1259 OID 101050)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2182 (class 1259 OID 101065)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2185 (class 1259 OID 101064)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2173 (class 1259 OID 101092)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2196 (class 1259 OID 101132)
-- Name: day_day_exercises_day_id_eacd6445; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX day_day_exercises_day_id_eacd6445 ON day_day_exercises USING btree (day_id);


--
-- TOC entry 2199 (class 1259 OID 101133)
-- Name: day_day_exercises_exercise_id_d934220d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX day_day_exercises_exercise_id_d934220d ON day_day_exercises USING btree (exercise_id);


--
-- TOC entry 2188 (class 1259 OID 101088)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2191 (class 1259 OID 101089)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2216 (class 1259 OID 101195)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- TOC entry 2219 (class 1259 OID 101194)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2204 (class 1259 OID 101171)
-- Name: plan_plan_days_day_id_83591014; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plan_plan_days_day_id_83591014 ON plan_plan_days USING btree (day_id);


--
-- TOC entry 2207 (class 1259 OID 101170)
-- Name: plan_plan_days_plan_id_2b300538; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plan_plan_days_plan_id_2b300538 ON plan_plan_days USING btree (plan_id);


--
-- TOC entry 2212 (class 1259 OID 101184)
-- Name: plan_plan_users_plan_id_752bf1d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plan_plan_users_plan_id_752bf1d8 ON plan_plan_users USING btree (plan_id);


--
-- TOC entry 2215 (class 1259 OID 101185)
-- Name: plan_plan_users_user_id_00a36eda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plan_plan_users_user_id_00a36eda ON plan_plan_users USING btree (user_id);


--
-- TOC entry 2222 (class 2606 OID 101028)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2221 (class 2606 OID 101023)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2220 (class 2606 OID 101014)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2224 (class 2606 OID 101043)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2223 (class 2606 OID 101038)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2226 (class 2606 OID 101057)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2225 (class 2606 OID 101052)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2229 (class 2606 OID 101120)
-- Name: day_day_exercises day_day_exercises_day_id_eacd6445_fk_day_day_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day_exercises
    ADD CONSTRAINT day_day_exercises_day_id_eacd6445_fk_day_day_id FOREIGN KEY (day_id) REFERENCES day_day(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2230 (class 2606 OID 101125)
-- Name: day_day_exercises day_day_exercises_exercise_id_d934220d_fk_exercise_exercise_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY day_day_exercises
    ADD CONSTRAINT day_day_exercises_exercise_id_d934220d_fk_exercise_exercise_id FOREIGN KEY (exercise_id) REFERENCES exercise_exercise(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2227 (class 2606 OID 101078)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2228 (class 2606 OID 101083)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2232 (class 2606 OID 101163)
-- Name: plan_plan_days plan_plan_days_day_id_83591014_fk_day_day_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_days
    ADD CONSTRAINT plan_plan_days_day_id_83591014_fk_day_day_id FOREIGN KEY (day_id) REFERENCES day_day(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2231 (class 2606 OID 101158)
-- Name: plan_plan_days plan_plan_days_plan_id_2b300538_fk_plan_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_days
    ADD CONSTRAINT plan_plan_days_plan_id_2b300538_fk_plan_plan_id FOREIGN KEY (plan_id) REFERENCES plan_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2233 (class 2606 OID 101172)
-- Name: plan_plan_users plan_plan_users_plan_id_752bf1d8_fk_plan_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_users
    ADD CONSTRAINT plan_plan_users_plan_id_752bf1d8_fk_plan_plan_id FOREIGN KEY (plan_id) REFERENCES plan_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2234 (class 2606 OID 101177)
-- Name: plan_plan_users plan_plan_users_user_id_00a36eda_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_plan_users
    ADD CONSTRAINT plan_plan_users_user_id_00a36eda_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-08-19 21:37:10 -03

--
-- PostgreSQL database dump complete
--

