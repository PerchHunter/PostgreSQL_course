--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO serg_feo;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO serg_feo;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO serg_feo;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO serg_feo;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO serg_feo;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO serg_feo;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO serg_feo;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO serg_feo;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO serg_feo;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO serg_feo;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO serg_feo;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscribe_communities; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.subscribe_communities (
    subscriber_user_id integer NOT NULL,
    subscription_to_community_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.subscribe_communities OWNER TO serg_feo;

--
-- Name: subscribe_communities_statuses; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.subscribe_communities_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.subscribe_communities_statuses OWNER TO serg_feo;

--
-- Name: subscribe_communities_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.subscribe_communities_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribe_communities_statuses_id_seq OWNER TO serg_feo;

--
-- Name: subscribe_communities_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.subscribe_communities_statuses_id_seq OWNED BY public.subscribe_communities_statuses.id;


--
-- Name: subscribe_users; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.subscribe_users (
    subscriber_user_id integer NOT NULL,
    subscription_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone
);


ALTER TABLE public.subscribe_users OWNER TO serg_feo;

--
-- Name: subscribe_users_statuses; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.subscribe_users_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.subscribe_users_statuses OWNER TO serg_feo;

--
-- Name: subscribe_users_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.subscribe_users_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribe_users_statuses_id_seq OWNER TO serg_feo;

--
-- Name: subscribe_users_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.subscribe_users_statuses_id_seq OWNED BY public.subscribe_users_statuses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO serg_feo;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO serg_feo;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: serg_feo
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO serg_feo;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: serg_feo
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO serg_feo;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: serg_feo
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: subscribe_communities_statuses id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_communities_statuses ALTER COLUMN id SET DEFAULT nextval('public.subscribe_communities_statuses_id_seq'::regclass);


--
-- Name: subscribe_users_statuses id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_users_statuses ALTER COLUMN id SET DEFAULT nextval('public.subscribe_users_statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu	41	2021-10-26 16:14:42
2	aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis	55	2022-09-16 02:10:12
3	pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer	8	2022-08-27 17:19:14
4	nunc sed libero. Proin sed turpis nec mauris blandit mattis.	94	2022-06-22 04:40:17
5	sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis,	75	2021-11-15 00:43:48
6	adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc	58	2022-08-02 22:22:32
7	ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris	44	2021-11-01 20:15:59
8	Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis	82	2022-05-04 00:10:01
9	aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque	81	2022-03-24 22:05:11
10	Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque	32	2022-05-05 03:46:12
11	tempor erat neque non quam. Pellentesque habitant morbi tristique senectus	24	2022-05-14 18:25:40
12	eget metus eu erat semper rutrum. Fusce dolor quam, elementum	64	2021-11-13 05:06:46
13	pede. Praesent eu dui. Cum sociis natoque penatibus et magnis	27	2022-08-27 07:45:42
14	vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis.	97	2022-03-11 12:24:31
15	nulla magna, malesuada vel, convallis in, cursus et, eros. Proin	17	2022-06-14 01:55:09
16	tristique pellentesque, tellus sem mollis dui, in sodales elit erat	19	2022-07-25 17:32:59
17	tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at	29	2022-02-19 03:52:28
18	felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem,	23	2022-07-06 10:46:18
19	id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus	42	2022-08-06 14:21:16
20	semper erat, in consectetuer ipsum nunc id enim. Curabitur massa.	12	2021-11-27 03:46:29
21	pede, ultrices a, auctor non, feugiat nec, diam. Duis mi	87	2022-04-29 12:45:20
22	Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,	96	2022-02-27 21:07:05
23	scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit	7	2021-10-26 08:29:31
24	dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	47	2022-05-06 13:45:18
25	mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.	79	2022-07-02 05:37:54
26	mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed	48	2022-07-27 15:03:27
27	odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam	10	2022-03-06 17:43:54
28	lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod	51	2021-11-10 06:14:19
29	inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In	38	2022-09-12 10:58:45
30	vitae aliquam eros turpis non enim. Mauris quis turpis vitae	84	2022-03-24 12:33:39
31	mi tempor lorem, eget mollis lectus pede et risus. Quisque	8	2022-02-11 05:45:36
32	Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla	9	2022-05-24 11:19:22
33	eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet	44	2021-10-27 23:01:58
34	ipsum leo elementum sem, vitae aliquam eros turpis non enim.	29	2022-03-15 03:10:49
35	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.	44	2022-06-21 09:02:43
36	bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna	6	2022-06-12 13:15:11
37	lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis	30	2022-01-26 06:53:48
38	sem magna nec quam. Curabitur vel lectus. Cum sociis natoque	76	2021-10-16 08:05:24
39	hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida	70	2022-05-16 14:11:16
40	est, vitae sodales nisi magna sed dui. Fusce aliquam, enim	79	2022-04-17 23:46:24
41	taciti sociosqu ad litora torquent per conubia nostra, per inceptos	31	2022-01-31 17:45:55
42	cursus non, egestas a, dui. Cras pellentesque. Sed	20	2022-03-08 03:09:47
43	enim, sit amet ornare lectus justo eu arcu. Morbi sit	82	2022-08-26 01:43:07
44	Donec tempor, est ac mattis semper, dui lectus rutrum urna,	55	2022-06-09 11:07:52
45	Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas	70	2022-06-03 02:40:14
46	tellus faucibus leo, in lobortis tellus justo sit amet nulla.	28	2021-11-17 04:00:42
47	auctor, nunc nulla vulputate dui, nec tempus mauris erat eget	35	2022-08-17 00:21:54
48	tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed	94	2022-04-23 11:50:10
49	Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi	81	2022-05-04 23:29:38
50	risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,	60	2022-05-25 13:11:56
51	nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in	51	2022-04-01 09:52:00
52	rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed,	41	2022-08-27 23:10:27
53	lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,	93	2021-11-08 20:09:46
54	nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis	63	2022-01-18 23:56:50
55	tristique senectus et netus et malesuada fames ac turpis egestas.	20	2021-11-25 20:49:14
56	nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et	3	2022-05-18 05:51:21
57	ornare lectus justo eu arcu. Morbi sit amet massa. Quisque	17	2022-07-28 17:06:45
58	rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	22	2022-07-07 06:28:41
59	placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna	51	2022-05-02 13:42:10
60	pede. Cum sociis natoque penatibus et magnis dis parturient montes,	90	2022-09-09 16:51:11
61	mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id	78	2021-10-22 05:32:45
62	Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus	87	2022-03-09 02:51:10
63	Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut	22	2022-05-29 13:42:53
64	non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat	32	2022-04-06 20:06:20
65	nec enim. Nunc ut erat. Sed nunc est, mollis non,	43	2022-06-08 07:59:22
66	dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus.	53	2021-10-28 15:06:56
67	diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec,	11	2022-06-07 16:33:04
68	Sed eget lacus. Mauris non dui nec urna suscipit nonummy.	46	2022-06-24 08:18:18
69	tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi.	92	2021-12-04 16:30:35
70	dapibus id, blandit at, nisi. Cum sociis natoque penatibus et	55	2022-05-10 18:27:56
71	hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium	17	2021-10-04 05:53:56
72	nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor	84	2022-03-15 10:08:12
73	metus. Aenean sed pede nec ante blandit viverra. Donec tempus,	76	2022-02-24 06:34:26
74	sodales nisi magna sed dui. Fusce aliquam, enim	2	2022-07-23 15:54:22
75	vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac	96	2022-04-02 20:55:03
76	Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed	86	2022-04-14 10:18:28
77	Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet	86	2022-04-10 11:20:59
78	dictum augue malesuada malesuada. Integer id magna et ipsum cursus	15	2022-08-05 00:25:27
79	conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien	64	2022-02-02 00:22:43
80	viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis,	52	2022-01-13 10:06:39
81	tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a	35	2022-06-16 19:08:31
82	fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci	12	2022-01-12 13:15:08
83	ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,	68	2022-02-01 03:58:05
84	Quisque purus sapien, gravida non, sollicitudin a, malesuada id,	68	2022-01-08 22:55:27
85	placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,	12	2022-05-09 20:13:36
86	eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est.	69	2021-09-24 05:26:57
87	et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus	73	2022-03-09 13:54:21
88	lorem ipsum sodales purus, in molestie tortor nibh sit amet	13	2021-11-15 13:41:52
89	orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras	53	2021-10-09 07:40:50
90	vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque	69	2021-11-29 02:37:31
91	luctus, ipsum leo elementum sem, vitae aliquam eros turpis non	91	2022-07-27 07:44:19
92	Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim,	59	2022-08-07 17:30:53
93	Sed id risus quis diam luctus lobortis. Class aptent taciti	86	2022-07-23 11:31:17
94	rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,	23	2022-08-05 02:15:01
95	fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat	1	2021-12-13 22:51:56
96	risus a ultricies adipiscing, enim mi tempor lorem, eget mollis	39	2022-07-18 22:46:01
97	arcu iaculis enim, sit amet ornare lectus justo eu arcu.	93	2022-06-17 17:25:11
98	Sed auctor odio a purus. Duis elementum, dui quis accumsan	29	2022-04-28 05:49:15
99	convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt	58	2022-03-20 20:22:14
100	elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris	75	2021-12-29 23:51:36
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
68	36	2022-05-29 19:58:59
41	42	2022-02-04 00:26:32
39	70	2021-12-01 02:15:42
83	95	2022-01-17 10:37:17
91	59	2021-10-08 22:02:30
6	27	2022-03-13 12:29:25
52	59	2022-01-06 04:45:19
46	54	2022-06-29 15:33:12
3	25	2021-10-04 07:45:32
98	61	2022-07-25 05:39:45
84	15	2022-07-07 18:46:55
34	21	2021-09-25 07:36:10
43	33	2022-08-22 15:31:54
24	36	2022-08-04 06:01:31
58	81	2021-10-02 06:21:24
14	10	2022-07-18 21:19:29
19	69	2021-12-02 16:01:43
5	61	2021-11-18 12:27:14
100	84	2022-09-15 15:13:34
46	27	2022-07-01 18:01:21
39	14	2022-01-08 02:52:46
67	19	2022-05-01 12:21:45
90	45	2022-09-12 05:54:44
6	44	2021-10-23 06:43:05
34	49	2021-10-16 11:17:45
71	70	2022-02-25 13:04:36
59	31	2021-11-26 13:24:53
20	34	2022-06-04 19:35:47
99	25	2022-09-02 02:39:18
46	38	2022-03-18 04:03:12
62	4	2022-04-16 11:58:22
50	68	2021-10-25 08:09:30
77	34	2022-01-08 07:32:44
23	97	2021-10-28 14:02:27
7	12	2021-11-04 15:58:35
2	52	2022-01-30 16:21:30
93	85	2022-08-05 18:57:57
90	99	2021-11-29 05:21:39
85	23	2022-08-08 05:01:33
84	94	2022-04-26 00:10:43
53	59	2022-03-22 19:55:53
1	29	2021-12-04 06:40:33
12	24	2022-06-12 09:13:46
92	63	2021-11-23 18:04:04
52	61	2022-09-11 16:27:54
52	67	2022-04-17 15:50:41
57	12	2022-06-02 04:44:02
9	44	2021-11-01 23:32:24
26	87	2022-01-15 22:21:25
37	50	2022-02-10 12:25:41
68	33	2022-04-23 13:50:37
41	84	2021-12-06 19:31:32
38	42	2022-03-12 17:54:36
7	47	2022-06-27 17:50:54
30	2	2021-10-05 06:36:08
78	19	2022-05-12 04:44:00
17	48	2022-03-14 15:29:31
69	43	2022-02-20 22:32:08
91	67	2021-12-22 00:44:10
90	2	2022-08-10 21:48:56
85	94	2022-01-09 10:17:11
86	67	2022-04-26 14:55:45
49	38	2022-04-23 02:25:29
81	61	2022-02-14 04:25:05
60	76	2022-09-05 07:59:22
18	25	2022-07-07 23:59:19
40	32	2022-03-06 14:15:10
29	86	2022-03-27 00:28:48
30	13	2022-09-02 00:40:35
17	14	2022-07-17 09:28:20
47	62	2022-09-02 01:29:08
73	45	2022-07-20 16:31:04
14	32	2022-08-08 21:45:38
87	48	2022-03-25 07:52:36
7	25	2022-04-16 09:04:38
71	18	2022-02-22 08:41:28
24	94	2021-11-17 21:14:51
74	100	2021-12-29 04:25:50
99	56	2022-02-11 09:55:25
31	6	2022-07-01 02:02:27
45	59	2022-04-11 12:36:24
77	85	2022-07-16 20:22:29
34	13	2022-05-17 01:35:24
56	71	2021-11-17 14:37:51
66	90	2021-12-21 04:34:19
46	61	2022-03-17 21:09:22
1	25	2021-11-21 22:58:48
49	14	2021-12-26 09:37:35
33	28	2022-06-24 08:51:18
24	37	2022-06-11 08:00:58
61	98	2022-08-29 22:25:20
57	77	2022-04-07 07:16:02
18	35	2022-05-26 02:28:18
56	78	2022-03-20 09:15:01
94	65	2022-08-08 13:35:47
5	63	2022-09-22 00:31:09
12	56	2022-07-02 16:56:43
33	98	2022-05-19 17:56:09
23	6	2022-06-07 16:51:32
80	53	2022-07-21 21:40:45
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	14	12	1	2022-06-12 15:11:08	2022-02-16 02:24:31
2	26	60	2	2022-08-22 18:13:09	2021-10-05 05:42:02
3	43	56	1	2021-11-12 19:48:46	2022-04-17 18:17:51
4	44	80	2	2022-02-13 18:28:04	2021-11-18 04:05:57
5	65	70	3	2022-08-12 19:22:21	2021-11-10 04:01:47
6	60	57	3	2022-07-01 00:29:21	2022-04-14 09:44:07
7	21	4	2	2022-09-22 14:17:22	2021-10-24 06:14:36
8	67	89	2	2022-01-09 03:49:58	2021-11-08 11:29:36
9	19	50	1	2022-08-26 11:45:09	2022-05-30 20:48:59
10	54	64	2	2021-09-25 09:05:26	2022-02-05 21:20:48
11	77	51	1	2022-05-14 12:25:35	2022-05-30 16:23:46
12	17	100	2	2022-08-25 02:23:23	2022-08-27 06:57:54
13	78	19	2	2022-08-08 13:06:15	2022-02-15 13:42:40
14	54	10	1	2022-02-23 18:23:09	2022-06-29 09:52:47
15	45	60	1	2021-11-20 10:28:35	2021-12-08 13:06:06
16	66	55	2	2022-02-20 14:06:55	2022-01-27 19:19:11
17	83	48	1	2022-05-21 17:25:47	2021-12-26 21:13:06
18	66	5	1	2021-11-21 01:24:48	2022-02-25 15:21:34
19	52	6	1	2021-10-21 18:23:00	2022-02-01 18:45:26
20	23	83	2	2021-10-09 23:05:19	2021-11-18 10:52:11
21	44	52	2	2022-07-31 09:57:41	2022-06-20 04:02:23
22	78	81	3	2022-04-19 10:51:44	2022-07-04 22:13:35
23	47	55	2	2021-12-19 16:55:32	2021-11-15 07:56:59
24	5	70	2	2022-03-11 09:17:19	2022-08-07 08:08:08
25	67	55	2	2022-07-20 16:42:18	2022-01-05 04:26:23
26	84	99	2	2021-10-31 19:25:50	2022-08-23 11:31:55
27	78	99	2	2022-05-16 23:46:46	2022-03-02 06:13:10
28	73	76	3	2021-11-01 13:03:13	2022-07-16 03:29:59
29	18	54	3	2022-04-04 17:39:15	2022-04-26 07:27:32
30	64	7	2	2022-08-03 09:10:20	2022-05-18 20:03:42
31	89	70	1	2022-05-28 04:55:45	2022-05-05 23:23:34
32	12	62	1	2022-08-22 14:41:31	2022-02-24 03:42:49
33	22	86	2	2022-05-22 19:16:30	2022-01-09 15:32:42
34	86	94	2	2022-07-30 23:40:25	2022-03-07 09:21:52
35	57	31	3	2022-08-02 12:31:45	2021-11-01 05:42:43
36	31	64	1	2022-01-12 16:23:53	2022-06-12 05:05:00
37	62	51	1	2022-07-23 15:32:28	2022-04-24 05:09:30
38	4	91	3	2022-03-27 19:57:20	2022-06-01 21:11:03
39	14	75	2	2022-01-27 18:43:50	2022-03-04 08:51:37
40	3	41	2	2022-03-23 15:59:21	2022-04-11 03:54:29
41	5	44	2	2022-06-20 14:02:25	2021-10-05 18:18:36
42	58	57	2	2022-07-05 01:43:30	2022-07-27 14:52:02
43	79	71	2	2022-04-23 05:54:27	2021-11-29 14:51:36
44	81	41	2	2022-05-26 08:27:37	2022-07-27 19:36:27
45	67	41	2	2021-10-15 21:27:26	2022-09-22 22:32:43
46	55	7	1	2021-10-31 07:42:31	2022-01-26 17:31:01
47	53	81	2	2022-02-21 09:14:45	2021-11-18 04:32:06
48	7	78	2	2022-09-01 16:12:04	2022-03-05 14:23:06
49	22	24	3	2022-07-22 06:14:50	2022-06-01 03:02:37
50	18	37	3	2021-12-14 16:37:09	2022-01-27 19:42:02
51	15	87	2	2022-03-30 23:58:20	2022-01-24 09:08:19
52	43	52	2	2022-06-06 07:07:50	2022-01-05 06:55:26
53	17	65	1	2022-01-24 19:29:30	2022-08-05 07:51:00
54	91	30	2	2022-03-31 10:55:42	2022-06-07 20:55:36
55	88	99	1	2022-09-09 16:00:14	2022-06-20 05:17:41
56	25	49	3	2021-10-04 13:34:26	2022-03-15 02:00:59
57	42	97	2	2022-09-15 10:40:50	2022-02-11 06:50:33
58	51	34	1	2022-07-28 16:02:37	2022-01-16 01:01:30
59	38	46	3	2022-08-24 11:45:39	2021-10-27 12:03:40
60	84	46	3	2022-04-02 09:19:28	2021-10-27 16:17:37
61	76	77	2	2021-12-15 12:23:55	2022-02-13 06:27:29
62	20	82	1	2022-01-12 15:54:38	2022-01-13 11:46:03
63	27	75	2	2022-05-04 15:11:09	2022-02-22 19:43:31
64	28	77	1	2022-01-03 05:36:02	2022-07-20 08:28:12
65	27	20	3	2022-01-01 17:12:00	2022-07-17 16:17:34
66	62	26	1	2022-06-16 06:36:59	2022-06-30 08:27:14
67	10	2	3	2022-01-30 15:56:58	2022-03-20 22:55:15
68	68	59	3	2022-02-02 15:03:51	2022-03-20 23:07:41
69	96	62	2	2022-02-15 11:00:58	2022-09-12 21:00:20
70	96	88	3	2021-10-07 12:38:03	2022-04-09 18:27:51
71	78	43	1	2022-01-27 11:36:01	2021-12-24 19:45:35
72	42	79	3	2022-06-17 04:27:21	2022-05-04 15:05:03
73	45	59	2	2021-11-24 13:52:34	2022-09-19 09:18:58
74	99	11	2	2021-09-25 14:29:44	2021-10-03 22:11:11
75	85	18	2	2022-03-05 07:44:06	2022-08-19 03:06:48
76	79	99	2	2022-06-11 15:47:58	2021-11-30 20:46:32
77	81	87	2	2021-12-02 09:19:04	2022-04-12 12:07:32
78	78	74	2	2022-06-30 19:44:37	2022-08-24 14:17:12
79	51	3	3	2022-01-02 22:26:06	2022-05-04 20:01:13
80	20	80	2	2022-04-24 06:55:09	2022-08-14 22:22:59
81	13	51	2	2022-08-05 14:30:18	2022-06-08 18:44:28
82	9	96	1	2022-04-19 16:30:00	2022-02-28 20:09:49
83	39	14	2	2021-11-15 11:20:05	2022-02-25 01:06:32
84	89	38	2	2022-03-08 20:22:12	2022-06-04 17:29:16
85	88	30	3	2021-12-18 00:30:38	2022-08-29 01:55:15
86	22	63	2	2022-01-09 18:58:20	2022-04-08 19:42:13
87	19	68	1	2022-09-14 00:04:15	2022-01-04 12:03:40
88	33	58	2	2021-10-12 05:46:20	2022-04-04 04:37:05
89	16	38	1	2022-09-04 23:09:24	2022-06-19 08:37:09
90	40	92	3	2022-01-18 04:25:06	2021-12-31 11:39:33
91	26	36	3	2022-01-25 06:47:58	2022-05-08 18:40:38
92	17	52	3	2022-07-09 11:56:05	2021-10-09 11:34:01
93	93	51	2	2022-05-08 21:01:58	2022-04-07 08:36:49
94	43	13	2	2021-12-25 11:50:31	2022-03-09 17:28:34
95	24	65	3	2021-12-11 16:03:48	2022-01-01 16:48:49
96	22	77	2	2022-07-21 09:10:53	2022-07-31 05:09:23
97	80	22	2	2022-07-20 09:52:21	2022-04-08 22:47:21
98	62	41	3	2022-07-30 10:29:50	2021-10-26 07:07:28
99	11	61	3	2022-01-28 05:41:15	2022-02-18 17:17:33
100	1	36	1	2022-08-26 04:11:13	2022-08-16 10:13:21
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	В ожидании
2	Подтверждено
3	Отклонено
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	5	59	mauris eu elit. Nulla facilisi. Sed neque. Sed	f	t	2022-05-24 12:00:34
2	87	69	a nunc. In at	f	f	2022-03-16 04:08:51
3	60	57	ullamcorper eu, euismod	t	t	2021-12-13 11:30:17
4	59	45	neque. Nullam	f	f	2022-07-26 10:16:27
5	25	65	est mauris, rhoncus id,	t	t	2022-03-08 02:21:52
6	6	99	neque et nunc. Quisque ornare	t	t	2021-10-27 04:35:11
7	67	75	sit amet	t	t	2022-03-13 20:49:36
8	26	33	quis diam	t	t	2021-10-31 01:52:25
9	64	61	Sed	f	t	2022-04-29 17:03:04
10	44	4	tellus eu augue porttitor interdum. Sed auctor odio	f	f	2022-08-15 11:12:26
11	44	46	et arcu imperdiet ullamcorper. Duis at lacus. Quisque	t	f	2021-12-20 21:24:24
12	80	67	blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae	f	t	2021-10-13 16:06:29
13	62	12	ipsum nunc id enim. Curabitur	f	f	2021-09-26 23:19:00
14	24	26	Curae Phasellus ornare. Fusce mollis. Duis sit	f	t	2022-04-10 18:29:04
15	94	77	risus quis diam luctus lobortis.	t	f	2021-11-26 21:17:58
16	78	43	orci lacus vestibulum lorem,	f	f	2022-07-31 08:52:40
17	46	43	pellentesque, tellus sem mollis	t	f	2022-02-10 06:40:23
18	72	20	nunc. Quisque	f	f	2022-01-30 03:05:53
19	44	12	Duis volutpat nunc sit amet metus.	f	f	2021-11-16 17:10:37
20	98	78	Vivamus molestie dapibus	t	t	2022-01-16 09:39:07
21	38	69	dui lectus rutrum urna, nec luctus felis purus ac	f	t	2022-03-20 10:16:14
22	78	96	tellus non magna. Nam ligula elit, pretium et, rutrum	f	t	2022-06-01 19:46:43
23	57	19	fringilla. Donec feugiat	f	f	2022-02-18 22:34:11
24	65	73	libero et tristique pellentesque, tellus sem	t	f	2021-11-14 13:17:23
25	36	74	purus. Maecenas libero est, congue	f	t	2022-07-12 13:26:45
26	90	77	velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer	t	t	2021-12-13 02:03:12
27	57	55	velit eget	f	f	2022-04-01 01:34:56
28	83	49	fermentum fermentum arcu. Vestibulum ante ipsum primis in	f	t	2022-06-30 10:53:34
29	15	48	lacinia at, iaculis quis, pede. Praesent eu dui. Cum	f	f	2021-11-16 03:24:49
30	48	62	aliquam arcu. Aliquam ultrices iaculis odio.	t	f	2021-12-08 10:28:01
31	56	95	velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas.	t	t	2021-11-30 03:41:30
32	56	88	Suspendisse aliquet molestie tellus. Aenean egestas	t	t	2021-12-09 01:39:28
33	81	34	dolor vitae dolor. Donec fringilla. Donec feugiat metus	t	f	2021-10-05 01:31:36
34	10	18	non, bibendum sed, est. Nunc laoreet	f	t	2022-09-02 09:15:13
35	97	79	adipiscing non, luctus sit amet,	f	f	2022-01-18 18:01:50
36	31	62	ante dictum mi, ac mattis velit justo nec ante.	t	f	2022-02-18 09:32:10
37	72	37	at, iaculis quis, pede. Praesent eu dui.	t	f	2021-10-30 13:37:13
38	99	51	accumsan neque et	f	f	2022-08-23 18:48:00
39	52	66	tristique senectus et netus et malesuada fames ac turpis egestas.	t	f	2022-03-14 12:38:41
40	24	13	vel	f	t	2022-09-09 23:22:14
41	25	58	eleifend, nunc risus varius orci, in consequat enim	t	f	2021-12-15 11:04:48
42	91	26	fringilla ornare placerat, orci lacus vestibulum lorem, sit	f	t	2021-10-12 11:07:39
43	17	44	Donec feugiat metus sit amet ante. Vivamus non	f	f	2022-02-28 18:30:38
44	57	49	ac mattis	f	t	2022-09-08 01:37:37
45	9	28	id, blandit at, nisi. Cum sociis natoque penatibus et	f	f	2022-09-01 02:45:12
46	87	13	Sed nunc est, mollis non, cursus	f	f	2022-04-21 16:42:23
47	26	10	a feugiat tellus lorem eu metus. In lorem.	t	f	2021-11-02 17:17:00
48	10	94	quis accumsan convallis,	t	f	2022-05-13 08:23:15
49	28	24	dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque	t	t	2021-11-25 13:52:43
50	47	4	ac mattis velit	f	f	2022-02-06 03:54:46
51	88	92	luctus ut, pellentesque eget, dictum placerat, augue.	f	f	2021-10-28 18:50:58
52	4	75	dolor. Fusce feugiat. Lorem ipsum	t	t	2022-03-30 18:47:41
53	77	71	Proin eget odio. Aliquam vulputate	t	t	2022-01-21 13:51:18
54	33	32	mollis. Integer tincidunt	t	t	2022-01-17 14:13:29
55	68	81	nec, cursus a, enim. Suspendisse aliquet, sem ut cursus	f	t	2022-08-07 14:07:33
56	67	23	neque. Nullam ut nisi a odio semper cursus. Integer	f	t	2022-01-29 09:53:43
57	53	80	lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam	f	t	2022-01-22 21:06:55
58	73	68	ullamcorper. Duis cursus,	t	t	2021-10-06 18:52:52
59	69	44	ut, sem. Nulla interdum. Curabitur dictum.	t	f	2022-07-23 21:25:56
60	4	20	lacus pede sagittis augue, eu tempor erat neque non quam.	t	f	2022-04-18 10:01:58
61	59	88	Aenean eget metus. In nec orci. Donec	t	f	2022-04-30 15:18:42
62	48	32	nibh dolor, nonummy ac, feugiat non, lobortis quis,	f	t	2022-01-20 05:28:01
63	96	20	nonummy ipsum non arcu. Vivamus sit	t	f	2022-06-13 20:15:25
64	2	24	luctus felis purus	t	f	2022-01-21 20:07:57
65	50	57	a, aliquet vel,	f	f	2022-09-07 00:46:50
66	11	78	sed consequat auctor, nunc nulla vulputate dui, nec tempus	f	f	2021-11-29 15:46:50
67	23	30	semper egestas, urna justo faucibus lectus, a	f	t	2022-07-02 17:15:54
68	73	28	ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque	f	t	2022-03-29 20:08:05
69	2	82	porttitor tellus non magna. Nam ligula elit,	t	f	2022-01-18 21:20:01
70	78	36	gravida. Aliquam tincidunt, nunc	f	t	2021-10-22 03:28:27
71	57	83	Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices.	f	t	2022-03-24 02:07:06
72	44	73	Nam porttitor scelerisque	t	t	2022-05-10 12:16:00
73	92	84	adipiscing lobortis	f	t	2021-11-04 07:49:34
74	3	25	Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis	f	f	2022-07-28 01:19:08
75	78	75	Maecenas mi felis,	t	t	2021-10-23 04:21:28
76	3	71	pellentesque a, facilisis non,	t	t	2022-01-17 03:40:33
77	84	79	lectus justo eu arcu. Morbi sit amet massa. Quisque	f	t	2022-08-13 01:02:42
78	78	99	nec,	t	f	2022-07-20 07:11:34
79	6	41	auctor, nunc nulla vulputate dui, nec tempus	t	t	2022-01-11 07:01:48
80	19	61	tortor, dictum eu, placerat eget, venenatis a, magna. Lorem	t	t	2022-03-03 06:56:06
81	66	63	amet, dapibus id,	t	t	2022-06-08 02:58:00
82	4	6	sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla	f	f	2022-07-26 09:08:08
83	10	99	risus. Donec egestas. Duis ac arcu. Nunc mauris.	t	f	2022-06-09 05:59:43
84	32	82	a, arcu. Sed et	f	f	2022-03-17 05:50:21
85	55	37	ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci,	t	f	2022-06-18 16:41:51
86	21	16	mattis velit justo nec ante. Maecenas mi	t	f	2021-09-23 21:25:51
87	14	47	felis eget varius ultrices, mauris ipsum porta elit,	t	t	2022-01-05 07:05:24
88	16	20	sed dictum eleifend, nunc risus varius orci,	t	f	2021-11-04 22:14:06
89	45	29	arcu vel quam dignissim pharetra. Nam ac	t	t	2022-08-12 13:45:39
90	52	32	amet diam eu	f	f	2021-12-18 15:26:01
91	85	38	sed dictum eleifend, nunc risus varius	t	f	2022-06-29 07:15:38
92	76	38	Nullam lobortis quam a felis	f	f	2022-03-23 17:58:08
93	79	32	Phasellus	f	t	2021-10-25 19:12:14
94	54	20	primis in faucibus orci luctus et ultrices posuere	t	f	2021-12-25 16:11:29
95	22	48	interdum. Sed auctor odio a	t	f	2022-03-07 20:35:11
96	2	37	dignissim magna a tortor. Nunc commodo	t	t	2021-11-20 07:51:25
97	53	28	nulla. Integer urna. Vivamus molestie dapibus ligula.	f	t	2022-03-04 19:44:12
98	66	4	cursus. Nunc	t	f	2022-02-08 03:03:30
99	28	48	arcu imperdiet ullamcorper. Duis	t	f	2022-06-02 09:17:06
100	6	72	nec quam. Curabitur	f	f	2021-10-22 10:08:12
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	https://vk.com/user/79?p=25	62	arcu. Vivamus sit amet risus.	2021-12-28 08:04:18	2533
2	https://vk.com/user/46?p=52	69	elit fermentum risus, at fringilla	2022-03-28 22:42:26	226
3	https://vk.com/user/9?p=28	80	Aliquam nec enim. Nunc ut	2021-10-24 06:55:48	7954
4	https://vk.com/user/97?p=20	82	ligula. Aenean euismod mauris eu	2022-05-14 00:25:49	5158
5	https://vk.com/user/97?p=36	99	Cras eu tellus eu augue	2022-04-23 08:50:38	12692
6	https://vk.com/user/18?p=23	21	Etiam gravida molestie arcu. Sed	2022-03-04 20:18:17	7993
7	https://vk.com/user/31?p=66	45	urna. Nullam lobortis quam a	2022-08-04 09:11:11	3878
8	https://vk.com/user/88?p=76	78	lectus convallis est, vitae sodales	2022-09-09 21:41:44	6075
9	https://vk.com/user/53?p=91	68	a, enim. Suspendisse aliquet, sem	2022-06-17 14:05:13	3742
10	https://vk.com/user/34?p=15	79	ligula elit, pretium et, rutrum	2021-10-07 05:06:53	10183
11	https://vk.com/user/57?p=68	22	rutrum urna, nec luctus felis	2022-08-02 14:49:22	2210
12	https://vk.com/user/22?p=59	46	ac mattis velit justo nec	2022-03-20 07:46:12	5249
13	https://vk.com/user/47?p=90	86	congue turpis. In condimentum. Donec	2022-09-07 11:08:46	11818
14	https://vk.com/user/28?p=72	70	egestas blandit. Nam nulla magna,	2022-03-08 22:50:31	5733
15	https://vk.com/user/97?p=91	14	nulla ante, iaculis nec, eleifend	2021-10-13 21:54:36	9599
16	https://vk.com/user/77?p=74	90	sit amet, consectetuer adipiscing elit.	2022-05-08 10:08:22	1027
17	https://vk.com/user/29?p=47	92	gravida nunc sed pede. Cum	2021-12-01 03:35:47	9706
18	https://vk.com/user/81?p=96	51	elit, pretium et, rutrum non,	2022-09-05 04:40:59	11115
19	https://vk.com/user/53?p=60	6	aliquam, enim nec tempus scelerisque,	2021-09-30 07:00:43	14458
20	https://vk.com/user/25?p=11	15	Nulla eu neque pellentesque massa	2022-06-19 18:01:40	4333
21	https://vk.com/user/24?p=26	7	pede, ultrices a, auctor non,	2022-08-09 09:06:43	4587
22	https://vk.com/user/62?p=8	66	hendrerit a, arcu. Sed et	2022-03-05 11:54:18	14950
23	https://vk.com/user/21?p=73	26	scelerisque neque. Nullam nisl. Maecenas	2021-11-14 01:12:56	3668
24	https://vk.com/user/20?p=93	87	luctus sit amet, faucibus ut,	2021-11-22 22:14:43	13917
25	https://vk.com/user/37?p=85	29	euismod est arcu ac orci.	2022-07-14 05:27:45	13372
26	https://vk.com/user/22?p=83	82	ultrices posuere cubilia Curae Donec	2022-05-18 14:48:19	682
27	https://vk.com/user/69?p=21	41	dolor dapibus gravida. Aliquam tincidunt,	2022-07-21 18:00:34	7177
28	https://vk.com/user/66?p=48	80	tellus. Phasellus elit pede, malesuada	2022-07-31 00:03:42	2691
29	https://vk.com/user/90?p=77	55	ullamcorper. Duis at lacus. Quisque	2022-01-14 09:21:49	14357
30	https://vk.com/user/73?p=73	68	turpis egestas. Fusce aliquet magna	2022-07-14 11:26:58	2138
31	https://vk.com/user/18?p=3	45	ut odio vel est tempor	2022-08-09 13:51:06	844
32	https://vk.com/user/19?p=65	95	et risus. Quisque libero lacus,	2021-11-14 12:45:56	12017
33	https://vk.com/user/69?p=18	41	nonummy ac, feugiat non, lobortis	2022-01-27 17:17:31	13192
34	https://vk.com/user/14?p=72	17	id, blandit at, nisi. Cum	2022-04-16 06:27:27	5455
35	https://vk.com/user/85?p=51	98	ligula consectetuer rhoncus. Nullam velit	2021-12-19 17:35:31	12963
36	https://vk.com/user/54?p=69	30	quis urna. Nunc quis arcu	2022-01-05 03:50:35	10814
37	https://vk.com/user/81?p=37	86	amet massa. Quisque porttitor eros	2022-02-16 14:39:30	14446
38	https://vk.com/user/48?p=57	37	congue turpis. In condimentum. Donec	2022-07-26 14:11:37	4801
39	https://vk.com/user/71?p=6	84	fermentum arcu. Vestibulum ante ipsum	2022-04-29 18:01:39	14868
40	https://vk.com/user/59?p=8	53	ipsum sodales purus, in molestie	2022-09-18 17:21:35	4472
41	https://vk.com/user/49?p=20	70	sem magna nec quam. Curabitur	2021-12-30 02:11:06	12781
42	https://vk.com/user/26?p=2	31	Mauris ut quam vel sapien	2022-01-31 00:03:21	10521
43	https://vk.com/user/90?p=25	90	Curae Donec tincidunt. Donec vitae	2022-08-28 10:05:43	4549
44	https://vk.com/user/50?p=31	66	Proin velit. Sed malesuada augue	2021-10-13 01:34:42	4344
45	https://vk.com/user/79?p=44	57	Nam ac nulla. In tincidunt	2022-09-05 13:46:05	7684
46	https://vk.com/user/7?p=9	6	Aenean gravida nunc sed pede.	2022-07-13 05:20:18	10665
47	https://vk.com/user/19?p=75	6	fringilla, porttitor vulputate, posuere vulputate,	2021-10-19 01:29:44	2018
48	https://vk.com/user/67?p=76	64	molestie arcu. Sed eu nibh	2021-10-17 05:42:16	8953
49	https://vk.com/user/54?p=40	84	nibh vulputate mauris sagittis placerat.	2022-04-19 23:34:15	12527
50	https://vk.com/user/38?p=98	63	ligula. Aliquam erat volutpat. Nulla	2022-03-14 01:38:46	6032
51	https://vk.com/user/48?p=83	78	Sed neque. Sed eget lacus.	2021-12-29 22:09:49	9970
52	https://vk.com/user/81?p=18	36	Nunc ut erat. Sed nunc	2022-06-25 12:58:38	11792
53	https://vk.com/user/99?p=54	14	Duis gravida. Praesent eu nulla	2022-03-18 19:26:47	5087
54	https://vk.com/user/68?p=48	80	Aliquam nisl. Nulla eu neque	2022-09-19 14:30:35	6952
55	https://vk.com/user/75?p=89	37	nulla magna, malesuada vel, convallis	2021-10-16 15:51:15	12053
56	https://vk.com/user/1?p=17	86	vulputate, nisi sem semper erat,	2022-03-23 02:38:06	9966
57	https://vk.com/user/65?p=89	17	Nunc laoreet lectus quis massa.	2022-04-13 06:34:51	12826
58	https://vk.com/user/79?p=33	31	at pretium aliquet, metus urna	2022-07-10 20:48:19	12462
59	https://vk.com/user/93?p=86	78	a feugiat tellus lorem eu	2022-02-23 05:38:48	10009
60	https://vk.com/user/78?p=56	37	nascetur ridiculus mus. Aenean eget	2021-10-13 13:09:06	7387
61	https://vk.com/user/73?p=88	57	pretium aliquet, metus urna convallis	2021-11-22 23:26:40	8199
62	https://vk.com/user/84?p=75	66	congue a, aliquet vel, vulputate	2022-04-18 16:23:04	12655
63	https://vk.com/user/25?p=64	13	orci tincidunt adipiscing. Mauris molestie	2022-06-30 11:36:47	555
64	https://vk.com/user/69?p=39	81	Nam nulla magna, malesuada vel,	2022-07-13 16:17:37	3741
65	https://vk.com/user/93?p=13	49	Proin sed turpis nec mauris	2022-01-21 15:06:53	3722
66	https://vk.com/user/24?p=7	100	faucibus ut, nulla. Cras eu	2022-09-16 00:43:40	12224
67	https://vk.com/user/92?p=50	54	imperdiet ornare. In faucibus. Morbi	2022-02-25 18:48:08	7491
68	https://vk.com/user/35?p=36	48	tincidunt aliquam arcu. Aliquam ultrices	2022-03-13 22:56:28	8949
69	https://vk.com/user/14?p=15	34	eleifend. Cras sed leo. Cras	2022-07-01 08:15:39	7300
70	https://vk.com/user/69?p=81	72	Fusce aliquet magna a neque.	2022-06-05 02:47:09	8877
71	https://vk.com/user/6?p=48	41	egestas, urna justo faucibus lectus,	2021-11-28 12:05:40	2750
72	https://vk.com/user/12?p=44	46	non, cursus non, egestas a,	2021-12-01 04:41:45	13619
73	https://vk.com/user/48?p=52	86	aliquet lobortis, nisi nibh lacinia	2022-03-24 12:12:31	4925
74	https://vk.com/user/36?p=82	12	dis parturient montes, nascetur ridiculus	2022-01-18 16:35:30	8936
75	https://vk.com/user/90?p=66	23	ut odio vel est tempor	2022-02-10 15:57:10	5948
76	https://vk.com/user/49?p=14	81	dolor elit, pellentesque a, facilisis	2021-10-04 20:38:11	7305
77	https://vk.com/user/97?p=66	14	malesuada id, erat. Etiam vestibulum	2021-12-22 09:56:53	3047
78	https://vk.com/user/49?p=47	75	ac mi eleifend egestas. Sed	2021-10-16 21:54:48	10191
79	https://vk.com/user/24?p=32	81	vel, venenatis vel, faucibus id,	2022-08-28 00:14:19	11432
80	https://vk.com/user/65?p=66	13	aliquet lobortis, nisi nibh lacinia	2022-06-28 10:12:53	8464
81	https://vk.com/user/15?p=82	22	felis eget varius ultrices, mauris	2022-01-24 23:23:47	12171
82	https://vk.com/user/72?p=43	48	Vestibulum ante ipsum primis in	2022-02-26 03:54:04	10942
83	https://vk.com/user/26?p=79	9	cursus non, egestas a, dui.	2021-10-15 16:51:29	4214
84	https://vk.com/user/60?p=43	41	Donec egestas. Duis ac arcu.	2021-11-17 16:31:17	7566
85	https://vk.com/user/100?p=54	14	lectus ante dictum mi, ac	2022-05-28 17:15:03	12071
86	https://vk.com/user/62?p=13	98	pretium et, rutrum non, hendrerit	2021-09-23 07:53:09	3044
87	https://vk.com/user/71?p=26	55	et ultrices posuere cubilia Curae	2022-04-19 15:10:10	11453
88	https://vk.com/user/6?p=31	87	Proin dolor. Nulla semper tellus	2021-11-10 14:40:39	10972
89	https://vk.com/user/37?p=90	44	aliquet diam. Sed diam lorem,	2022-08-21 17:35:55	9741
90	https://vk.com/user/79?p=84	61	odio. Aliquam vulputate ullamcorper magna.	2022-04-05 07:18:27	7234
91	https://vk.com/user/33?p=77	6	eu, placerat eget, venenatis a,	2022-02-09 14:45:19	6576
92	https://vk.com/user/100?p=4	27	Donec tempus, lorem fringilla ornare	2022-06-23 03:57:04	1652
93	https://vk.com/user/75?p=16	48	a, malesuada id, erat. Etiam	2022-05-16 14:14:43	5849
94	https://vk.com/user/28?p=89	76	ullamcorper viverra. Maecenas iaculis aliquet	2022-03-11 17:27:38	6447
95	https://vk.com/user/36?p=90	20	leo. Cras vehicula aliquet libero.	2022-01-09 05:38:12	8081
96	https://vk.com/user/1?p=91	65	nec tellus. Nunc lectus pede,	2022-02-17 22:34:51	5765
97	https://vk.com/user/30?p=84	94	sed dictum eleifend, nunc risus	2022-02-26 04:28:33	11621
98	https://vk.com/user/80?p=37	76	Sed nec metus facilisis lorem	2021-09-24 17:26:50	1958
99	https://vk.com/user/69?p=91	50	dictum magna. Ut tincidunt orci	2022-06-16 22:38:40	3849
100	https://vk.com/user/8?p=33	28	ante, iaculis nec, eleifend non,	2022-04-07 05:11:29	13511
\.


--
-- Data for Name: subscribe_communities; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.subscribe_communities (subscriber_user_id, subscription_to_community_id, status_id, requested_at, confirmed_at) FROM stdin;
\.


--
-- Data for Name: subscribe_communities_statuses; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.subscribe_communities_statuses (id, name) FROM stdin;
\.


--
-- Data for Name: subscribe_users; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.subscribe_users (subscriber_user_id, subscription_to_user_id, status_id, requested_at) FROM stdin;
\.


--
-- Data for Name: subscribe_users_statuses; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.subscribe_users_statuses (id, name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Rachel	Buckley	urna.suscipit.nonummy@google.net	1-532-678-3951	70	2022-09-20 10:14:24
2	Alfonso	Case	sed@hotmail.ca	1-592-151-6858	87	2022-07-26 10:02:53
3	Macon	Barry	ac.metus@google.ca	393-2248	41	2021-10-06 14:40:41
4	Emery	Cain	ultricies.ligula@icloud.edu	827-8691	80	2021-11-13 01:10:15
5	Martina	Reeves	vehicula.risus@icloud.net	742-4533	29	2022-09-05 12:37:01
6	Belle	Travis	tellus.phasellus@protonmail.com	1-724-452-3234	35	2021-10-09 03:04:34
7	Chaney	Adams	quisque.fringilla@google.couk	1-747-540-0367	18	2021-09-30 06:06:30
8	Bree	Hendricks	elit.a@outlook.com	200-5271	43	2022-05-22 04:09:55
9	Kylynn	Santiago	quis.pede.praesent@protonmail.edu	1-673-543-2839	24	2021-11-11 11:38:20
10	Orlando	Cabrera	tempus@protonmail.ca	1-592-545-8624	18	2022-04-19 08:45:43
11	Octavius	Short	a@aol.com	709-3174	98	2021-11-02 05:50:20
12	Celeste	Bowman	enim.etiam@google.edu	1-535-490-3028	17	2022-03-22 18:38:35
13	Indira	Lawrence	nam.tempor@outlook.net	522-2210	20	2022-08-01 00:15:35
14	Melvin	Pope	non.feugiat@google.edu	488-4347	75	2022-04-27 15:15:56
15	Georgia	Valentine	vulputate.nisi.sem@protonmail.couk	224-4265	73	2022-01-23 15:51:34
16	Avram	Montoya	blandit.at@google.net	1-470-731-2886	47	2021-12-17 21:04:04
17	Benedict	Sweet	quis.pede.suspendisse@yahoo.couk	291-6815	33	2021-11-28 04:15:45
18	Karyn	Santiago	nulla.semper@google.net	737-0854	12	2022-06-24 23:29:20
19	Quinn	Stevens	praesent.eu@google.net	587-8281	38	2021-12-12 15:13:38
20	Wang	Floyd	in.felis@hotmail.edu	746-8838	79	2022-05-26 08:14:14
21	Marsden	Kaufman	integer.in.magna@hotmail.com	1-270-944-1400	35	2022-09-20 15:46:56
22	Dale	Gregory	pede.suspendisse@yahoo.com	358-6682	20	2021-10-24 04:23:17
23	Isadora	Talley	quisque.tincidunt@aol.ca	1-692-129-6724	68	2022-05-25 05:24:34
24	Sierra	Estrada	ut.mi@protonmail.org	1-300-676-7966	31	2022-04-27 14:06:54
25	Bradley	Mcdonald	lorem.ut@outlook.org	493-1085	75	2022-08-15 13:26:26
26	Barclay	Lancaster	vel.lectus@icloud.org	1-756-719-3557	54	2022-03-02 05:08:54
27	Anthony	Logan	ultrices.posuere@outlook.net	1-724-475-4548	84	2021-10-01 07:09:34
28	Dale	Contreras	molestie.sodales@protonmail.org	1-149-279-4352	42	2022-05-19 15:40:35
29	Quintessa	James	malesuada.augue@google.net	203-7732	9	2021-11-18 10:18:11
30	Jermaine	Mills	vel.vulputate.eu@icloud.ca	417-4572	6	2022-06-30 15:13:23
31	Rahim	Snyder	sollicitudin.adipiscing.ligula@google.ca	538-3798	5	2022-08-02 03:13:45
32	Sybill	Simmons	cum.sociis.natoque@yahoo.edu	1-218-462-8633	23	2022-03-20 04:33:23
33	Buckminster	Atkins	pretium@icloud.edu	171-1728	10	2022-08-20 04:48:01
34	Cassidy	Hester	mus.proin.vel@yahoo.edu	1-887-172-4037	84	2021-11-18 06:03:11
35	Quin	Zamora	semper.cursus.integer@hotmail.org	665-1742	24	2022-01-25 21:47:40
36	Rana	Long	congue.a.aliquet@outlook.org	784-4558	29	2022-05-26 16:24:24
37	Sylvester	Herring	enim@hotmail.couk	1-969-344-1731	58	2022-01-02 03:48:59
38	Travis	Rose	interdum@icloud.net	1-943-601-8886	51	2022-06-19 22:42:25
39	Zachary	Robbins	eu.placerat.eget@outlook.com	1-417-107-1842	60	2022-07-30 13:19:19
40	Jonah	Beard	id.risus.quis@icloud.com	586-4059	86	2021-10-26 12:21:28
41	Ivan	Smith	nam.nulla@protonmail.edu	1-724-285-1746	98	2021-09-27 05:27:24
42	Warren	Shannon	molestie@google.com	1-426-789-8228	72	2021-10-26 00:35:40
43	Addison	Higgins	quis.arcu.vel@aol.ca	308-1435	15	2022-01-03 02:54:19
44	Jakeem	Chang	purus@outlook.com	666-3843	26	2022-09-14 23:43:36
45	Desiree	Santana	orci.ut@outlook.org	388-3886	79	2021-12-06 12:41:39
46	Wyatt	Alford	semper.auctor.mauris@icloud.ca	1-821-977-5763	92	2021-12-25 06:00:43
47	Nelle	Hawkins	cursus.et.eros@protonmail.edu	1-851-263-0654	72	2022-05-08 18:14:50
48	Oprah	Bernard	imperdiet.non@outlook.net	784-1361	27	2022-03-10 08:29:47
49	Mira	Hansen	consectetuer@protonmail.edu	1-567-474-8593	92	2022-07-06 05:48:00
50	Orlando	Villarreal	dictum.phasellus.in@hotmail.ca	1-644-674-5847	51	2022-09-18 05:16:51
51	Arsenio	Gray	tellus.suspendisse@protonmail.com	758-8061	73	2022-05-18 05:33:48
52	Rhoda	Page	metus.in@hotmail.couk	501-4025	69	2021-10-10 02:48:31
53	Laith	Horn	ridiculus.mus.aenean@yahoo.net	1-475-561-6745	39	2022-01-04 10:31:14
54	Latifah	Solis	aliquam@outlook.couk	548-9161	93	2021-12-31 13:30:47
55	Alfonso	Bentley	lacus.varius.et@protonmail.org	1-670-402-2565	98	2021-10-22 00:02:02
56	Daniel	Long	dolor@hotmail.ca	1-339-161-7167	60	2022-08-20 14:14:04
57	Merrill	Solomon	nibh.quisque@google.com	831-4575	81	2022-01-20 00:21:53
58	Christine	Bentley	vivamus.molestie@hotmail.net	1-916-868-4824	7	2022-03-19 22:31:54
59	Rajah	Mills	augue@yahoo.ca	614-0562	52	2021-12-29 01:10:10
60	Carol	Maldonado	scelerisque.scelerisque.dui@yahoo.com	462-2286	98	2022-02-25 20:52:28
61	Olga	Cherry	et@outlook.edu	1-278-899-3375	64	2022-01-11 03:38:14
62	Carter	Meyer	sed.dictum.eleifend@icloud.com	637-9241	41	2022-06-20 03:38:26
63	Cruz	Wright	in.faucibus@icloud.couk	1-645-625-1313	98	2021-10-10 21:33:19
64	Risa	Stewart	netus@protonmail.couk	1-393-371-6168	76	2022-04-12 03:44:13
65	Jada	Cote	risus@aol.edu	1-351-671-5441	2	2021-10-10 03:26:35
66	Garrett	Christian	nisl@protonmail.org	821-2276	37	2021-11-04 12:33:28
67	Vielka	Vaughn	rhoncus.proin@outlook.net	559-9168	30	2022-06-26 01:17:37
68	Pandora	Phelps	sed.nunc@aol.com	134-4604	87	2022-03-11 11:32:47
69	Charissa	Beck	fringilla.cursus@outlook.net	1-145-614-6377	79	2022-06-27 19:45:58
70	Chelsea	Moran	sit@google.org	1-447-287-3242	56	2021-12-12 22:25:26
71	Elton	Collins	in.lobortis@icloud.edu	1-182-474-7777	95	2022-03-26 05:42:29
72	Susan	Eaton	consequat.dolor@outlook.ca	856-5317	38	2022-01-09 06:36:46
73	Wade	Silva	sed.auctor@yahoo.org	1-729-484-1832	45	2022-02-01 13:48:42
74	Miriam	Sims	sed.libero.proin@hotmail.ca	1-860-587-6216	18	2021-11-21 06:42:42
75	Farrah	Smith	iaculis.quis.pede@google.org	1-266-460-0948	6	2022-06-09 11:15:51
76	Brett	Bullock	luctus.et@icloud.ca	549-6191	83	2022-03-25 12:34:30
77	David	Hatfield	nulla.ante@hotmail.com	937-1232	34	2021-12-16 23:16:25
78	Mannix	Head	erat@google.couk	933-5216	33	2022-02-24 00:47:12
79	Justin	Salinas	metus.vitae.velit@aol.net	1-295-242-1748	18	2022-05-09 17:55:27
80	Iona	Merritt	morbi.metus@yahoo.ca	133-0671	82	2022-07-09 22:39:52
81	Lucas	Stokes	mauris.sagittis@aol.ca	282-2682	62	2022-02-17 13:51:17
82	Claire	Young	vulputate.ullamcorper@outlook.net	939-7776	48	2022-06-26 08:43:07
83	Amal	Craig	diam.nunc.ullamcorper@aol.couk	739-2118	83	2021-09-24 20:25:27
84	Tamekah	Cabrera	morbi@aol.edu	773-9181	76	2022-06-25 19:19:24
85	Elmo	Petersen	integer.id.magna@google.couk	418-1116	100	2022-01-21 00:22:30
86	Lawrence	Hubbard	mauris@yahoo.couk	1-415-963-0391	2	2022-03-16 09:21:51
87	Clayton	Sweeney	a.purus.duis@yahoo.com	457-1781	12	2022-06-19 12:13:46
88	Imani	Collier	parturient@aol.edu	743-3868	67	2021-10-19 21:36:16
89	Russell	Graham	vestibulum.lorem.sit@hotmail.org	682-4227	54	2021-12-23 11:44:13
90	Dai	Kent	felis@outlook.ca	1-741-383-2460	54	2022-07-28 22:46:32
91	Lance	Dudley	sed.congue.elit@protonmail.org	1-511-592-8713	67	2021-11-04 13:14:03
92	Hamish	Russo	eu.neque@aol.org	1-321-328-0668	67	2022-01-06 21:39:22
93	Keelie	Edwards	congue.a.aliquet@outlook.edu	1-669-931-4478	67	2022-02-18 08:20:34
94	Aquila	Hernandez	libero.est.congue@yahoo.net	777-9338	70	2021-11-23 02:45:21
95	Josephine	Walker	mi.fringilla@protonmail.org	293-1381	65	2022-08-24 04:28:21
96	Brock	Gilliam	sociis.natoque.penatibus@yahoo.org	514-3916	7	2021-11-29 03:26:53
97	Hedda	Clements	vestibulum@aol.ca	118-6181	2	2022-02-11 21:09:47
98	Holly	Booth	morbi.accumsan.laoreet@protonmail.org	615-3375	56	2022-05-24 20:02:59
99	Erasmus	Norman	lorem.fringilla@yahoo.edu	1-721-611-4248	41	2021-11-12 12:33:09
100	Yuri	Maxwell	nec@google.com	485-9483	97	2022-02-22 13:02:36
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: serg_feo
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	https://vk.com/user/83?video=6	93	ut odio vel est tempor	2022-02-10 17:32:26	52882
2	https://vk.com/user/78?video=63	89	porttitor interdum. Sed auctor odio	2021-12-04 00:09:24	56412
3	https://vk.com/user/9?video=47	83	magna. Sed eu eros. Nam	2022-07-24 01:22:37	72216
4	https://vk.com/user/99?video=67	54	sociosqu ad litora torquent per	2022-02-03 08:28:41	96029
5	https://vk.com/user/29?video=29	5	orci luctus et ultrices posuere	2022-08-03 20:43:32	38189
6	https://vk.com/user/8?video=77	25	nec, cursus a, enim. Suspendisse	2022-04-17 17:52:34	94374
7	https://vk.com/user/7?video=33	13	mauris sapien, cursus in, hendrerit	2022-09-16 02:01:39	81979
8	https://vk.com/user/29?video=74	17	sit amet diam eu dolor	2022-08-23 21:51:50	31534
9	https://vk.com/user/67?video=28	74	dapibus gravida. Aliquam tincidunt, nunc	2021-12-04 09:18:15	14598
10	https://vk.com/user/81?video=1	80	laoreet posuere, enim nisl elementum	2022-06-26 10:41:33	61243
11	https://vk.com/user/65?video=70	53	amet, risus. Donec nibh enim,	2021-11-20 04:47:35	39579
12	https://vk.com/user/93?video=83	17	nec, leo. Morbi neque tellus,	2022-05-01 12:09:14	79949
13	https://vk.com/user/8?video=18	56	velit eget laoreet posuere, enim	2022-04-24 21:56:55	59597
14	https://vk.com/user/33?video=10	43	per inceptos hymenaeos. Mauris ut	2022-04-06 13:43:53	81835
15	https://vk.com/user/35?video=85	69	et nunc. Quisque ornare tortor	2022-02-26 16:23:03	16406
16	https://vk.com/user/90?video=30	36	velit justo nec ante. Maecenas	2022-09-22 02:15:43	47143
17	https://vk.com/user/6?video=34	24	enim, sit amet ornare lectus	2022-01-01 22:43:40	7312
18	https://vk.com/user/94?video=15	16	ac, feugiat non, lobortis quis,	2022-04-22 15:22:37	99173
19	https://vk.com/user/18?video=61	64	sed dui. Fusce aliquam, enim	2022-05-01 06:41:49	8862
20	https://vk.com/user/21?video=96	95	ipsum non arcu. Vivamus sit	2022-05-25 01:39:01	12105
21	https://vk.com/user/73?video=91	99	quam vel sapien imperdiet ornare.	2022-03-17 01:29:52	48638
22	https://vk.com/user/89?video=66	65	Nunc sed orci lobortis augue	2022-08-28 10:42:37	859
23	https://vk.com/user/77?video=98	83	In mi pede, nonummy ut,	2022-06-05 01:54:14	57513
24	https://vk.com/user/39?video=87	9	Etiam imperdiet dictum magna. Ut	2021-10-19 02:05:11	81051
25	https://vk.com/user/37?video=81	45	posuere, enim nisl elementum purus,	2022-05-11 16:26:07	85161
26	https://vk.com/user/55?video=83	31	Pellentesque ultricies dignissim lacus. Aliquam	2022-06-09 12:47:04	2566
27	https://vk.com/user/80?video=19	75	rutrum magna. Cras convallis convallis	2022-01-04 21:22:06	53552
28	https://vk.com/user/30?video=6	6	magna a tortor. Nunc commodo	2021-11-29 11:20:51	55037
29	https://vk.com/user/6?video=64	41	Sed diam lorem, auctor quis,	2021-10-13 12:39:03	36447
30	https://vk.com/user/95?video=29	57	Integer in magna. Phasellus dolor	2022-04-30 07:18:12	46050
31	https://vk.com/user/62?video=16	37	blandit viverra. Donec tempus, lorem	2022-04-24 02:07:32	37975
32	https://vk.com/user/14?video=81	87	tellus eu augue porttitor interdum.	2022-04-11 10:20:41	98177
33	https://vk.com/user/11?video=82	16	eros nec tellus. Nunc lectus	2022-08-30 21:39:52	36762
34	https://vk.com/user/28?video=57	56	eget, venenatis a, magna. Lorem	2021-10-28 03:08:52	82742
35	https://vk.com/user/96?video=11	8	urna suscipit nonummy. Fusce fermentum	2021-12-05 04:38:52	75346
36	https://vk.com/user/48?video=40	76	dis parturient montes, nascetur ridiculus	2022-07-05 02:57:27	58571
37	https://vk.com/user/43?video=10	28	scelerisque dui. Suspendisse ac metus	2022-09-06 08:34:53	6962
38	https://vk.com/user/64?video=4	33	orci quis lectus. Nullam suscipit,	2022-01-10 17:16:12	55619
39	https://vk.com/user/85?video=27	60	odio. Etiam ligula tortor, dictum	2022-01-24 14:17:14	47996
40	https://vk.com/user/33?video=99	87	Nam nulla magna, malesuada vel,	2022-07-05 02:15:46	44004
41	https://vk.com/user/65?video=4	68	elementum at, egestas a, scelerisque	2022-09-22 08:42:52	32358
42	https://vk.com/user/91?video=95	39	libero et tristique pellentesque, tellus	2022-07-03 10:42:24	73077
43	https://vk.com/user/23?video=87	34	nec orci. Donec nibh. Quisque	2021-10-24 11:34:54	8049
44	https://vk.com/user/75?video=30	45	dictum eu, eleifend nec, malesuada	2022-09-01 11:28:09	3324
45	https://vk.com/user/19?video=49	39	vel nisl. Quisque fringilla euismod	2022-03-04 06:47:20	78123
46	https://vk.com/user/28?video=46	96	lacus. Etiam bibendum fermentum metus.	2022-01-19 17:06:18	92703
47	https://vk.com/user/57?video=37	63	condimentum eget, volutpat ornare, facilisis	2022-09-19 15:16:49	96044
48	https://vk.com/user/93?video=6	11	quis urna. Nunc quis arcu	2022-04-13 04:12:34	76561
49	https://vk.com/user/72?video=9	27	nisi magna sed dui. Fusce	2021-12-04 06:46:10	46642
50	https://vk.com/user/38?video=84	88	ut ipsum ac mi eleifend	2021-11-20 04:07:21	7964
51	https://vk.com/user/52?video=96	8	condimentum. Donec at arcu. Vestibulum	2022-02-23 10:43:14	88149
52	https://vk.com/user/67?video=43	80	ac, fermentum vel, mauris. Integer	2022-05-08 14:57:03	42088
53	https://vk.com/user/84?video=78	7	felis, adipiscing fringilla, porttitor vulputate,	2022-02-16 11:09:29	82766
54	https://vk.com/user/60?video=49	7	enim. Etiam imperdiet dictum magna.	2021-10-28 04:41:45	62490
55	https://vk.com/user/20?video=21	10	pharetra nibh. Aliquam ornare, libero	2022-08-03 00:03:02	67188
56	https://vk.com/user/98?video=18	40	ligula consectetuer rhoncus. Nullam velit	2022-08-04 11:40:55	11724
57	https://vk.com/user/30?video=12	7	mauris. Suspendisse aliquet molestie tellus.	2022-06-08 03:56:59	57460
58	https://vk.com/user/78?video=38	56	vel quam dignissim pharetra. Nam	2022-08-16 15:44:05	3845
59	https://vk.com/user/19?video=3	73	mi fringilla mi lacinia mattis.	2022-07-30 14:15:01	49807
60	https://vk.com/user/67?video=4	84	augue ac ipsum. Phasellus vitae	2022-08-01 17:02:13	2874
61	https://vk.com/user/60?video=14	73	id risus quis diam luctus	2022-09-20 06:52:21	32368
62	https://vk.com/user/27?video=22	87	Phasellus in felis. Nulla tempor	2022-04-01 23:01:55	83223
63	https://vk.com/user/56?video=69	90	id magna et ipsum cursus	2022-09-11 13:34:19	87887
64	https://vk.com/user/49?video=73	95	a mi fringilla mi lacinia	2022-05-16 04:46:10	15416
65	https://vk.com/user/64?video=26	45	nunc sed libero. Proin sed	2021-10-04 05:18:04	27509
66	https://vk.com/user/6?video=61	7	sollicitudin adipiscing ligula. Aenean gravida	2022-06-28 22:43:14	22937
67	https://vk.com/user/72?video=67	47	nec, cursus a, enim. Suspendisse	2022-09-01 11:20:27	50420
68	https://vk.com/user/33?video=51	23	et malesuada fames ac turpis	2022-04-26 18:38:22	13757
69	https://vk.com/user/49?video=44	33	amet, risus. Donec nibh enim,	2022-04-16 02:49:47	98221
70	https://vk.com/user/79?video=4	91	volutpat ornare, facilisis eget, ipsum.	2021-11-22 03:51:47	32231
71	https://vk.com/user/13?video=64	89	Curabitur ut odio vel est	2021-10-16 15:45:45	2028
72	https://vk.com/user/96?video=33	88	ipsum nunc id enim. Curabitur	2022-07-04 17:11:08	42861
73	https://vk.com/user/67?video=77	32	vulputate ullamcorper magna. Sed eu	2022-07-31 20:54:22	38599
74	https://vk.com/user/36?video=34	74	dui, in sodales elit erat	2022-01-16 01:20:16	24374
75	https://vk.com/user/3?video=50	81	lorem lorem, luctus ut, pellentesque	2022-05-05 08:23:27	91218
76	https://vk.com/user/74?video=89	34	tempus mauris erat eget ipsum.	2021-11-18 14:00:23	92009
77	https://vk.com/user/53?video=11	94	molestie arcu. Sed eu nibh	2022-04-10 15:28:51	8810
78	https://vk.com/user/56?video=46	24	massa. Integer vitae nibh. Donec	2022-04-21 05:51:43	18140
79	https://vk.com/user/51?video=30	40	nec, eleifend non, dapibus rutrum,	2022-08-01 15:49:34	84714
80	https://vk.com/user/68?video=84	67	magna nec quam. Curabitur vel	2022-08-29 21:08:56	58050
81	https://vk.com/user/100?video=4	28	in consequat enim diam vel	2021-11-11 10:24:55	43971
82	https://vk.com/user/34?video=52	35	orci. Donec nibh. Quisque nonummy	2022-04-12 04:02:34	66624
83	https://vk.com/user/89?video=43	59	aliquet diam. Sed diam lorem,	2022-04-29 19:01:08	82162
84	https://vk.com/user/87?video=32	33	odio. Phasellus at augue id	2022-09-03 23:08:48	60588
85	https://vk.com/user/88?video=17	74	Duis gravida. Praesent eu nulla	2022-06-22 13:10:01	70253
86	https://vk.com/user/25?video=9	44	libero. Proin mi. Aliquam gravida	2022-03-17 17:18:58	47881
87	https://vk.com/user/95?video=22	87	ut odio vel est tempor	2022-06-21 05:33:05	60655
88	https://vk.com/user/85?video=44	97	Phasellus in felis. Nulla tempor	2022-01-07 03:18:45	98044
89	https://vk.com/user/16?video=29	82	ligula consectetuer rhoncus. Nullam velit	2022-08-02 08:43:23	59268
90	https://vk.com/user/96?video=91	69	dolor. Donec fringilla. Donec feugiat	2021-10-08 11:55:36	10763
91	https://vk.com/user/1?video=15	83	Cras vehicula aliquet libero. Integer	2022-03-26 20:54:49	48745
92	https://vk.com/user/59?video=37	72	sapien imperdiet ornare. In faucibus.	2021-12-27 05:28:31	37846
93	https://vk.com/user/55?video=20	79	in faucibus orci luctus et	2022-01-16 23:11:56	37608
94	https://vk.com/user/90?video=63	45	Proin nisl sem, consequat nec,	2021-12-20 19:13:04	69283
95	https://vk.com/user/26?video=65	98	Proin eget odio. Aliquam vulputate	2022-02-11 11:07:32	49716
96	https://vk.com/user/20?video=15	19	Lorem ipsum dolor sit amet,	2022-08-26 05:31:20	61568
97	https://vk.com/user/11?video=14	14	consectetuer euismod est arcu ac	2022-06-19 14:05:12	70713
98	https://vk.com/user/29?video=60	59	massa non ante bibendum ullamcorper.	2022-08-26 02:23:31	39797
99	https://vk.com/user/71?video=93	5	ac metus vitae velit egestas	2022-08-22 08:42:11	59582
100	https://vk.com/user/52?video=14	91	faucibus lectus, a sollicitudin orci	2022-03-18 03:37:30	21578
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: subscribe_communities_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.subscribe_communities_statuses_id_seq', 1, false);


--
-- Name: subscribe_users_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.subscribe_users_statuses_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: serg_feo
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscribe_communities subscribe_communities_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_communities
    ADD CONSTRAINT subscribe_communities_pkey PRIMARY KEY (subscriber_user_id, subscription_to_community_id);


--
-- Name: subscribe_communities_statuses subscribe_communities_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_communities_statuses
    ADD CONSTRAINT subscribe_communities_statuses_name_key UNIQUE (name);


--
-- Name: subscribe_communities_statuses subscribe_communities_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_communities_statuses
    ADD CONSTRAINT subscribe_communities_statuses_pkey PRIMARY KEY (id);


--
-- Name: subscribe_users subscribe_users_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_users
    ADD CONSTRAINT subscribe_users_pkey PRIMARY KEY (subscriber_user_id, subscription_to_user_id);


--
-- Name: subscribe_users_statuses subscribe_users_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_users_statuses
    ADD CONSTRAINT subscribe_users_statuses_name_key UNIQUE (name);


--
-- Name: subscribe_users_statuses subscribe_users_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.subscribe_users_statuses
    ADD CONSTRAINT subscribe_users_statuses_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: serg_feo
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
