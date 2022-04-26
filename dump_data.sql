--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zagibalov;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO zagibalov;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zagibalov;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO zagibalov;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zagibalov;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO zagibalov;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO zagibalov;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO zagibalov;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO zagibalov;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO zagibalov;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO zagibalov;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO zagibalov;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: base_item; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.base_item (
    id bigint NOT NULL,
    "desc" character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    category_id bigint
);


ALTER TABLE public.base_item OWNER TO zagibalov;

--
-- Name: base_item_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.base_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_item_id_seq OWNER TO zagibalov;

--
-- Name: base_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.base_item_id_seq OWNED BY public.base_item.id;


--
-- Name: base_micro; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.base_micro (
    id bigint NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.base_micro OWNER TO zagibalov;

--
-- Name: base_micro_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.base_micro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_micro_id_seq OWNER TO zagibalov;

--
-- Name: base_micro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.base_micro_id_seq OWNED BY public.base_micro.id;


--
-- Name: base_prefix; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.base_prefix (
    id bigint NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.base_prefix OWNER TO zagibalov;

--
-- Name: base_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.base_prefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_prefix_id_seq OWNER TO zagibalov;

--
-- Name: base_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.base_prefix_id_seq OWNED BY public.base_prefix.id;


--
-- Name: base_processor; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.base_processor (
    id bigint NOT NULL,
    name_id bigint NOT NULL,
    model_id bigint
);


ALTER TABLE public.base_processor OWNER TO zagibalov;

--
-- Name: base_processor_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.base_processor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_processor_id_seq OWNER TO zagibalov;

--
-- Name: base_processor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.base_processor_id_seq OWNED BY public.base_processor.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO zagibalov;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO zagibalov;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zagibalov;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO zagibalov;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zagibalov;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zagibalov
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO zagibalov;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zagibalov
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zagibalov
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zagibalov;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: base_item id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_item ALTER COLUMN id SET DEFAULT nextval('public.base_item_id_seq'::regclass);


--
-- Name: base_micro id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_micro ALTER COLUMN id SET DEFAULT nextval('public.base_micro_id_seq'::regclass);


--
-- Name: base_prefix id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_prefix ALTER COLUMN id SET DEFAULT nextval('public.base_prefix_id_seq'::regclass);


--
-- Name: base_processor id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_processor ALTER COLUMN id SET DEFAULT nextval('public.base_processor_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add processor	7	add_processor
26	Can change processor	7	change_processor
27	Can delete processor	7	delete_processor
28	Can view processor	7	view_processor
29	Can add prefix	8	add_prefix
30	Can change prefix	8	change_prefix
31	Can delete prefix	8	delete_prefix
32	Can view prefix	8	view_prefix
33	Can add micro	9	add_micro
34	Can change micro	9	change_micro
35	Can delete micro	9	delete_micro
36	Can view micro	9	view_micro
37	Can add item	10	add_item
38	Can change item	10	change_item
39	Can delete item	10	delete_item
40	Can view item	10	view_item
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$5yHhKu9PQK9syEfgdKeVru$4pT7ERBPTrF/Dd6RaDb/agA2s/Fe6uLoZuPS7iJsIk4=	2022-04-25 07:59:21.348968+00	t	dmitry			zagibalovdmitry@gmail.com	t	t	2022-04-25 07:59:14.489424+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: base_item; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.base_item (id, "desc", image, slug, category_id) FROM stdin;
2	Процессор	index_04vON4H.jpeg	proc	\N
3	INTEL	index_jjH8svB.jpeg	intel	2
4	AMD	intel.jpeg	amd	2
5	Монитор	screen.jpg	screen	\N
6	Видеокарты	nvidia.jpg	videocard	\N
7	Колонки	bb.jpg	loudspeakers	\N
8	Наушники	media/15375.30_6_500.jpg	headphones	\N
\.


--
-- Data for Name: base_micro; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.base_micro (id, name) FROM stdin;
2	CELERON
\.


--
-- Data for Name: base_prefix; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.base_prefix (id, name) FROM stdin;
3	AMD
4	INTEL
\.


--
-- Data for Name: base_processor; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.base_processor (id, name_id, model_id) FROM stdin;
9	4	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-04-25 08:03:25.818945+00	1	AMD RYZEN	1	[{"added": {}}]	7	1
2	2022-04-25 08:34:48.6608+00	1	AMD RYZEN	3		7	1
3	2022-04-25 08:36:50.332841+00	1	INTEL	1	[{"added": {}}]	8	1
4	2022-04-25 08:36:52.919665+00	2	AMD	1	[{"added": {}}]	8	1
5	2022-04-25 08:45:11.33545+00	7	Processor object (7)	1	[{"added": {}}]	7	1
6	2022-04-25 08:45:18.944856+00	7	Processor object (7)	2	[]	7	1
7	2022-04-25 08:45:48.962113+00	7	AMD	2	[{"changed": {"fields": ["Name"]}}]	7	1
8	2022-04-25 08:47:07.190499+00	7	AMD	2	[{"changed": {"fields": ["Model"]}}]	7	1
9	2022-04-25 08:48:04.928723+00	7	AMD Celeron	2	[]	7	1
10	2022-04-25 08:48:15.995292+00	7	AMD FX	2	[{"changed": {"fields": ["Model"]}}]	7	1
11	2022-04-25 08:48:30.748023+00	8	INTEL Celeron	1	[{"added": {}}]	7	1
12	2022-04-25 08:53:41.929726+00	8	INTEL	3		7	1
13	2022-04-25 08:53:41.931289+00	7	AMD	3		7	1
14	2022-04-25 08:53:48.138834+00	2	AMD	3		8	1
15	2022-04-25 08:53:48.140409+00	1	INTEL	3		8	1
16	2022-04-25 08:56:23.626795+00	2	CELERON	1	[{"added": {}}]	9	1
17	2022-04-25 08:57:15.863704+00	3	AMD	1	[{"added": {}}]	8	1
18	2022-04-25 08:57:19.723819+00	4	INTEL	1	[{"added": {}}]	8	1
19	2022-04-25 08:57:33.816143+00	9	INTEL	1	[{"added": {}}]	7	1
20	2022-04-25 10:26:48.139356+00	2	Item object (2)	1	[{"added": {}}]	10	1
21	2022-04-25 10:27:35.267581+00	3	INTEL	1	[{"added": {}}]	10	1
22	2022-04-25 10:27:48.55073+00	4	AMD	1	[{"added": {}}]	10	1
23	2022-04-25 11:18:43.464696+00	4	AMD	2	[{"changed": {"fields": ["Image"]}}]	10	1
24	2022-04-25 11:32:45.202719+00	5	Монитор	1	[{"added": {}}]	10	1
25	2022-04-25 11:44:14.238895+00	6	Видеокарты	1	[{"added": {}}]	10	1
26	2022-04-25 12:48:06.787734+00	7	Колонки	1	[{"added": {}}]	10	1
27	2022-04-26 05:39:42.055387+00	8	Наушники	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	base	processor
8	base	prefix
9	base	micro
10	base	item
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-04-25 07:47:57.343082+00
2	auth	0001_initial	2022-04-25 07:47:57.40484+00
3	admin	0001_initial	2022-04-25 07:47:57.439841+00
4	admin	0002_logentry_remove_auto_add	2022-04-25 07:47:57.447785+00
5	admin	0003_logentry_add_action_flag_choices	2022-04-25 07:47:57.456028+00
6	contenttypes	0002_remove_content_type_name	2022-04-25 07:47:57.469652+00
7	auth	0002_alter_permission_name_max_length	2022-04-25 07:47:57.476727+00
8	auth	0003_alter_user_email_max_length	2022-04-25 07:47:57.483071+00
9	auth	0004_alter_user_username_opts	2022-04-25 07:47:57.492216+00
10	auth	0005_alter_user_last_login_null	2022-04-25 07:47:57.498829+00
11	auth	0006_require_contenttypes_0002	2022-04-25 07:47:57.500715+00
12	auth	0007_alter_validators_add_error_messages	2022-04-25 07:47:57.509871+00
13	auth	0008_alter_user_username_max_length	2022-04-25 07:47:57.520792+00
14	auth	0009_alter_user_last_name_max_length	2022-04-25 07:47:57.530267+00
15	auth	0010_alter_group_name_max_length	2022-04-25 07:47:57.538122+00
16	auth	0011_update_proxy_permissions	2022-04-25 07:47:57.546389+00
17	auth	0012_alter_user_first_name_max_length	2022-04-25 07:47:57.554487+00
18	sessions	0001_initial	2022-04-25 07:47:57.56358+00
19	base	0001_initial	2022-04-25 08:03:14.771656+00
20	base	0002_alter_processor_image	2022-04-25 08:11:39.764222+00
21	base	0003_prefix_processor_model_of_processor_and_more	2022-04-25 08:36:19.65852+00
22	base	0004_remove_processor_model_of_processor	2022-04-25 08:37:29.832488+00
23	base	0005_processor_model	2022-04-25 08:39:48.896086+00
24	base	0006_rename_model_processor_modelee	2022-04-25 08:40:42.92594+00
25	base	0007_remove_processor_modelee	2022-04-25 08:41:02.351406+00
26	base	0008_remove_processor_image	2022-04-25 08:43:16.197545+00
27	base	0009_processor_image	2022-04-25 08:44:37.26432+00
28	base	0010_remove_processor_image	2022-04-25 08:45:06.959234+00
29	base	0011_processor_model	2022-04-25 08:46:56.313874+00
30	base	0012_alter_processor_model	2022-04-25 08:50:21.798257+00
31	base	0013_micro_alter_processor_model	2022-04-25 08:53:56.325543+00
32	base	0014_processor_image_alter_processor_model_delete_micro	2022-04-25 08:54:26.89016+00
33	base	0015_micro_alter_processor_model	2022-04-25 08:55:33.695383+00
34	base	0016_remove_processor_image	2022-04-25 10:22:06.5634+00
35	base	0017_item	2022-04-25 10:25:24.398195+00
36	base	0018_alter_item_category	2022-04-25 10:26:13.833113+00
37	base	0019_alter_item_category	2022-04-25 10:26:44.558792+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zagibalov
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
x86hgm3qze67u64x356y60d4zrf1rlq7	.eJxVjMsOwiAQRf-FtSGDA7S4dN9vIDM8pGogKe3K-O_apAvd3nPOfQlP21r81tPi5yguQonT78YUHqnuIN6p3poMra7LzHJX5EG7nFpMz-vh_h0U6uVbg40DO0K2zIR2YEDQwWhFxOlMABBHkw2iGYPLJmDOhCprsE5FRVq8P-d_N90:1nitcv:tqsTdnLgMputKpV3KgV-GrNNdIUXn0t2f46MDqTMAGg	2022-05-09 07:59:21.35061+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: base_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.base_item_id_seq', 8, true);


--
-- Name: base_micro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.base_micro_id_seq', 2, true);


--
-- Name: base_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.base_prefix_id_seq', 4, true);


--
-- Name: base_processor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.base_processor_id_seq', 9, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 27, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zagibalov
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: base_item base_item_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_item
    ADD CONSTRAINT base_item_pkey PRIMARY KEY (id);


--
-- Name: base_micro base_micro_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_micro
    ADD CONSTRAINT base_micro_pkey PRIMARY KEY (id);


--
-- Name: base_prefix base_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_prefix
    ADD CONSTRAINT base_prefix_pkey PRIMARY KEY (id);


--
-- Name: base_processor base_processor_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_processor
    ADD CONSTRAINT base_processor_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: base_item_category_id_4e814b7e; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX base_item_category_id_4e814b7e ON public.base_item USING btree (category_id);


--
-- Name: base_item_slug_9484d41c; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX base_item_slug_9484d41c ON public.base_item USING btree (slug);


--
-- Name: base_item_slug_9484d41c_like; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX base_item_slug_9484d41c_like ON public.base_item USING btree (slug varchar_pattern_ops);


--
-- Name: base_processor_model_id_907f6261; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX base_processor_model_id_907f6261 ON public.base_processor USING btree (model_id);


--
-- Name: base_processor_name_id_f668a1f3; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX base_processor_name_id_f668a1f3 ON public.base_processor USING btree (name_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zagibalov
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_item base_item_category_id_4e814b7e_fk_base_item_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_item
    ADD CONSTRAINT base_item_category_id_4e814b7e_fk_base_item_id FOREIGN KEY (category_id) REFERENCES public.base_item(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_processor base_processor_model_id_907f6261_fk_base_micro_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_processor
    ADD CONSTRAINT base_processor_model_id_907f6261_fk_base_micro_id FOREIGN KEY (model_id) REFERENCES public.base_micro(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_processor base_processor_name_id_f668a1f3_fk_base_prefix_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.base_processor
    ADD CONSTRAINT base_processor_name_id_f668a1f3_fk_base_prefix_id FOREIGN KEY (name_id) REFERENCES public.base_prefix(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zagibalov
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

