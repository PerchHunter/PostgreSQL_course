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

--
-- Name: business_trips_type; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.business_trips_type AS ENUM (
    'Никогда',
    'Готов',
    'Иногда'
);


ALTER TYPE public.business_trips_type OWNER TO hh_admin;

--
-- Name: busyness_type; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.busyness_type AS ENUM (
    'Полная занятость',
    'Частичная занятость',
    'Проектная работа',
    'Волонтерство',
    'Стажировка'
);


ALTER TYPE public.busyness_type OWNER TO hh_admin;

--
-- Name: education_level_type; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.education_level_type AS ENUM (
    '',
    'Среднее',
    'Среднее специальное',
    'Неоконченное высшее',
    'Высшее',
    'Бакалавр',
    'Магистр',
    'Кандидат наук',
    'Доктор наук'
);


ALTER TYPE public.education_level_type OWNER TO hh_admin;

--
-- Name: gender_type; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.gender_type AS ENUM (
    'Мужской',
    'Женский'
);


ALTER TYPE public.gender_type OWNER TO hh_admin;

--
-- Name: lang_level; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.lang_level AS ENUM (
    'A1 - начальный',
    'A2 -  элементарный',
    'B1 - средний',
    'B2 - средне-продвинутый',
    'C1 - продвинутый',
    'С2 - в совершенстве'
);


ALTER TYPE public.lang_level OWNER TO hh_admin;

--
-- Name: movement_type; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.movement_type AS ENUM (
    'Невозможен',
    'Желателен',
    'Возможен'
);


ALTER TYPE public.movement_type OWNER TO hh_admin;

--
-- Name: work_shedule_type; Type: TYPE; Schema: public; Owner: hh_admin
--

CREATE TYPE public.work_shedule_type AS ENUM (
    'Полный день',
    'Сменный график',
    'Гибкий график',
    'Удаленная работа',
    'Вахтовый метод'
);


ALTER TYPE public.work_shedule_type OWNER TO hh_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: busyness; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.busyness (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.busyness OWNER TO hh_admin;

--
-- Name: busyness_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.busyness_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.busyness_id_seq OWNER TO hh_admin;

--
-- Name: busyness_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.busyness_id_seq OWNED BY public.busyness.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO hh_admin;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO hh_admin;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: employee_responses; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.employee_responses (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    job_opening_id integer NOT NULL,
    employer_feedback_id integer DEFAULT 1 NOT NULL,
    response_time timestamp without time zone NOT NULL
);


ALTER TABLE public.employee_responses OWNER TO hh_admin;

--
-- Name: employee_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.employee_responses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_responses_id_seq OWNER TO hh_admin;

--
-- Name: employee_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.employee_responses_id_seq OWNED BY public.employee_responses.id;


--
-- Name: employer_feedbacks; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.employer_feedbacks (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.employer_feedbacks OWNER TO hh_admin;

--
-- Name: employer_feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.employer_feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employer_feedbacks_id_seq OWNER TO hh_admin;

--
-- Name: employer_feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.employer_feedbacks_id_seq OWNED BY public.employer_feedbacks.id;


--
-- Name: employers; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.employers (
    id integer NOT NULL,
    name character varying(250) DEFAULT 'Название не указано'::character varying NOT NULL,
    photo_url character varying(250) DEFAULT NULL::character varying,
    description text NOT NULL,
    rating real,
    industry_id integer NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.employers OWNER TO hh_admin;

--
-- Name: employers_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.employers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employers_id_seq OWNER TO hh_admin;

--
-- Name: employers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.employers_id_seq OWNED BY public.employers.id;


--
-- Name: industries; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.industries (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.industries OWNER TO hh_admin;

--
-- Name: industries_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.industries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.industries_id_seq OWNER TO hh_admin;

--
-- Name: industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.industries_id_seq OWNED BY public.industries.id;


--
-- Name: job_openings; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.job_openings (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    "position" character varying(250) NOT NULL,
    salary integer NOT NULL,
    work_experience_id integer NOT NULL,
    work_shedule_id integer NOT NULL,
    busyness_id integer NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.job_openings OWNER TO hh_admin;

--
-- Name: job_openings_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.job_openings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_openings_id_seq OWNER TO hh_admin;

--
-- Name: job_openings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.job_openings_id_seq OWNED BY public.job_openings.id;


--
-- Name: mailing_and_notifications; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.mailing_and_notifications (
    worker_id integer NOT NULL,
    alerts_and_tips boolean DEFAULT true NOT NULL,
    news_and_advertising boolean DEFAULT true NOT NULL,
    new_vacancies boolean DEFAULT true NOT NULL,
    birthday_greetings boolean DEFAULT true NOT NULL,
    daily_notification_of_resume_views boolean DEFAULT true NOT NULL,
    instant_notifications_of_resume_views boolean DEFAULT true NOT NULL,
    internships boolean DEFAULT true NOT NULL,
    auto_search_for_vacancies boolean DEFAULT true NOT NULL,
    job_invitations boolean DEFAULT true NOT NULL,
    correspondence_with_the_employer boolean DEFAULT true NOT NULL
);


ALTER TABLE public.mailing_and_notifications OWNER TO hh_admin;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    employer_id integer NOT NULL,
    body text NOT NULL,
    is_delivered boolean,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO hh_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO hh_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.regions OWNER TO hh_admin;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO hh_admin;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: resume_busyness; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_busyness (
    id integer NOT NULL,
    busyness_id integer NOT NULL,
    resume_id integer NOT NULL
);


ALTER TABLE public.resume_busyness OWNER TO hh_admin;

--
-- Name: resume_busyness_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.resume_busyness_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resume_busyness_id_seq OWNER TO hh_admin;

--
-- Name: resume_busyness_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.resume_busyness_id_seq OWNED BY public.resume_busyness.id;


--
-- Name: resume_education; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_education (
    resume_id integer NOT NULL,
    level public.education_level_type,
    educational_institution character varying(250) NOT NULL,
    faculty character varying(250) NOT NULL,
    specialization character varying(250) NOT NULL,
    year_of_graduation smallint NOT NULL
);


ALTER TABLE public.resume_education OWNER TO hh_admin;

--
-- Name: resume_electronic_certificates; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_electronic_certificates (
    resume_id integer NOT NULL,
    name character varying(250) NOT NULL,
    url character varying(250) NOT NULL,
    specialization character varying(250) NOT NULL,
    year_of_receipt smallint NOT NULL
);


ALTER TABLE public.resume_electronic_certificates OWNER TO hh_admin;

--
-- Name: resume_languages; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_languages (
    resume_id integer NOT NULL,
    language character varying(50) NOT NULL,
    level public.lang_level DEFAULT 'A1 - начальный'::public.lang_level
);


ALTER TABLE public.resume_languages OWNER TO hh_admin;

--
-- Name: resume_personal_info; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_personal_info (
    resume_id integer NOT NULL,
    worker_name character varying(50) DEFAULT NULL::character varying,
    worker_surname character varying(50) DEFAULT NULL::character varying,
    worker_patronymic character varying(50) DEFAULT NULL::character varying,
    date_of_birth date,
    gender public.gender_type DEFAULT 'Мужской'::public.gender_type NOT NULL,
    city_of_residence integer,
    movement public.movement_type DEFAULT 'Невозможен'::public.movement_type NOT NULL,
    readiness_for_business_trips public.business_trips_type DEFAULT 'Никогда'::public.business_trips_type NOT NULL
);


ALTER TABLE public.resume_personal_info OWNER TO hh_admin;

--
-- Name: resume_portfolio; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_portfolio (
    resume_id integer NOT NULL,
    url_files character varying(250)[]
);


ALTER TABLE public.resume_portfolio OWNER TO hh_admin;

--
-- Name: resume_position_and_salary; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_position_and_salary (
    resume_id integer NOT NULL,
    "position" character varying(250) DEFAULT NULL::character varying,
    specialization_id integer,
    salary real,
    busyness public.busyness_type,
    work_shedule public.work_shedule_type
);


ALTER TABLE public.resume_position_and_salary OWNER TO hh_admin;

--
-- Name: resume_tests_and_exams; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_tests_and_exams (
    resume_id integer NOT NULL,
    education_institution character varying(250) NOT NULL,
    organization_that_conducted character varying(250) NOT NULL,
    specialization character varying(250) NOT NULL,
    year_of_completion smallint NOT NULL
);


ALTER TABLE public.resume_tests_and_exams OWNER TO hh_admin;

--
-- Name: resume_work_shedule; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.resume_work_shedule (
    id integer NOT NULL,
    shedule_id integer NOT NULL,
    resume_id integer NOT NULL
);


ALTER TABLE public.resume_work_shedule OWNER TO hh_admin;

--
-- Name: resume_work_shedule_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.resume_work_shedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resume_work_shedule_id_seq OWNER TO hh_admin;

--
-- Name: resume_work_shedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.resume_work_shedule_id_seq OWNED BY public.resume_work_shedule.id;


--
-- Name: reviews_of_employers; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.reviews_of_employers (
    id integer NOT NULL,
    employer_id integer NOT NULL,
    vacancy_name character varying(250) NOT NULL,
    total_score_for_review real NOT NULL,
    positive text,
    negative text,
    working_conditions_stars smallint NOT NULL,
    group_stars smallint NOT NULL,
    guide_stars smallint NOT NULL,
    growth_opportunities_stars smallint NOT NULL,
    conditions_for_recretions_stars smallint NOT NULL,
    income_level_stars smallint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reviews_of_employers OWNER TO hh_admin;

--
-- Name: reviews_of_employers_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.reviews_of_employers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_of_employers_id_seq OWNER TO hh_admin;

--
-- Name: reviews_of_employers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.reviews_of_employers_id_seq OWNED BY public.reviews_of_employers.id;


--
-- Name: specializations; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.specializations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    industry_id integer NOT NULL
);


ALTER TABLE public.specializations OWNER TO hh_admin;

--
-- Name: specializations_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.specializations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specializations_id_seq OWNER TO hh_admin;

--
-- Name: specializations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.specializations_id_seq OWNED BY public.specializations.id;


--
-- Name: visibility_resume; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.visibility_resume (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.visibility_resume OWNER TO hh_admin;

--
-- Name: visibility_resume_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.visibility_resume_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visibility_resume_id_seq OWNER TO hh_admin;

--
-- Name: visibility_resume_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.visibility_resume_id_seq OWNED BY public.visibility_resume.id;


--
-- Name: work_experience; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.work_experience (
    id integer NOT NULL,
    experience character varying(50) NOT NULL
);


ALTER TABLE public.work_experience OWNER TO hh_admin;

--
-- Name: work_experience_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.work_experience_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_experience_id_seq OWNER TO hh_admin;

--
-- Name: work_experience_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.work_experience_id_seq OWNED BY public.work_experience.id;


--
-- Name: work_shedule; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.work_shedule (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.work_shedule OWNER TO hh_admin;

--
-- Name: work_shedule_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.work_shedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_shedule_id_seq OWNER TO hh_admin;

--
-- Name: work_shedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.work_shedule_id_seq OWNED BY public.work_shedule.id;


--
-- Name: workers; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.workers (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    telephone numeric NOT NULL,
    created_at timestamp without time zone NOT NULL,
    job_search_area_id smallint
);


ALTER TABLE public.workers OWNER TO hh_admin;

--
-- Name: workers_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.workers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workers_id_seq OWNER TO hh_admin;

--
-- Name: workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.workers_id_seq OWNED BY public.workers.id;


--
-- Name: workers_resume; Type: TABLE; Schema: public; Owner: hh_admin
--

CREATE TABLE public.workers_resume (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    photo_url character varying(250) DEFAULT NULL::character varying,
    info text,
    availability_of_car boolean DEFAULT false NOT NULL,
    drivers_lisense character varying(2)[] DEFAULT NULL::character varying[],
    native_language character varying(50) DEFAULT NULL::character varying,
    visibility_id integer DEFAULT 5 NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.workers_resume OWNER TO hh_admin;

--
-- Name: workers_resume_id_seq; Type: SEQUENCE; Schema: public; Owner: hh_admin
--

CREATE SEQUENCE public.workers_resume_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workers_resume_id_seq OWNER TO hh_admin;

--
-- Name: workers_resume_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hh_admin
--

ALTER SEQUENCE public.workers_resume_id_seq OWNED BY public.workers_resume.id;


--
-- Name: busyness id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.busyness ALTER COLUMN id SET DEFAULT nextval('public.busyness_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: employee_responses id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employee_responses ALTER COLUMN id SET DEFAULT nextval('public.employee_responses_id_seq'::regclass);


--
-- Name: employer_feedbacks id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employer_feedbacks ALTER COLUMN id SET DEFAULT nextval('public.employer_feedbacks_id_seq'::regclass);


--
-- Name: employers id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employers ALTER COLUMN id SET DEFAULT nextval('public.employers_id_seq'::regclass);


--
-- Name: industries id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.industries ALTER COLUMN id SET DEFAULT nextval('public.industries_id_seq'::regclass);


--
-- Name: job_openings id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.job_openings ALTER COLUMN id SET DEFAULT nextval('public.job_openings_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: resume_busyness id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_busyness ALTER COLUMN id SET DEFAULT nextval('public.resume_busyness_id_seq'::regclass);


--
-- Name: resume_work_shedule id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_work_shedule ALTER COLUMN id SET DEFAULT nextval('public.resume_work_shedule_id_seq'::regclass);


--
-- Name: reviews_of_employers id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.reviews_of_employers ALTER COLUMN id SET DEFAULT nextval('public.reviews_of_employers_id_seq'::regclass);


--
-- Name: specializations id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.specializations ALTER COLUMN id SET DEFAULT nextval('public.specializations_id_seq'::regclass);


--
-- Name: visibility_resume id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.visibility_resume ALTER COLUMN id SET DEFAULT nextval('public.visibility_resume_id_seq'::regclass);


--
-- Name: work_experience id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.work_experience ALTER COLUMN id SET DEFAULT nextval('public.work_experience_id_seq'::regclass);


--
-- Name: work_shedule id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.work_shedule ALTER COLUMN id SET DEFAULT nextval('public.work_shedule_id_seq'::regclass);


--
-- Name: workers id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers ALTER COLUMN id SET DEFAULT nextval('public.workers_id_seq'::regclass);


--
-- Name: workers_resume id; Type: DEFAULT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers_resume ALTER COLUMN id SET DEFAULT nextval('public.workers_resume_id_seq'::regclass);


--
-- Data for Name: busyness; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.busyness (id, name) FROM stdin;
1	Полная занятость
2	Частичная занятость
3	Проектная работа/разовое задание
4	Волонтерство
5	Стажировка
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.cities (id, name, region_id) FROM stdin;
1	Москва	38
2	Санкт-Петербург	21
3	Новосибирск	8
4	Екатеринбург	75
5	Казань	12
6	Нижний Новгород	15
7	Челябинск	68
8	Красноярск	18
9	Самара	65
10	Уфа	49
12	Омск	13
13	Краснодар	28
14	Воронеж	79
15	Пермь	59
16	Волгоград	1
17	Саратов	26
18	Тюмень	60
19	Тольятти	62
20	Барнаул	69
21	Ижевск	63
22	Махачкала	4
23	Хабаровск	19
24	Ульяновск	78
25	Иркутск	63
26	Владивосток	53
27	Ярославль	5
28	Кемерово	11
29	Томск	64
30	Набережные Челны	67
31	Севастополь	27
32	Ставрополь	75
33	Оренбург	16
34	Новокузнецк	38
35	Рязань	53
36	Балашиха	33
37	Пенза	38
38	Чебоксары	79
39	Липецк	29
40	Калининград	65
41	Астрахань	23
42	Тула	40
43	Киров	14
44	Сочи	32
45	Курск	3
46	Улан-Удэ	25
47	Тверь	47
48	Магнитогорск	79
49	Сургут	75
50	Брянск	28
51	Иваново	20
52	Якутск	40
53	Владимир	17
54	Симферополь	10
55	Белгород	71
56	Нижний Тагил	68
57	Калуга	61
58	Чита	58
59	Грозный	72
60	Волжский	21
61	Смоленск	40
62	Подольск	66
63	Саранск	50
64	Вологда	38
65	Курган	57
66	Череповец	60
67	Орел	21
68	Архангельск	61
69	Владикавказ	57
70	Нижневартовск	40
71	Йошкар-Ола	56
72	Стерлитамак	42
73	Мурманск	40
74	Кострома	6
75	Новороссийск	81
76	Тамбов	62
77	Химки	43
78	Мытищи	72
79	Нальчик	19
80	Таганрог	82
81	Нижнекамск	40
82	Благовещенск	81
83	Комсомольск-на-Амуре	7
84	Петрозаводск	39
85	Королев	39
86	Великий Новгород	28
87	Люберцы	5
88	Братск	29
89	Старый Оскол	55
90	Ангарск	73
91	Сыктывкар	76
92	Дзержинск	72
93	Псков	19
94	Орск	74
95	Красногорск	14
96	Армавир	51
97	Абакан	81
98	Балаково	4
99	Бийск	20
100	Южно-Сахалинск	36
11	Ростов-на-Дону	82
\.


--
-- Data for Name: employee_responses; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.employee_responses (id, worker_id, job_opening_id, employer_feedback_id, response_time) FROM stdin;
1	57	3	2	2021-09-24 18:35:55
2	43	12	1	2022-10-08 22:55:32
3	50	15	3	2021-10-07 00:02:36
4	69	98	2	2022-01-15 06:36:51
5	93	4	2	2022-01-27 18:49:30
6	64	53	3	2022-04-28 00:52:58
7	25	13	2	2022-03-09 12:17:30
8	26	31	2	2022-09-27 00:34:26
9	51	75	2	2022-08-02 10:48:34
10	48	50	1	2022-01-08 08:36:15
11	9	93	2	2021-11-20 00:28:30
12	74	59	3	2022-06-13 20:40:28
13	65	56	1	2022-09-05 06:41:53
14	78	20	2	2022-06-22 19:44:16
15	73	23	1	2021-07-07 21:05:19
16	84	81	1	2022-08-02 12:18:22
17	15	9	2	2021-12-04 04:17:30
18	70	44	2	2022-04-23 14:28:32
19	76	18	2	2022-06-11 07:16:24
20	65	90	3	2022-09-02 01:27:05
21	60	61	3	2022-02-01 15:23:19
22	26	73	2	2021-08-11 08:09:07
23	78	31	2	2021-09-17 22:09:03
24	14	15	2	2022-07-23 14:23:42
25	12	77	1	2022-08-02 21:15:43
26	77	50	2	2022-07-24 15:22:30
27	11	44	2	2021-08-12 00:05:28
28	79	66	2	2022-06-01 21:23:48
29	72	27	1	2022-01-21 07:16:33
30	97	73	2	2021-08-19 11:55:38
31	26	35	3	2022-08-23 01:03:20
32	42	10	2	2022-05-29 15:07:36
33	35	63	1	2022-08-11 21:21:38
34	9	19	2	2022-03-21 12:54:14
35	7	32	3	2021-07-25 15:14:15
36	52	95	2	2022-06-12 12:02:42
37	72	66	3	2021-12-30 05:10:26
38	24	57	2	2022-09-05 00:36:39
39	78	52	1	2022-06-17 21:27:50
40	52	59	2	2022-06-15 11:57:25
41	92	6	1	2021-08-24 23:54:03
42	30	23	2	2022-08-30 06:57:12
43	86	83	2	2022-04-26 10:41:28
44	19	91	1	2021-10-05 04:34:09
45	29	72	2	2021-11-03 21:17:39
46	76	92	1	2021-11-17 04:07:05
47	48	15	2	2022-08-24 05:29:21
48	50	42	2	2022-03-01 00:52:18
49	30	53	3	2022-01-15 02:38:52
50	17	79	2	2022-01-09 00:07:15
51	82	92	2	2022-02-17 10:49:27
52	44	8	3	2022-01-10 23:49:57
53	7	61	2	2021-08-21 21:28:18
54	15	86	3	2021-10-05 16:44:04
55	60	83	2	2021-09-16 14:01:59
56	31	67	1	2022-09-29 23:03:54
57	12	38	1	2021-09-23 20:33:36
58	62	85	2	2021-09-21 18:58:58
59	70	37	1	2022-09-28 02:29:33
60	16	68	2	2022-04-19 03:23:20
61	80	76	2	2022-09-27 20:10:20
62	83	12	2	2022-05-14 14:23:13
63	64	70	1	2022-09-07 07:42:17
64	82	51	1	2022-04-25 06:55:55
65	65	97	3	2021-08-24 18:17:56
66	9	47	1	2021-09-16 21:53:32
67	71	72	1	2021-11-22 07:16:48
68	6	96	2	2022-08-22 17:34:23
69	73	91	3	2022-06-13 08:08:02
70	45	3	2	2022-04-11 02:22:22
71	66	59	3	2021-09-27 10:19:11
72	85	77	3	2022-06-30 14:15:47
73	53	94	3	2022-03-12 03:53:47
74	44	9	2	2022-07-04 04:41:52
75	79	71	2	2022-05-08 15:51:55
76	87	43	2	2021-10-30 19:04:19
77	23	14	2	2022-07-10 04:24:08
78	7	13	2	2021-11-02 02:18:42
79	78	8	2	2022-04-19 10:49:31
80	67	88	3	2022-08-15 21:14:37
81	37	26	3	2021-09-13 16:35:49
82	7	46	1	2022-10-09 23:12:18
83	65	92	2	2021-12-16 23:12:13
84	84	3	2	2021-09-07 16:34:40
85	35	69	2	2022-08-21 18:25:58
86	75	13	3	2022-06-24 15:35:44
87	27	66	3	2021-10-13 14:50:05
88	60	39	1	2021-08-07 08:15:14
89	86	67	3	2021-10-15 20:49:23
90	55	25	1	2022-02-28 22:46:05
91	31	3	1	2021-07-07 19:56:56
92	33	68	3	2022-02-15 13:20:35
93	40	91	2	2021-09-30 15:07:40
94	78	76	2	2022-09-05 02:24:06
95	60	10	3	2021-09-07 13:26:55
96	41	42	1	2021-08-25 18:14:47
97	67	36	3	2022-03-25 05:40:08
98	4	41	2	2021-09-21 02:56:28
99	50	54	2	2022-03-20 13:50:44
100	81	65	2	2021-10-10 23:31:53
\.


--
-- Data for Name: employer_feedbacks; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.employer_feedbacks (id, name) FROM stdin;
1	В  ожидании
2	Приглашение
3	Отказ
\.


--
-- Data for Name: employers; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.employers (id, name, photo_url, description, rating, industry_id, city_id) FROM stdin;
1	enim commodo hendrerit. Donec	instagram.com?page=1&offset=1	Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.	2	14	9
2	cursus in,	walmart.com?g=1	purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula	4	11	31
3	Curae Phasellus ornare.	netflix.com?ad=115	metus sit amet ante. Vivamus non lorem vitae odio sagittis	3	13	80
4	accumsan interdum libero	whatsapp.com?ab=441&aad=2	nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem	4	8	57
5	Ut tincidunt vehicula risus.	facebook.com?gi=100	Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada	1	10	70
6	Donec tempor, est ac	wikipedia.org?p=8	Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis	0	5	34
7	in, hendrerit	twitter.com?q=0	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit	2	2	21
8	Mauris ut quam vel	walmart.com?search=1	diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est	3	10	13
9	faucibus id, libero. Donec	facebook.com?q=4	et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	3	7	8
10	metus. Aenean sed	walmart.com?client=g	et nunc. Quisque ornare tortor at risus. Nunc ac sem	2	10	37
11	Curabitur dictum. Phasellus	twitter.com?ad=115	orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras	4	10	12
12	tellus eu augue porttitor	youtube.com?ab=441&aad=2	sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo	2	4	79
13	nisi. Aenean	naver.com?q=0	sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam	5	2	69
14	sed sem egestas blandit.	bbc.co.uk?gi=100	Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci	4	13	41
15	imperdiet ullamcorper.	reddit.com?client=g	rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	2	10	36
16	accumsan neque et nunc.	wikipedia.org?ab=441&aad=2	augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum.	3	7	14
17	ligula. Aenean gravida	youtube.com?p=8	ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,	3	6	65
18	turpis egestas. Aliquam fringilla	reddit.com?ab=441&aad=2	augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed,	3	5	32
19	eros nec tellus.	wikipedia.org?q=test	ante ipsum primis in faucibus orci luctus et ultrices posuere	0	10	34
20	malesuada fames ac	google.com?ab=441&aad=2	ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra	1	2	63
21	vel, convallis	zoom.us?g=1	enim diam vel arcu. Curabitur ut odio vel est tempor	3	10	22
22	Aenean euismod mauris eu	zoom.us?q=4	feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc,	1	6	64
23	Phasellus elit	instagram.com?k=0	in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan	3	15	58
24	commodo ipsum. Suspendisse	yahoo.com?page=1&offset=1	ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt	1	6	12
25	pede. Cum	bbc.co.uk?ab=441&aad=2	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi	1	8	24
26	vulputate, nisi sem semper	netflix.com?gi=100	tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio.	1	1	66
27	Morbi sit amet	instagram.com?str=se	velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas	3	2	59
28	nisl. Nulla eu neque	youtube.com?search=1	ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,	4	8	8
29	Quisque purus	baidu.com?ad=115	Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus	2	7	68
30	augue malesuada malesuada.	instagram.com?page=1&offset=1	fermentum risus, at fringilla purus mauris a nunc. In at	1	11	12
31	mi. Aliquam gravida mauris	ebay.com?page=1&offset=1	elementum sem, vitae aliquam eros turpis non enim. Mauris quis	3	11	7
32	dictum sapien. Aenean	facebook.com?g=1	imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus.	0	8	40
33	arcu iaculis	pinterest.com?q=4	Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,	4	10	24
34	Curabitur massa.	google.com?q=test	Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus,	2	13	32
35	odio a purus.	nytimes.com?search=1&q=de	Sed neque. Sed eget lacus. Mauris non dui nec urna	2	2	4
36	Nunc pulvinar arcu	twitter.com?q=0	eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris	4	6	79
37	quam. Curabitur vel	netflix.com?search=1	aliquet, metus urna convallis erat, eget tincidunt dui augue eu	4	8	76
38	leo, in lobortis tellus	nytimes.com?page=1&offset=1	vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis.	0	11	56
39	Aliquam ornare, libero	nytimes.com?q=test	est arcu ac orci. Ut semper pretium neque. Morbi quis	4	7	16
40	imperdiet dictum magna. Ut	cnn.com?q=test	Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula	1	3	78
41	erat. Vivamus nisi.	cnn.com?client=g	nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus	3	10	76
42	diam lorem,	wikipedia.org?g=1	nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat	0	9	29
43	penatibus et magnis	cnn.com?ad=115	diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent	2	12	57
44	est, vitae sodales nisi	baidu.com?k=0	dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,	0	12	50
45	Proin non	ebay.com?q=0	dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et	2	9	77
46	In faucibus. Morbi	guardian.co.uk?q=test	consectetuer euismod est arcu ac orci. Ut semper pretium neque.	1	10	46
47	scelerisque dui. Suspendisse ac	guardian.co.uk?ab=441&aad=2	Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci	3	13	36
48	porttitor scelerisque neque.	yahoo.com?q=4	Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac	2	11	57
49	a, malesuada id,	ebay.com?q=test	bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna	2	6	28
50	imperdiet ullamcorper. Duis	facebook.com?q=4	Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam	2	3	2
51	non, dapibus	cnn.com?search=1	hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida	1	2	70
52	netus et malesuada	guardian.co.uk?q=test	adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl	1	7	67
53	accumsan neque	facebook.com?gi=100	et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	4	7	28
54	non, feugiat nec,	walmart.com?search=1	erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.	2	4	75
55	ante. Vivamus non	wikipedia.org?q=4	Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc	4	14	37
56	orci lacus vestibulum	ebay.com?g=1	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue	1	6	21
57	nulla ante, iaculis nec,	naver.com?k=0	nulla. In tincidunt congue turpis. In condimentum. Donec at arcu.	4	8	20
58	lacus. Quisque imperdiet,	walmart.com?k=0	quis diam. Pellentesque habitant morbi tristique senectus et netus et	5	10	3
59	a tortor. Nunc commodo	nytimes.com?p=8	rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,	0	7	58
60	Nullam velit dui,	zoom.us?q=11	Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque	4	15	29
61	ipsum dolor sit amet,	instagram.com?ab=441&aad=2	nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et	0	7	73
62	turpis. Nulla aliquet.	yahoo.com?q=11	Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,	5	13	73
63	sed dolor. Fusce	reddit.com?p=8	Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus,	2	11	23
64	ac mattis velit	ebay.com?g=1	Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi,	2	10	5
65	dolor dapibus gravida.	whatsapp.com?q=test	feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare,	1	12	5
66	quam. Pellentesque habitant morbi	pinterest.com?ab=441&aad=2	aliquet vel, vulputate eu, odio. Phasellus at augue id ante	0	12	2
67	tellus justo sit amet	zoom.us?q=11	velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices.	2	2	10
68	faucibus lectus, a	yahoo.com?q=11	amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor	3	13	25
69	eget, ipsum. Donec	twitter.com?p=8	facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa.	0	3	55
70	feugiat nec, diam.	zoom.us?search=1	dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui.	0	7	4
71	vehicula et, rutrum	netflix.com?q=test	lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,	3	9	46
72	eget, ipsum. Donec	whatsapp.com?search=1&q=de	ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida	4	13	42
73	nisl. Nulla eu	bbc.co.uk?str=se	nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,	1	13	34
74	Integer vitae nibh.	netflix.com?q=test	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit	4	15	11
75	felis. Donec tempor,	bbc.co.uk?ab=441&aad=2	sed pede. Cum sociis natoque penatibus et magnis dis parturient	1	13	36
76	pede nec ante	facebook.com?q=4	semper egestas, urna justo faucibus lectus, a sollicitudin orci sem	4	11	41
77	luctus sit amet, faucibus	google.com?q=11	non quam. Pellentesque habitant morbi tristique senectus et netus et	4	7	26
78	Fusce dolor quam,	whatsapp.com?gi=100	arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing.	5	9	67
79	per inceptos	facebook.com?page=1&offset=1	sem mollis dui, in sodales elit erat vitae risus. Duis	4	8	75
80	convallis erat,	yahoo.com?search=1	vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros	5	12	11
81	eu, ligula.	naver.com?q=test	faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend.	4	11	71
82	varius ultrices, mauris	nytimes.com?ad=115	et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.	3	14	15
83	Aliquam tincidunt, nunc	whatsapp.com?p=8	mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.	1	3	40
84	mauris eu elit. Nulla	whatsapp.com?q=4	Praesent eu dui. Cum sociis natoque penatibus et magnis dis	3	14	23
85	in faucibus	netflix.com?page=1&offset=1	metus eu erat semper rutrum. Fusce dolor quam, elementum at,	1	9	51
86	ullamcorper, nisl arcu	ebay.com?str=se	ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo	4	5	23
87	Proin ultrices. Duis	google.com?q=0	Class aptent taciti sociosqu ad litora torquent per conubia nostra,	0	2	28
88	iaculis quis, pede.	whatsapp.com?page=1&offset=1	lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in	1	15	80
89	varius ultrices, mauris	baidu.com?search=1&q=de	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu,	0	10	26
90	at auctor	nytimes.com?q=4	Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.	5	7	80
91	magna. Sed eu eros.	twitter.com?p=8	dui. Cum sociis natoque penatibus et magnis dis parturient montes,	0	6	45
92	adipiscing ligula. Aenean	zoom.us?gi=100	tortor at risus. Nunc ac sem ut dolor dapibus gravida.	4	8	41
93	Nunc ut erat.	facebook.com?str=se	sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy	4	9	30
94	mauris blandit	reddit.com?search=1	montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque	3	6	20
95	nec ante. Maecenas	baidu.com?p=8	in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum	4	13	60
96	pede. Cras vulputate	walmart.com?ad=115	eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc	1	15	15
97	mi eleifend egestas. Sed	google.com?q=0	cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,	3	8	31
98	et, lacinia vitae, sodales	cnn.com?q=11	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit	1	7	11
99	lacus. Quisque	cnn.com?q=4	nisi. Cum sociis natoque penatibus et magnis dis parturient montes,	1	8	27
100	amet ante. Vivamus	reddit.com?ab=441&aad=2	nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis	1	4	11
\.


--
-- Data for Name: industries; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.industries (id, name) FROM stdin;
1	Автомобильный бизнес
2	Гостиницы, рестораны, общепит, кейтеринг
3	Государственные организации
4	Добывающая отрасль
5	ЖКХ
6	Информационные технологии, системная интеграция, интернет
7	Искусство, культура
8	Лесная промышленность, деревообработка
9	Медицина, фармацевтика, аптеки
10	Металлургия, металлообработка
11	Нефть и газ
12	Образовательные учреждения
13	Общественная деятельность, партии, благотворительность, НКО
14	Перевозки, логистика, склад, ВЭД
15	Продукты питания
\.


--
-- Data for Name: job_openings; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.job_openings (id, employer_id, "position", salary, work_experience_id, work_shedule_id, busyness_id, description, created_at) FROM stdin;
1	7	nisi. Cum sociis	9683	2	1	2	Pellentesque habitant morbi tristique senectus	2022-01-19 04:26:04
2	7	In nec orci. Donec nibh. Quisque	1945	4	4	2	nunc. In at pede. Cras vulputate velit eu	2022-01-08 04:42:25
3	79	metus. Aenean	9201	4	5	5	eget varius ultrices, mauris ipsum porta elit, a feugiat	2022-07-05 17:32:08
4	35	adipiscing ligula. Aenean gravida nunc sed pede.	7672	3	4	3	senectus et netus et malesuada fames ac turpis egestas.	2022-06-10 12:05:37
5	80	dictum. Phasellus in felis. Nulla tempor augue	8760	2	3	2	ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae,	2022-03-30 09:10:09
6	49	erat nonummy ultricies ornare,	245	1	1	5	ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor	2022-06-17 09:37:39
7	78	eu, ligula. Aenean euismod mauris	2167	2	3	4	Quisque porttitor eros nec tellus. Nunc lectus	2021-07-16 02:15:46
8	20	amet, risus. Donec nibh	8476	3	2	1	In nec orci. Donec nibh. Quisque nonummy	2021-11-09 10:13:55
9	28	erat volutpat. Nulla	8662	4	3	3	ornare sagittis felis. Donec tempor, est ac mattis	2022-05-29 19:42:23
10	30	vitae erat vel pede blandit congue.	6311	1	2	4	Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in	2022-07-29 13:27:12
11	19	vitae velit	3070	2	2	2	vestibulum lorem, sit amet ultricies sem magna nec quam.	2022-05-20 14:20:17
12	37	facilisis facilisis, magna tellus faucibus	4812	5	1	3	arcu imperdiet ullamcorper. Duis at lacus. Quisque	2022-05-22 19:01:52
13	46	lectus sit amet luctus vulputate,	5564	1	4	5	nisl sem, consequat nec,	2022-03-27 02:07:43
14	20	ullamcorper, velit in aliquet lobortis,	7401	2	2	5	venenatis a, magna. Lorem ipsum dolor sit amet,	2022-06-10 19:23:28
15	16	in sodales elit	1844	3	1	2	adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis	2022-02-05 21:26:13
16	94	ut dolor dapibus gravida. Aliquam tincidunt,	751	5	1	2	est ac mattis semper, dui lectus rutrum	2021-11-30 12:30:11
17	13	augue, eu tempor erat neque non quam.	9147	4	2	2	arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum	2022-07-01 20:53:22
18	69	vestibulum nec, euismod in, dolor.	4187	2	3	2	consequat, lectus sit amet luctus vulputate, nisi sem semper erat,	2022-09-24 15:26:02
19	99	bibendum. Donec	3529	4	5	1	tincidunt nibh. Phasellus nulla. Integer vulputate, risus	2022-03-25 05:33:32
20	50	dapibus rutrum, justo. Praesent luctus. Curabitur egestas	2424	3	4	2	iaculis, lacus pede sagittis augue,	2021-10-21 03:43:47
21	62	diam dictum	8720	5	2	1	montes, nascetur ridiculus mus.	2022-01-29 23:07:22
22	10	Proin ultrices. Duis volutpat nunc sit	4545	2	4	3	egestas. Duis ac arcu. Nunc mauris. Morbi	2022-04-10 01:22:07
23	81	lectus. Nullam suscipit, est	345	4	1	2	odio sagittis semper. Nam tempor diam dictum	2021-08-06 13:51:13
24	20	lobortis augue scelerisque	914	4	4	2	parturient montes, nascetur ridiculus mus.	2022-07-28 21:12:48
25	69	sem egestas blandit. Nam nulla magna,	353	1	1	3	ornare tortor at risus. Nunc ac sem ut dolor	2022-07-18 06:36:39
26	47	at lacus. Quisque	9720	5	3	2	vitae diam. Proin dolor. Nulla semper tellus	2022-01-18 07:54:20
27	86	at sem molestie sodales. Mauris blandit enim	4728	5	4	1	nec quam. Curabitur vel lectus. Cum sociis natoque penatibus	2022-01-01 20:10:08
28	91	varius ultrices, mauris	9064	2	4	4	nascetur ridiculus mus. Donec dignissim	2021-11-24 13:14:37
29	3	Sed id risus quis diam luctus lobortis.	4006	2	5	1	ipsum dolor sit amet, consectetuer adipiscing	2021-08-31 18:19:31
30	3	auctor velit. Aliquam	5406	3	4	3	eu eros. Nam consequat dolor vitae dolor. Donec	2022-05-19 13:58:35
31	19	parturient montes, nascetur ridiculus mus.	3413	2	4	4	sollicitudin a, malesuada id,	2022-04-22 15:14:53
32	76	adipiscing. Mauris molestie pharetra	8801	3	4	3	sodales. Mauris blandit enim consequat purus. Maecenas	2022-02-22 04:19:27
33	45	In ornare sagittis	4004	4	1	4	vitae risus. Duis a mi fringilla mi lacinia mattis.	2021-09-12 05:38:18
34	84	semper et, lacinia vitae,	5871	5	5	2	lacus. Nulla tincidunt, neque vitae semper egestas, urna justo	2022-10-12 09:13:32
35	95	elit, pellentesque a, facilisis	7751	3	2	4	purus sapien, gravida non, sollicitudin	2021-09-08 11:31:12
36	78	quis lectus. Nullam suscipit, est ac facilisis	6028	3	3	3	lacus. Mauris non dui	2022-09-16 03:08:37
37	92	semper pretium	7824	2	3	3	sed leo. Cras vehicula aliquet libero. Integer	2021-09-19 23:37:03
38	39	quis accumsan convallis,	8873	2	2	5	faucibus orci luctus et ultrices	2022-10-02 21:20:34
39	8	Integer id magna et ipsum cursus	4326	5	4	3	diam. Sed diam lorem, auctor quis, tristique ac,	2022-04-23 13:13:26
40	78	nec luctus felis	9247	5	2	4	dignissim lacus. Aliquam rutrum lorem	2022-04-11 02:43:02
41	64	montes, nascetur ridiculus mus.	614	2	5	4	egestas nunc sed libero. Proin	2021-07-26 23:43:39
42	44	consectetuer adipiscing elit. Curabitur	6104	3	2	3	Vestibulum ante ipsum primis in	2021-08-16 06:02:04
43	9	nostra, per inceptos hymenaeos.	4079	2	1	4	ac mattis ornare, lectus ante dictum	2022-05-08 16:41:12
44	71	in sodales elit erat vitae	63	2	2	5	sapien molestie orci tincidunt adipiscing.	2022-05-02 23:34:27
45	87	lorem semper auctor. Mauris vel	9040	2	2	1	dictum. Phasellus in felis. Nulla	2022-02-27 13:51:40
46	42	ullamcorper viverra. Maecenas iaculis aliquet diam.	6407	2	3	2	enim. Etiam imperdiet dictum	2021-12-21 09:51:09
47	45	hymenaeos. Mauris ut quam vel sapien imperdiet	423	2	4	3	Curabitur vel lectus. Cum sociis natoque penatibus et	2022-07-07 06:14:36
48	13	mauris. Suspendisse aliquet molestie	1318	4	1	2	Duis dignissim tempor arcu. Vestibulum ut eros	2022-10-14 10:09:38
49	77	Aliquam adipiscing lobortis risus.	1362	4	2	3	lorem ipsum sodales purus,	2021-11-22 19:12:58
50	6	lobortis quis,	9910	4	2	2	posuere, enim nisl elementum purus,	2021-10-29 22:29:39
51	13	elit pede, malesuada vel,	9442	4	2	4	montes, nascetur ridiculus mus. Proin vel arcu eu odio	2022-07-30 09:33:39
52	28	massa non ante bibendum ullamcorper.	9484	3	4	3	cursus, diam at pretium aliquet, metus urna convallis erat,	2022-09-03 01:44:37
53	73	odio sagittis semper.	9467	1	2	3	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac	2022-03-09 07:05:48
54	74	lorem, luctus ut, pellentesque eget, dictum	2226	3	2	4	tempor erat neque non quam. Pellentesque habitant morbi tristique	2021-10-29 01:35:55
55	27	quis, pede. Praesent	1788	4	3	2	Aliquam rutrum lorem ac risus.	2021-09-02 00:52:41
56	49	ullamcorper, velit	648	3	4	1	turpis egestas. Fusce aliquet magna	2022-06-12 12:09:04
57	2	velit egestas lacinia. Sed congue, elit	5345	5	4	2	tempus mauris erat eget ipsum. Suspendisse sagittis.	2022-03-17 22:17:23
58	23	Sed molestie. Sed	3449	5	3	4	eu arcu. Morbi sit amet massa. Quisque	2022-01-24 22:39:58
59	71	Morbi neque tellus, imperdiet non, vestibulum	3438	2	3	3	adipiscing ligula. Aenean gravida nunc sed pede.	2022-09-23 09:12:26
60	90	ac ipsum. Phasellus vitae mauris	3288	5	1	3	ligula consectetuer rhoncus. Nullam velit	2021-09-20 08:42:41
61	73	lectus. Nullam suscipit,	3532	4	3	1	eleifend. Cras sed leo. Cras vehicula aliquet	2022-03-14 20:36:40
62	51	scelerisque scelerisque dui. Suspendisse ac metus	4926	3	1	4	felis. Donec tempor, est ac mattis semper,	2021-10-16 12:06:11
63	37	erat. Etiam vestibulum	2723	1	2	5	placerat eget, venenatis a, magna. Lorem ipsum	2022-01-03 00:45:09
64	18	pede. Suspendisse dui. Fusce diam	5161	4	3	1	In tincidunt congue turpis. In condimentum. Donec	2022-03-07 08:51:12
65	83	Aenean sed pede nec ante blandit	6872	4	4	4	lorem eu metus. In lorem. Donec elementum,	2022-10-03 19:07:39
66	47	erat eget ipsum. Suspendisse sagittis.	6885	3	2	5	ornare sagittis felis. Donec tempor, est	2022-02-06 14:27:55
67	53	at, velit. Pellentesque ultricies	9822	3	5	4	augue ac ipsum. Phasellus vitae mauris sit amet	2021-09-28 01:13:01
68	37	nostra, per inceptos hymenaeos. Mauris ut	6408	2	2	3	vel, convallis in, cursus et,	2022-01-25 07:12:44
69	79	enim non nisi. Aenean eget metus.	3448	4	4	3	mattis. Integer eu lacus. Quisque	2021-08-16 03:04:02
70	18	egestas nunc	740	4	2	5	ut, pellentesque eget, dictum placerat, augue. Sed	2021-07-11 21:17:38
71	63	nisi nibh lacinia orci, consectetuer	9433	4	3	2	facilisis lorem tristique aliquet. Phasellus fermentum convallis	2022-02-18 01:19:30
72	3	sem mollis dui, in sodales elit	49453	3	3	2	augue ut lacus. Nulla tincidunt, neque vitae	2022-05-19 15:37:03
73	20	erat. Vivamus nisi. Mauris nulla. Integer	8131	2	2	3	Morbi vehicula. Pellentesque tincidunt tempus risus. Donec	2021-11-01 04:55:05
74	64	neque pellentesque massa	4527	1	3	4	ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor	2022-08-04 20:50:33
75	49	est. Nunc laoreet lectus	6761	3	4	1	auctor vitae, aliquet nec, imperdiet nec, leo.	2022-03-09 15:03:26
76	82	congue, elit sed consequat auctor, nunc nulla	3449	4	1	4	Ut sagittis lobortis mauris. Suspendisse	2021-11-05 19:39:10
77	53	lobortis ultrices. Vivamus rhoncus. Donec	6566	2	4	5	ac arcu. Nunc mauris. Morbi non sapien molestie orci	2021-07-15 09:14:34
78	34	ligula. Aenean euismod	88044	5	3	2	tempus scelerisque, lorem ipsum sodales	2022-01-07 02:38:16
79	42	Aenean eget metus. In nec	6694	2	3	2	lectus rutrum urna, nec luctus	2021-12-15 20:11:34
80	73	Aenean massa. Integer vitae nibh. Donec est	9399	3	3	4	id, erat. Etiam vestibulum massa rutrum magna.	2021-07-18 10:14:28
81	36	lectus justo eu	9577	5	3	3	nunc est, mollis non, cursus non, egestas a, dui. Cras	2021-12-02 09:16:49
82	86	tempor diam dictum sapien. Aenean massa. Integer	1576	4	4	4	lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis	2022-10-06 02:48:29
83	54	vel, mauris. Integer sem elit, pharetra	4174	4	5	2	Etiam laoreet, libero et tristique	2022-05-09 20:09:06
84	70	sociis natoque penatibus	3988	2	3	1	quis lectus. Nullam suscipit, est ac	2021-12-03 11:29:06
85	91	odio. Nam interdum enim non	606	4	4	3	diam vel arcu. Curabitur ut odio vel	2021-11-19 08:49:23
86	13	Donec est. Nunc ullamcorper, velit in	4577	1	2	2	purus gravida sagittis. Duis gravida. Praesent eu nulla at	2021-07-26 13:16:25
87	50	mus. Proin vel	7549	2	4	5	nulla. Cras eu tellus eu augue porttitor	2022-02-26 06:55:18
88	58	lorem. Donec	3241	2	4	2	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus	2022-06-29 00:53:15
89	19	hendrerit id, ante.	5323	4	3	3	molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas	2022-07-27 10:05:49
90	65	ac, feugiat non, lobortis quis, pede.	8341	4	1	4	lobortis tellus justo sit amet	2021-12-08 20:04:43
91	39	non justo. Proin non massa	487	3	4	3	dignissim lacus. Aliquam rutrum	2021-12-21 08:04:43
92	6	vitae diam. Proin dolor. Nulla semper	6207	4	3	2	sagittis lobortis mauris. Suspendisse aliquet molestie	2022-08-08 03:48:41
93	46	malesuada id, erat. Etiam	6849	4	3	2	faucibus ut, nulla. Cras eu tellus eu augue	2022-01-18 11:29:22
94	63	adipiscing non, luctus sit amet,	1968	2	4	4	mauris a nunc. In at	2022-04-30 18:57:01
95	24	sem magna nec	6313	5	1	4	mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse	2022-06-26 20:47:22
96	6	sed dictum eleifend, nunc risus varius orci,	5063	3	4	2	mattis semper, dui lectus rutrum urna, nec luctus	2022-06-28 01:46:17
97	12	Curabitur ut odio vel est	6432	5	3	2	neque sed sem egestas blandit. Nam nulla magna, malesuada vel,	2021-09-25 00:12:14
98	48	a neque. Nullam ut	4477	5	2	3	molestie. Sed id risus quis diam luctus lobortis. Class	2022-10-19 13:27:28
99	57	malesuada vel,	2884	4	2	4	sem mollis dui, in	2021-10-27 22:15:07
100	81	vitae purus gravida sagittis. Duis	4950	1	4	5	Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet	2022-08-12 19:43:14
\.


--
-- Data for Name: mailing_and_notifications; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.mailing_and_notifications (worker_id, alerts_and_tips, news_and_advertising, new_vacancies, birthday_greetings, daily_notification_of_resume_views, instant_notifications_of_resume_views, internships, auto_search_for_vacancies, job_invitations, correspondence_with_the_employer) FROM stdin;
1	t	t	t	f	f	f	t	t	f	f
2	t	f	f	t	f	t	f	f	f	t
3	f	t	t	f	f	f	f	t	t	f
4	t	t	t	t	f	f	t	f	f	t
5	f	t	f	f	t	f	t	f	t	t
6	f	t	f	f	t	t	t	f	t	f
7	f	f	t	f	t	f	f	f	f	f
8	f	t	t	t	f	t	t	f	f	f
9	t	f	f	t	t	t	t	t	f	t
10	f	t	t	t	t	t	t	t	t	t
11	f	t	f	t	t	f	t	t	f	t
12	t	t	f	f	f	t	f	t	t	t
13	f	t	t	f	f	f	t	f	f	t
14	t	f	f	f	t	t	f	t	t	t
15	f	f	f	f	f	f	t	f	f	f
16	f	f	f	f	t	f	t	t	t	t
17	f	f	f	f	t	t	f	t	f	f
18	f	t	f	f	t	f	t	f	f	t
19	t	t	f	f	f	t	f	t	t	f
20	f	f	t	f	t	f	f	f	t	f
21	t	t	f	t	t	t	f	f	t	t
22	f	t	t	f	f	t	t	t	f	f
23	f	f	t	t	f	f	f	f	t	f
24	f	t	t	f	t	t	f	t	f	f
25	t	f	t	t	f	f	f	t	t	t
26	f	t	t	f	t	t	f	t	f	f
27	f	f	f	f	t	f	f	f	f	t
28	t	t	t	f	f	t	t	f	f	f
29	t	t	t	t	f	f	f	t	f	t
30	t	t	f	f	t	t	f	t	t	t
31	t	t	f	f	t	t	t	t	t	t
32	f	f	f	f	f	f	f	t	f	t
33	t	f	f	t	t	t	f	f	f	f
34	f	f	f	f	f	f	f	f	f	t
35	t	f	f	f	t	t	t	t	f	t
36	t	f	t	t	t	t	t	t	f	f
37	t	f	t	f	f	t	f	t	f	t
38	t	f	t	t	f	t	f	f	t	t
39	f	f	f	t	t	t	f	t	f	t
40	t	t	t	f	t	t	f	t	t	f
41	t	f	t	f	f	f	t	f	f	f
42	t	t	f	f	f	t	t	f	f	t
43	f	f	f	t	t	t	f	f	f	t
44	f	f	f	f	f	t	t	t	f	f
45	t	f	t	t	f	t	t	t	t	f
46	t	t	t	t	f	f	f	f	t	f
47	t	t	f	f	f	t	t	t	t	t
48	t	t	t	t	t	t	f	t	t	f
49	f	f	t	f	t	f	t	f	t	f
50	t	f	f	f	t	t	t	f	f	f
51	t	t	t	f	f	t	t	f	t	f
52	f	t	t	t	f	f	t	f	t	t
53	f	f	t	t	t	f	f	t	f	f
54	f	f	f	f	f	t	t	f	f	t
55	t	t	f	f	f	f	t	t	f	f
56	t	t	t	f	f	t	t	f	t	f
57	t	t	f	f	f	f	t	f	f	t
58	t	t	f	t	t	f	f	f	t	t
59	f	f	f	f	f	t	t	f	t	t
60	f	t	t	t	f	t	f	f	f	f
61	f	f	t	f	f	f	f	t	t	t
62	t	t	f	f	t	f	t	t	t	f
63	f	t	f	t	t	f	t	t	t	f
64	t	t	t	t	t	t	t	f	t	t
65	t	f	f	f	t	t	t	t	t	f
66	f	t	f	f	f	t	t	f	t	f
67	t	f	f	t	t	t	f	t	t	t
68	f	t	t	f	t	t	f	t	t	f
69	f	t	t	f	f	f	t	f	t	t
70	f	f	t	t	f	t	t	t	f	t
71	f	f	t	t	f	f	f	t	f	t
72	f	f	f	f	t	f	t	t	t	f
73	f	t	f	t	f	f	f	f	t	t
74	f	f	f	t	f	t	f	t	t	t
75	f	f	f	t	t	t	f	t	t	t
76	f	f	f	t	f	t	f	f	f	t
77	f	f	t	f	f	t	t	f	t	f
78	f	t	f	f	f	t	t	f	f	t
79	f	t	f	f	f	f	t	f	t	t
80	t	f	t	f	t	t	f	t	f	t
81	f	t	t	t	t	t	f	f	f	f
82	f	f	f	f	t	t	f	t	t	f
83	t	t	t	t	t	f	f	t	f	t
84	t	t	f	t	t	f	t	f	f	f
85	t	t	t	t	f	f	f	t	t	t
86	f	t	t	f	f	t	f	f	t	f
87	f	f	t	t	f	f	f	f	f	f
88	f	f	f	t	t	t	f	t	f	f
89	t	t	f	t	f	t	t	t	f	t
90	f	t	f	t	f	t	t	f	t	t
91	f	f	t	f	t	f	t	f	f	f
92	t	t	f	t	t	f	t	t	t	f
93	t	t	f	t	f	t	t	t	f	t
94	t	f	t	f	f	t	t	f	t	f
95	f	t	t	f	t	t	t	t	t	f
96	f	f	t	f	t	f	t	f	f	f
97	t	f	f	f	t	t	f	t	f	f
98	t	f	f	f	f	t	t	f	f	t
99	t	t	t	f	t	t	t	t	t	f
100	t	f	t	f	f	t	t	t	f	t
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.messages (id, worker_id, employer_id, body, is_delivered, created_at) FROM stdin;
1	16	92	dapibus rutrum,	t	2022-02-12 11:24:11
2	68	76	Sed nec	t	2022-10-09 17:14:00
3	3	11	Duis a mi fringilla mi	t	2023-03-10 07:52:39
4	97	49	nunc risus varius	t	2023-03-18 03:02:31
5	30	55	quis accumsan convallis, ante lectus convallis est, vitae	t	2023-07-23 06:44:28
6	12	95	nulla. Donec non justo. Proin non massa non	f	2022-05-16 14:26:18
7	9	75	eget, dictum placerat, augue. Sed molestie.	t	2023-04-13 21:16:42
8	95	47	convallis dolor. Quisque tincidunt	f	2023-07-22 21:58:44
9	45	99	sed sem	t	2023-01-10 00:03:27
10	37	85	venenatis vel, faucibus id,	f	2023-01-22 11:17:13
11	13	31	ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt	t	2023-03-18 18:08:42
12	78	29	at risus. Nunc ac	f	2023-07-06 17:04:39
13	67	81	in, cursus et, eros. Proin ultrices.	f	2022-02-14 15:50:06
14	99	25	lorem ac	t	2023-09-26 07:01:41
15	79	29	fermentum fermentum arcu.	t	2023-01-04 10:04:52
16	90	17	justo nec ante. Maecenas mi felis,	t	2023-02-27 07:29:37
17	52	7	euismod ac, fermentum vel, mauris. Integer sem	t	2022-01-12 00:33:33
18	84	32	Aenean massa.	f	2023-08-10 03:51:41
19	22	92	Integer aliquam adipiscing lacus. Ut	f	2023-06-14 00:09:33
20	88	16	erat. Etiam vestibulum	f	2023-05-02 10:50:58
21	32	58	Nullam vitae diam. Proin dolor. Nulla	f	2023-02-01 06:51:48
22	29	45	gravida.	t	2022-03-06 11:17:19
23	57	21	ac mi eleifend egestas. Sed pharetra, felis	t	2022-07-01 18:14:53
24	55	17	ipsum dolor sit amet, consectetuer adipiscing	t	2022-12-31 07:04:40
25	76	65	nec, imperdiet nec, leo. Morbi	f	2022-09-10 18:46:12
26	45	98	ligula. Donec luctus aliquet odio. Etiam	t	2021-11-24 12:40:07
27	78	45	magnis dis parturient montes,	t	2022-10-07 16:34:06
28	38	20	nunc sed pede. Cum	f	2022-09-12 13:38:55
29	21	85	nisi dictum	f	2022-09-27 18:27:53
30	91	77	blandit at, nisi. Cum sociis natoque penatibus	t	2022-06-06 11:50:02
31	92	35	mauris sagittis placerat. Cras	t	2023-10-10 13:56:32
32	2	69	Integer eu lacus. Quisque imperdiet, erat	f	2023-09-26 04:16:32
33	8	44	vel, mauris.	t	2022-01-10 23:25:01
34	100	4	arcu iaculis enim, sit amet ornare lectus justo	f	2023-06-24 15:28:19
35	57	14	vitae odio sagittis semper. Nam tempor diam	t	2023-05-05 15:46:26
36	98	19	primis in faucibus orci luctus et ultrices posuere	f	2022-07-11 19:08:28
37	82	23	Fusce	f	2023-10-04 21:32:46
38	51	5	velit in aliquet lobortis, nisi nibh lacinia	f	2023-01-27 07:32:26
39	35	35	conubia nostra, per inceptos hymenaeos.	f	2023-07-26 05:01:42
40	19	39	consectetuer adipiscing elit. Etiam laoreet,	f	2023-01-15 13:36:43
41	46	65	accumsan	f	2022-01-22 02:35:49
42	3	42	imperdiet ullamcorper. Duis at lacus.	f	2023-07-08 20:50:45
43	49	56	arcu. Nunc	t	2022-06-12 11:35:19
44	79	67	mattis. Cras eget	f	2023-04-21 21:06:09
45	80	99	dui nec	f	2022-12-21 06:17:25
46	10	74	felis. Nulla	f	2022-02-18 08:10:03
47	84	52	auctor velit.	t	2022-04-15 22:26:09
48	8	99	montes,	t	2022-02-10 19:49:37
49	88	57	non	t	2022-06-19 20:22:17
50	25	40	at risus. Nunc ac	f	2023-10-15 22:54:32
51	53	22	Quisque nonummy ipsum non arcu.	f	2021-11-16 21:56:39
52	9	97	dignissim tempor arcu.	t	2023-05-10 21:36:47
53	17	42	eu tempor erat neque	t	2023-08-29 20:03:00
54	65	34	lectus rutrum urna, nec luctus felis	f	2023-03-31 10:49:58
55	30	52	ac libero	t	2023-04-07 00:18:50
56	56	90	Curabitur ut odio vel est tempor	f	2023-09-05 21:40:34
57	39	33	Lorem ipsum dolor sit amet, consectetuer	t	2023-08-28 17:52:04
58	55	80	sagittis semper.	t	2022-09-14 05:07:09
59	41	79	nec ante. Maecenas	f	2022-10-20 02:47:32
60	27	95	sem molestie	t	2023-10-16 17:06:58
61	25	94	primis in faucibus orci luctus	f	2023-06-22 16:14:06
62	61	98	Cras dictum ultricies ligula. Nullam enim.	f	2023-06-03 18:56:20
63	73	68	pharetra ut,	t	2023-06-21 21:36:44
64	53	28	ac turpis egestas. Fusce	t	2023-04-04 08:34:25
65	67	83	enim nisl elementum purus,	f	2022-02-08 06:48:35
66	37	19	amet, consectetuer	f	2023-02-14 07:32:22
67	92	94	magna	f	2023-03-16 05:37:36
68	6	76	consequat nec, mollis vitae, posuere at,	f	2022-05-22 10:49:22
69	81	93	Aliquam gravida mauris ut mi. Duis risus	t	2022-07-21 12:52:14
70	91	94	fermentum risus, at fringilla purus mauris a nunc.	f	2023-09-03 04:39:31
71	46	28	enim. Nunc ut erat. Sed nunc est,	f	2022-11-29 05:06:40
72	5	26	quis lectus. Nullam	t	2023-06-15 07:30:38
73	83	97	a, dui. Cras pellentesque. Sed	t	2022-02-21 16:29:47
74	38	88	pellentesque. Sed dictum.	t	2023-03-06 10:50:46
75	38	18	ipsum cursus vestibulum.	t	2022-08-31 02:41:15
76	20	94	Pellentesque ultricies dignissim lacus. Aliquam	t	2021-12-13 06:43:02
77	60	85	auctor, velit eget laoreet posuere, enim nisl	f	2022-04-30 08:53:22
78	70	99	Morbi neque tellus, imperdiet non,	f	2022-11-23 10:07:09
79	9	60	magna sed dui. Fusce aliquam, enim nec	f	2022-04-29 09:48:46
80	89	41	dolor	f	2021-11-06 10:46:59
81	63	10	nulla. Integer urna. Vivamus molestie dapibus	t	2021-10-21 08:16:49
82	2	58	enim nec tempus scelerisque, lorem ipsum	t	2022-01-23 21:51:19
83	4	76	convallis ligula. Donec luctus aliquet odio. Etiam	t	2023-04-28 19:39:32
84	86	74	Pellentesque tincidunt tempus	t	2023-07-23 04:35:01
85	61	67	aliquet, sem ut	t	2021-11-04 18:45:17
86	86	50	lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit	f	2022-08-11 04:46:03
87	77	12	elit, pellentesque a, facilisis non, bibendum	f	2022-10-01 06:39:27
88	70	27	nunc. Quisque ornare	t	2023-08-25 12:20:46
89	83	31	vel, convallis in, cursus et, eros. Proin	t	2021-11-29 12:52:25
90	80	45	lectus, a sollicitudin orci sem eget massa.	f	2023-01-21 02:31:03
91	78	51	pharetra, felis	f	2022-05-27 06:57:56
92	3	12	mauris eu elit. Nulla	f	2022-04-25 23:19:36
93	54	5	cubilia Curae Phasellus	t	2022-03-05 13:51:07
94	41	43	Suspendisse aliquet,	f	2022-07-13 11:24:28
95	84	9	Fusce mi	f	2022-08-04 14:07:22
96	8	27	in faucibus	f	2023-04-14 06:26:03
97	6	90	fermentum vel, mauris. Integer	f	2022-08-11 17:34:06
98	3	96	enim nisl elementum	f	2022-12-24 05:54:20
99	35	37	sit amet luctus	f	2023-01-20 18:27:44
100	47	89	cursus in, hendrerit consectetuer, cursus et, magna. Praesent	f	2023-06-04 00:49:06
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.regions (id, name) FROM stdin;
1	Республика Адыгея
2	Республика Башкортостан
3	Республика Бурятия
4	Республика Алтай
5	Республика Дагестан
6	Республика Ингушетия
7	Кабардино-Балкарская Республика
8	Республика Калмыкия
9	Карачаево-Черкесская Республика
10	Республика Карелия
11	Республика Коми
12	Республика Марий Эл
13	Республика Мордовия
14	Республика Саха (Якутия)
15	Республика Северная Осетия - Алания
16	Республика Татарстан (Татарстан)
17	Республика Тыва
18	Удмуртская Республика
19	Республика Хакасия
20	Чеченская Республика
21	Чувашская Республика - Чувашия
22	Алтайский край
23	Краснодарский край
24	Красноярский край
25	Приморский край
26	Ставропольский край
27	Хабаровский край
28	Амурская область
29	Архангельская область
30	Астраханская область
31	Белгородская область
32	Брянская область
33	Владимирская область
34	Волгоградская область
35	Вологодская область
36	Воронежская область
37	Ивановская область
38	Иркутская область
39	Калининградская область
40	Калужская область
41	Камчатский край
42	Кемеровская область - Кузбасс
43	Кировская область
44	Костромская область
45	Курганская область
46	Курская область
47	Ленинградская область
48	Липецкая область
49	Магаданская область
50	Московская область
51	Мурманская область
52	Нижегородская область
53	Новгородская область
54	Новосибирская область
55	Омская область
56	Оренбургская область
57	Орловская область
58	Пензенская область
59	Пермский край
60	Псковская область
61	Ростовская область
62	Рязанская область
63	Самарская область
64	Саратовская область
65	Сахалинская область
66	Свердловская область
67	Смоленская область
68	Тамбовская область
69	Тверская область
70	Томская область
71	Тульская область
72	Тюменская область
73	Ульяновская область
74	Челябинская область
75	Забайкальский край
76	Ярославская область
77	Еврейская автономная область
78	Ненецкий автономный округ
79	Ханты-Мансийский автономный округ - Югра
80	Чукотский автономный округ
81	Ямало-Ненецкий автономный округ
82	Республика Крым
\.


--
-- Data for Name: resume_busyness; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_busyness (id, busyness_id, resume_id) FROM stdin;
1	5	80
2	4	72
3	1	95
4	2	39
5	3	53
6	5	56
7	3	40
8	2	97
9	2	85
10	5	15
11	1	69
12	2	27
13	2	55
14	2	15
15	2	83
16	3	53
17	4	80
18	4	11
19	2	78
20	3	83
21	3	94
22	5	99
23	4	20
24	4	67
25	1	61
26	4	44
27	4	10
28	3	69
29	4	16
30	2	31
31	5	56
32	1	70
33	3	69
34	3	2
35	2	78
36	2	11
37	3	64
38	4	13
39	3	50
40	1	5
41	5	87
42	3	51
43	1	25
44	3	55
45	3	86
46	5	5
47	3	98
48	2	9
49	2	72
50	2	14
51	5	28
52	5	62
53	2	69
54	1	6
55	2	33
56	4	60
57	1	68
58	5	92
59	2	76
60	4	9
61	2	24
62	2	93
63	2	3
64	4	95
65	1	75
66	1	29
67	3	60
68	4	75
69	4	11
70	4	85
71	3	65
72	2	10
73	2	74
74	3	84
75	2	94
76	5	68
77	3	64
78	3	86
79	5	9
80	3	34
81	4	34
82	4	99
83	1	5
84	2	22
85	3	47
86	4	26
87	2	8
88	4	59
89	1	60
90	3	73
91	5	60
92	5	18
93	2	18
94	5	62
95	1	13
96	2	75
97	1	23
98	3	64
99	2	27
100	2	4
\.


--
-- Data for Name: resume_education; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_education (resume_id, level, educational_institution, faculty, specialization, year_of_graduation) FROM stdin;
1	Доктор наук	ultrices posuere cubilia Curae	turpis egestas.	vel turpis. Aliquam adipiscing	2012
2	Среднее	magna, malesuada vel, convallis	id nunc interdum	at augue id ante dictum cursus. Nunc	2011
3	Среднее специальное	Phasellus libero mauris,	sit amet, consectetuer adipiscing	at pretium aliquet,	2015
4	Неоконченное высшее	volutpat nunc sit amet metus.	fermentum risus,	lacus. Nulla tincidunt, neque vitae	2004
5	Магистр	libero nec ligula consectetuer rhoncus. Nullam	a felis ullamcorper	lobortis mauris. Suspendisse aliquet molestie tellus.	2018
6	Среднее	amet metus. Aliquam	nisl. Quisque	a odio semper cursus. Integer	2007
7	Среднее	nibh. Phasellus nulla. Integer vulputate,	Nam tempor diam dictum	nec, euismod in, dolor.	2013
3	Среднее	vitae velit egestas lacinia. Sed	dui, in	felis orci, adipiscing non,	2019
7	Среднее специальное	amet lorem semper auctor. Mauris vel	eros	Nullam velit dui, semper	2022
10	Высшее	Aenean massa. Integer vitae	luctus aliquet odio.	egestas. Sed pharetra, felis eget varius	2007
11	Высшее	Nulla semper tellus id nunc	convallis	consectetuer adipiscing elit. Curabitur sed tortor.	2004
12	Кандидат наук	pharetra, felis eget varius ultrices, mauris	sit amet, consectetuer adipiscing	ultrices sit	2018
13	Среднее	ligula eu enim. Etiam imperdiet dictum	ac	ridiculus mus.	2007
9	Высшее	ut nisi a odio semper	aliquam	sed, hendrerit a,	2020
16	Кандидат наук	pellentesque eget, dictum placerat,	Pellentesque tincidunt tempus	eget ipsum.	2015
2	Неоконченное высшее	mollis. Integer tincidunt aliquam arcu.	urna suscipit nonummy.	eu metus. In lorem. Donec elementum,	2019
19	Среднее	elit fermentum risus, at fringilla purus	turpis. Aliquam	mi felis, adipiscing fringilla, porttitor	2018
20	Магистр	Proin mi. Aliquam gravida	Duis ac	sociis	2014
21	Среднее специальное	Curae Donec tincidunt. Donec	libero est, congue	mauris. Suspendisse aliquet molestie tellus.	2015
22	Кандидат наук	ornare egestas ligula.	augue, eu tempor	dui. Cras pellentesque. Sed dictum.	2009
23	Высшее	eget metus eu erat	dui, in	Duis gravida. Praesent	2010
24	Бакалавр	scelerisque mollis. Phasellus libero mauris,	malesuada fames	enim. Suspendisse aliquet, sem ut cursus luctus,	2021
25	Среднее специальное	non arcu. Vivamus	conubia nostra, per	tincidunt orci quis lectus.	2017
26	Высшее	a mi fringilla mi lacinia	aliquet libero.	mauris. Morbi non sapien	2017
27	Высшее	lorem lorem, luctus ut, pellentesque eget,	diam. Duis mi	fermentum arcu. Vestibulum ante ipsum	2009
28	Бакалавр	eu eros. Nam	volutpat nunc sit	magna. Lorem ipsum dolor sit	2005
29	Среднее	dolor. Nulla semper tellus id	felis, adipiscing	pede, ultrices a, auctor non,	2004
29	Магистр	vel, venenatis vel, faucibus id,	sed pede. Cum	nunc. In at pede. Cras vulputate	2007
31	Доктор наук	neque. Nullam nisl.	egestas lacinia. Sed	Nulla	2018
32	Магистр	felis eget varius ultrices,	lacinia	odio vel	2012
31	Бакалавр	non quam. Pellentesque habitant morbi tristique	placerat. Cras	tellus sem mollis dui, in	2012
34	Среднее	faucibus. Morbi vehicula. Pellentesque tincidunt	dolor sit amet,	pede. Nunc sed orci lobortis augue	2010
35	Доктор наук	nisl. Nulla eu	nunc sit	vehicula risus. Nulla	2014
36	Кандидат наук	libero at auctor ullamcorper,	sit	porttitor tellus non magna. Nam ligula	2005
39	Среднее специальное	a, magna. Lorem ipsum	eget, ipsum. Donec	ut quam vel	2011
38	Доктор наук	felis. Donec tempor, est	aliquet magna a	velit. Sed malesuada augue ut	2022
39	Кандидат наук	ornare, libero at auctor	ultricies dignissim	diam nunc, ullamcorper eu, euismod ac,	2014
40	Кандидат наук	ac mi eleifend	vulputate, posuere vulputate, lacus.	magnis dis	2007
39	Среднее специальное	diam vel arcu. Curabitur	ante. Nunc	amet massa.	2011
42	Магистр	consequat purus. Maecenas libero est,	scelerisque, lorem ipsum	sociis natoque	2013
43	Неоконченное высшее	et risus. Quisque libero	eu tellus.	aliquam adipiscing lacus.	2013
44	Доктор наук	ante dictum mi,	neque non quam. Pellentesque	at, nisi.	2006
45	Среднее	sodales. Mauris blandit enim consequat purus.	neque non	et malesuada	2019
46	Неоконченное высшее	Quisque ac libero	ullamcorper. Duis	eu, odio. Phasellus at augue id	2017
47	Высшее	Duis ac arcu. Nunc mauris.	enim, condimentum	ante ipsum primis in faucibus orci	2005
46	Магистр	sed sem egestas blandit. Nam nulla	In condimentum.	enim mi	2010
49	Среднее	nisl elementum purus, accumsan interdum	varius orci, in	facilisis vitae, orci. Phasellus dapibus quam	2021
50	Среднее специальное	adipiscing lobortis risus. In	Etiam vestibulum	Donec tincidunt. Donec vitae erat	2013
51	Высшее	fermentum fermentum arcu. Vestibulum ante ipsum	Etiam	lectus sit amet luctus vulputate, nisi	2016
52	Среднее специальное	orci. Donec nibh.	in lobortis	egestas rhoncus. Proin nisl sem, consequat	2022
52	Бакалавр	risus. Morbi metus. Vivamus	mauris	hendrerit id,	2014
54	Бакалавр	Nullam scelerisque neque sed	lectus convallis	et,	2009
55	Магистр	lectus ante dictum mi,	non, sollicitudin a, malesuada	interdum. Nunc sollicitudin	2014
56	Среднее специальное	arcu ac orci. Ut semper	eget mollis	eu turpis.	2006
57	Магистр	lectus. Nullam suscipit, est ac	orci quis lectus. Nullam	sem, vitae aliquam eros	2013
58	Неоконченное высшее	quis diam. Pellentesque habitant morbi	et, commodo	volutpat nunc sit amet metus.	2017
59	Магистр	ornare sagittis felis. Donec	eu,	erat nonummy ultricies ornare, elit elit	2005
60	Доктор наук	non, dapibus rutrum,	ipsum	hendrerit consectetuer, cursus et, magna. Praesent	2007
62	Доктор наук	posuere at, velit. Cras	feugiat placerat velit.	tempus non, lacinia at, iaculis quis, pede.	2007
62	Магистр	faucibus. Morbi vehicula. Pellentesque	varius orci,	ligula. Aenean gravida nunc sed	2005
63	Магистр	tortor nibh sit amet	ultricies dignissim lacus.	sit amet lorem	2022
64	Доктор наук	molestie dapibus ligula. Aliquam erat	in, tempus eu, ligula.	Nunc ullamcorper, velit in aliquet lobortis,	2016
65	Неоконченное высшее	lacus pede sagittis augue, eu	placerat eget,	sit amet nulla.	2017
66	Неоконченное высшее	posuere, enim nisl elementum	vitae, erat. Vivamus	justo. Praesent luctus. Curabitur	2006
67	Бакалавр	a purus. Duis elementum, dui quis	Proin vel nisl. Quisque	dictum eu, eleifend nec, malesuada	2005
68	Высшее	elit, pharetra ut, pharetra sed, hendrerit	netus et malesuada	consectetuer adipiscing elit. Curabitur sed	2016
69	Высшее	velit in aliquet lobortis, nisi nibh	odio	eleifend. Cras sed leo. Cras	2020
70	Бакалавр	adipiscing lacus. Ut	Fusce dolor quam,	Integer aliquam adipiscing lacus. Ut nec	2007
71	Среднее	consequat auctor, nunc nulla vulputate	dignissim. Maecenas ornare egestas	hendrerit id, ante. Nunc	2022
72	Среднее	blandit at, nisi. Cum sociis	sem, vitae aliquam	Sed nunc est,	2010
73	Магистр	sit amet nulla. Donec non justo.	vestibulum lorem,	Aliquam fringilla cursus purus. Nullam	2006
74	Среднее	congue a, aliquet vel,	pellentesque. Sed	lacus. Cras interdum. Nunc	2014
75	Среднее	facilisis eget, ipsum. Donec sollicitudin	tristique ac, eleifend	vel pede	2003
76	Бакалавр	lacus. Ut nec	ac facilisis facilisis,	eget nisi dictum augue malesuada malesuada.	2014
75	Высшее	ut, pharetra sed, hendrerit a,	et, magna.	Aliquam ultrices iaculis odio. Nam interdum enim	2015
78	Среднее специальное	erat. Sed nunc	feugiat nec,	Maecenas libero est,	2004
79	Магистр	arcu. Curabitur ut	dictum sapien.	ipsum.	2017
80	Среднее	ornare lectus justo eu	Maecenas	quis diam luctus lobortis.	2018
81	Среднее специальное	leo elementum sem, vitae aliquam eros	luctus vulputate, nisi sem	mi	2021
82	Бакалавр	lacinia. Sed congue, elit	vitae semper egestas,	cursus vestibulum. Mauris	2021
83	Высшее	mollis nec, cursus a, enim. Suspendisse	mattis. Integer eu	vulputate eu, odio.	2017
84	Кандидат наук	Nunc sed orci lobortis	auctor ullamcorper,	neque. In ornare	2011
85	Доктор наук	bibendum sed, est. Nunc	Cras eu	imperdiet	2013
86	Бакалавр	dapibus id, blandit	Ut	vel pede blandit congue. In	2007
87	Неоконченное высшее	Aenean massa. Integer vitae nibh.	non	enim nisl elementum purus, accumsan interdum libero	2011
88	Кандидат наук	risus. Donec egestas. Aliquam nec	volutpat	auctor, velit eget	2011
89	Доктор наук	ac ipsum. Phasellus vitae mauris sit	Phasellus libero mauris,	Etiam laoreet,	2016
90	Магистр	quam. Pellentesque habitant morbi	viverra. Donec tempus,	Duis elementum, dui quis accumsan convallis, ante	2006
91	Магистр	ornare, facilisis eget, ipsum. Donec	aliquam adipiscing lacus. Ut	nisi magna	2013
92	Бакалавр	ultrices. Vivamus rhoncus. Donec est.	et ipsum cursus vestibulum.	nisl elementum	2020
93	Кандидат наук	Maecenas libero est,	scelerisque neque	sed libero. Proin	2022
94	Среднее	massa. Vestibulum accumsan neque	Vestibulum ut	dui quis	2007
95	Магистр	ante dictum cursus. Nunc	aliquam eros turpis	turpis nec mauris blandit mattis. Cras	2008
96	Доктор наук	Lorem ipsum dolor sit amet,	magna. Sed eu	mattis velit	2015
97	Высшее	magna et ipsum cursus	consequat, lectus sit amet	fringilla	2019
98	Доктор наук	libero. Integer in magna. Phasellus	et, commodo	ac libero nec ligula	2013
99	Бакалавр	mi lacinia mattis.	magna sed	commodo at, libero. Morbi	2015
100	Высшее	Donec sollicitudin adipiscing ligula.	ipsum nunc id	imperdiet ullamcorper. Duis at lacus.	2006
\.


--
-- Data for Name: resume_electronic_certificates; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_electronic_certificates (resume_id, name, url, specialization, year_of_receipt) FROM stdin;
1	mus. Donec dignissim magna	youtube.com?k=0	diam eu dolor egestas rhoncus. Proin	2022
2	Phasellus fermentum convallis ligula.	pinterest.com?gi=100	id, libero. Donec consectetuer mauris id sapien.	2004
3	pede sagittis augue, eu	cnn.com?str=se	leo. Morbi neque tellus,	2018
4	ultricies sem magna nec	twitter.com?gi=100	diam. Proin dolor. Nulla semper tellus	2004
5	In mi pede, nonummy	pinterest.com?ad=115	nec metus facilisis	2011
6	consectetuer mauris id sapien.	instagram.com?q=11	malesuada id, erat. Etiam	2015
7	Ut nec urna et	baidu.com?page=1&offset=1	quis diam luctus	2003
8	justo nec ante. Maecenas	cnn.com?ad=115	semper tellus id nunc	2007
9	libero mauris, aliquam eu,	guardian.co.uk?p=8	sit amet risus.	2015
10	suscipit, est ac facilisis	netflix.com?q=0	varius orci, in consequat enim	2007
11	mollis non, cursus non,	google.com?q=11	ac, eleifend	2020
12	amet, risus. Donec nibh	whatsapp.com?gi=100	nunc, ullamcorper	2019
13	nulla ante, iaculis nec,	whatsapp.com?g=1	dolor. Quisque tincidunt pede	2009
14	eu lacus. Quisque imperdiet,	youtube.com?ad=115	conubia nostra,	2016
15	adipiscing, enim mi tempor	bbc.co.uk?page=1&offset=1	commodo tincidunt nibh. Phasellus	2012
16	arcu ac orci. Ut	netflix.com?search=1	Donec	2005
17	neque venenatis lacus. Etiam	walmart.com?q=0	tristique neque venenatis lacus.	2005
18	nunc id enim. Curabitur	bbc.co.uk?ab=441&aad=2	faucibus id, libero. Donec consectetuer	2021
19	molestie tortor nibh sit	bbc.co.uk?search=1&q=de	auctor, velit eget laoreet posuere,	2011
20	Ut nec urna et	zoom.us?p=8	Nulla facilisis. Suspendisse commodo tincidunt	2012
21	justo eu arcu. Morbi	youtube.com?k=0	In ornare sagittis felis. Donec tempor,	2011
22	dolor. Quisque tincidunt pede	ebay.com?gi=100	Nunc mauris elit, dictum eu, eleifend nec,	2019
23	id nunc interdum feugiat.	google.com?ad=115	Fusce mollis.	2015
24	nec ligula consectetuer rhoncus.	nytimes.com?client=g	montes, nascetur ridiculus mus. Proin vel	2008
25	penatibus et magnis dis	yahoo.com?g=1	velit egestas	2011
26	et ultrices posuere cubilia	yahoo.com?ab=441&aad=2	urna. Ut tincidunt	2021
27	conubia nostra, per inceptos	reddit.com?page=1&offset=1	magna. Phasellus dolor elit, pellentesque	2022
28	ultricies ornare, elit elit	instagram.com?search=1	Quisque ac	2018
29	turpis egestas. Fusce aliquet	bbc.co.uk?q=4	lorem.	2021
30	scelerisque scelerisque dui. Suspendisse	ebay.com?ad=115	nulla. In tincidunt congue turpis. In	2011
31	adipiscing elit. Etiam laoreet,	yahoo.com?gi=100	Nulla	2021
32	ultrices, mauris ipsum porta	cnn.com?g=1	Nunc mauris. Morbi	2005
33	vehicula risus. Nulla eget	walmart.com?q=4	Quisque porttitor eros nec tellus. Nunc	2021
34	Sed dictum. Proin eget	baidu.com?p=8	tellus non magna. Nam ligula	2011
35	risus quis diam luctus	reddit.com?search=1	et, magna. Praesent interdum ligula eu enim.	2008
36	nunc sit amet metus.	reddit.com?k=0	dolor dapibus gravida. Aliquam	2004
37	augue porttitor interdum. Sed	whatsapp.com?ad=115	eu, eleifend	2017
38	sit amet, faucibus ut,	google.com?q=0	sed, facilisis vitae, orci. Phasellus	2019
39	amet ante. Vivamus non	youtube.com?ad=115	lectus,	2005
40	aliquet, sem ut cursus	nytimes.com?q=11	adipiscing lacus.	2017
41	id sapien. Cras dolor	zoom.us?g=1	eleifend vitae, erat. Vivamus nisi.	2007
42	Ut tincidunt orci quis	yahoo.com?search=1&q=de	amet, risus. Donec nibh enim, gravida sit	2016
43	auctor quis, tristique ac,	twitter.com?client=g	Cras eget nisi dictum	2007
44	Ut nec urna et	whatsapp.com?g=1	Donec	2003
45	Mauris ut quam vel	youtube.com?search=1	fringilla est. Mauris eu turpis.	2009
46	commodo hendrerit. Donec porttitor	reddit.com?page=1&offset=1	litora torquent per conubia	2003
47	montes, nascetur ridiculus mus.	bbc.co.uk?search=1&q=de	neque. Sed eget lacus.	2005
48	odio vel est tempor	google.com?k=0	convallis, ante lectus	2018
49	Integer urna. Vivamus molestie	pinterest.com?search=1&q=de	tempor augue ac ipsum. Phasellus vitae	2013
50	justo nec ante. Maecenas	naver.com?q=0	commodo hendrerit. Donec porttitor tellus non	2015
51	dolor elit, pellentesque a,	youtube.com?page=1&offset=1	arcu. Vestibulum	2012
52	ornare. In faucibus. Morbi	twitter.com?g=1	lectus justo eu	2020
53	arcu. Vestibulum ante ipsum	whatsapp.com?q=11	facilisis, magna	2004
54	ridiculus mus. Proin vel	baidu.com?page=1&offset=1	Quisque ornare tortor	2017
55	Nunc mauris. Morbi non	google.com?search=1	tristique pharetra. Quisque ac libero nec	2007
56	eu, accumsan sed, facilisis	guardian.co.uk?gi=100	gravida	2004
57	aptent taciti sociosqu ad	twitter.com?q=test	Sed eu eros. Nam consequat dolor	2020
58	eu augue porttitor interdum.	walmart.com?ad=115	sagittis. Nullam vitae diam. Proin dolor.	2005
59	dictum mi, ac mattis	whatsapp.com?q=0	consequat, lectus sit amet luctus	2010
60	luctus ut, pellentesque eget,	google.com?q=0	Nulla tincidunt, neque vitae semper egestas,	2022
61	lorem, eget mollis lectus	twitter.com?q=test	ut nisi a odio semper cursus.	2014
62	arcu. Sed eu nibh	nytimes.com?q=0	Nam ac nulla. In tincidunt	2019
63	Proin eget odio. Aliquam	pinterest.com?search=1&q=de	fermentum fermentum	2012
64	netus et malesuada fames	nytimes.com?p=8	Praesent eu dui. Cum sociis natoque	2010
65	quam, elementum at, egestas	google.com?q=11	aliquam eu, accumsan sed, facilisis vitae,	2008
66	facilisis eget, ipsum. Donec	reddit.com?ad=115	sit amet massa. Quisque	2010
67	metus urna convallis erat,	walmart.com?ad=115	dolor, tempus non, lacinia at, iaculis	2007
68	sit amet luctus vulputate,	baidu.com?q=11	Curabitur dictum. Phasellus in felis. Nulla	2018
69	Morbi quis urna. Nunc	ebay.com?client=g	ut aliquam iaculis, lacus pede	2018
70	Pellentesque ut ipsum ac	guardian.co.uk?client=g	Sed eget	2014
71	consectetuer ipsum nunc id	baidu.com?g=1	risus. Quisque libero lacus, varius	2009
72	mauris erat eget ipsum.	pinterest.com?gi=100	magna. Phasellus dolor elit, pellentesque a,	2009
73	ligula elit, pretium et,	google.com?q=4	ipsum. Donec sollicitudin adipiscing	2014
74	erat. Sed nunc est,	twitter.com?ab=441&aad=2	lectus. Nullam suscipit, est	2021
75	sem, consequat nec, mollis	guardian.co.uk?str=se	feugiat. Sed nec	2003
76	ridiculus mus. Proin vel	twitter.com?k=0	odio, auctor	2016
77	malesuada id, erat. Etiam	google.com?search=1&q=de	Vivamus non lorem	2003
78	ornare. Fusce mollis. Duis	ebay.com?g=1	mus. Aenean eget magna.	2008
79	enim. Nunc ut erat.	baidu.com?ad=115	ipsum sodales purus, in	2016
80	montes, nascetur ridiculus mus.	reddit.com?search=1&q=de	enim non nisi. Aenean eget metus.	2005
81	dis parturient montes, nascetur	ebay.com?ab=441&aad=2	lorem ut	2010
82	Donec egestas. Aliquam nec	pinterest.com?client=g	gravida molestie	2008
83	eget mollis lectus pede	whatsapp.com?q=0	nec, cursus	2015
84	ligula. Nullam feugiat placerat	whatsapp.com?q=11	viverra. Donec tempus, lorem fringilla ornare	2018
85	at, nisi. Cum sociis	zoom.us?client=g	vitae, erat. Vivamus nisi. Mauris nulla.	2016
86	et malesuada fames ac	wikipedia.org?search=1&q=de	a purus.	2019
87	nunc est, mollis non,	walmart.com?q=test	conubia nostra, per inceptos hymenaeos.	2003
88	natoque penatibus et magnis	instagram.com?gi=100	tristique ac, eleifend vitae, erat. Vivamus	2011
89	Cras interdum. Nunc sollicitudin	reddit.com?ab=441&aad=2	mauris id	2006
90	fringilla euismod enim. Etiam	cnn.com?p=8	convallis est, vitae sodales	2016
91	Nunc sed orci lobortis	yahoo.com?g=1	lectus justo eu	2007
92	velit eget laoreet posuere,	google.com?p=8	erat. Vivamus nisi. Mauris nulla. Integer	2017
93	porttitor interdum. Sed auctor	cnn.com?ad=115	et netus	2014
94	lorem ac risus. Morbi	instagram.com?client=g	elementum purus,	2020
95	facilisi. Sed neque. Sed	walmart.com?q=11	tempus, lorem	2011
96	elit sed consequat auctor,	zoom.us?q=0	sem mollis dui, in sodales elit erat	2009
97	posuere vulputate, lacus. Cras	twitter.com?q=0	et,	2013
98	Donec dignissim magna a	wikipedia.org?search=1&q=de	hymenaeos. Mauris ut quam vel sapien	2012
99	ligula eu enim. Etiam	pinterest.com?q=4	convallis, ante lectus convallis est,	2021
100	felis purus ac tellus.	cnn.com?search=1&q=de	Ut tincidunt vehicula	2014
\.


--
-- Data for Name: resume_languages; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_languages (resume_id, language, level) FROM stdin;
1	Итальянский	B2 - средне-продвинутый
2	Старославянский	B2 - средне-продвинутый
3	Китайский	B2 - средне-продвинутый
4	Итальянский	B2 - средне-продвинутый
5	Русский	B2 - средне-продвинутый
8	Японский	A2 -  элементарный
7	Чувашский	A2 -  элементарный
8	Хинди	B2 - средне-продвинутый
9	Польский	C1 - продвинутый
10	Хинди	B1 - средний
11	Таджикский	С2 - в совершенстве
12	Польский	A2 -  элементарный
13	Испанский	A2 -  элементарный
14	Казахский	C1 - продвинутый
15	Казахский	B1 - средний
16	Испанский	С2 - в совершенстве
17	Русский	B1 - средний
18	Испанский	A2 -  элементарный
19	Таджикский	A1 - начальный
20	Чувашский	C1 - продвинутый
21	Японский	B2 - средне-продвинутый
22	Старославянский	С2 - в совершенстве
23	Азербайджанский	С2 - в совершенстве
24	Казахский	C1 - продвинутый
25	Польский	B1 - средний
17	Чувашский	С2 - в совершенстве
27	Казахский	A1 - начальный
28	Итальянский	A2 -  элементарный
29	Таджикский	С2 - в совершенстве
30	Итальянский	B1 - средний
31	Итальянский	C1 - продвинутый
32	Таджикский	B1 - средний
33	Старославянский	С2 - в совершенстве
34	Польский	С2 - в совершенстве
35	Японский	A2 -  элементарный
36	Итальянский	B1 - средний
37	Хинди	B2 - средне-продвинутый
38	Китайский	B1 - средний
39	Польский	A2 -  элементарный
40	Азербайджанский	С2 - в совершенстве
41	Русский	С2 - в совершенстве
23	Португальский	A1 - начальный
43	Итальянский	B2 - средне-продвинутый
44	Азербайджанский	С2 - в совершенстве
44	Польский	A1 - начальный
44	Азербайджанский	С2 - в совершенстве
47	Хинди	C1 - продвинутый
48	Французский	С2 - в совершенстве
49	Португальский	B1 - средний
50	Португальский	A2 -  элементарный
51	Старославянский	A2 -  элементарный
52	Русский	A1 - начальный
53	Португальский	С2 - в совершенстве
54	Португальский	С2 - в совершенстве
55	Казахский	B1 - средний
56	Немецкий	С2 - в совершенстве
57	Азербайджанский	C1 - продвинутый
58	Французский	A1 - начальный
59	Казахский	B2 - средне-продвинутый
60	Польский	A2 -  элементарный
61	Французский	C1 - продвинутый
62	Итальянский	B2 - средне-продвинутый
63	Японский	C1 - продвинутый
64	Французский	B1 - средний
65	Английский	B2 - средне-продвинутый
66	Французский	A2 -  элементарный
69	Хинди	A1 - начальный
68	Португальский	B2 - средне-продвинутый
69	Японский	A1 - начальный
70	Английский	С2 - в совершенстве
71	Таджикский	С2 - в совершенстве
72	Французский	С2 - в совершенстве
73	Чувашский	A2 -  элементарный
74	Итальянский	С2 - в совершенстве
75	Русский	C1 - продвинутый
76	Старославянский	B2 - средне-продвинутый
77	Старославянский	B1 - средний
83	Китайский	C1 - продвинутый
79	Португальский	С2 - в совершенстве
80	Старославянский	B1 - средний
81	Чувашский	B2 - средне-продвинутый
82	Английский	A1 - начальный
83	Старославянский	С2 - в совершенстве
84	Старославянский	B1 - средний
86	Хинди	С2 - в совершенстве
86	Старославянский	С2 - в совершенстве
87	Итальянский	С2 - в совершенстве
88	Английский	C1 - продвинутый
89	Японский	С2 - в совершенстве
92	Японский	A1 - начальный
91	Японский	B2 - средне-продвинутый
92	Хинди	С2 - в совершенстве
93	Старославянский	B1 - средний
94	Английский	B2 - средне-продвинутый
95	Немецкий	С2 - в совершенстве
19	Испанский	C1 - продвинутый
97	Португальский	B1 - средний
98	Французский	A2 -  элементарный
98	Испанский	A2 -  элементарный
100	Польский	С2 - в совершенстве
\.


--
-- Data for Name: resume_personal_info; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_personal_info (resume_id, worker_name, worker_surname, worker_patronymic, date_of_birth, gender, city_of_residence, movement, readiness_for_business_trips) FROM stdin;
1	Kaseem	Brown	Abra L. Rose	2008-01-26	Мужской	33	Невозможен	Готов
2	Denton	Marquez	Benedict E. Stark	2015-05-16	Мужской	43	Возможен	Никогда
3	Yardley	Gay	Desiree S. Mullins	2011-04-10	Мужской	61	Возможен	Готов
4	Gay	Justice	Magee J. Short	2006-05-29	Женский	60	Возможен	Иногда
5	Mason	Frazier	Ursa T. Stein	2015-06-12	Мужской	71	Желателен	Иногда
6	Hakeem	Solomon	Jemima Y. Shaw	2013-02-04	Женский	78	Желателен	Никогда
7	Guy	Hurley	Mariam Z. Mcmahon	2014-02-22	Женский	12	Возможен	Никогда
8	Kirk	Farrell	Claudia U. Freeman	2005-04-18	Мужской	44	Невозможен	Никогда
9	Sylvia	Garrett	Lilah O. Rhodes	2013-02-28	Мужской	9	Невозможен	Готов
10	Latifah	Avila	Abbot I. Lee	2006-12-30	Женский	44	Желателен	Иногда
11	Avye	May	Chastity H. Mclean	2008-08-24	Мужской	46	Возможен	Иногда
12	Chava	Becker	Tucker V. Richards	2013-05-08	Мужской	68	Невозможен	Иногда
13	Nell	Frye	Barbara I. Armstrong	2014-04-13	Мужской	76	Возможен	Иногда
14	TaShya	Barrera	Aquila H. Garza	2006-08-13	Женский	54	Невозможен	Иногда
15	Evelyn	Nichols	Caryn X. Burns	2009-11-18	Женский	11	Желателен	Иногда
16	Nelle	Rice	Jamalia G. Guerra	2014-04-29	Мужской	98	Желателен	Иногда
17	Clarke	Palmer	Asher K. Mcconnell	2006-12-29	Мужской	98	Невозможен	Готов
18	Astra	Cameron	Brooke E. Lambert	2016-11-05	Мужской	94	Возможен	Готов
19	Hadley	Cameron	Davis E. Gallegos	2010-06-27	Женский	21	Желателен	Готов
20	Ignacia	Burris	Jaime V. Mejia	2017-08-13	Мужской	89	Возможен	Готов
21	Cherokee	Sargent	Maya O. Greene	2014-12-06	Мужской	77	Желателен	Готов
22	Gregory	Holcomb	Camden I. Farrell	2016-06-30	Мужской	91	Возможен	Никогда
23	Kiara	Crosby	Gareth G. Spence	2004-11-18	Мужской	9	Возможен	Готов
24	Tanya	Mcintyre	Xander P. Osborne	2013-01-19	Мужской	15	Возможен	Иногда
25	Desiree	Avery	Perry U. Tillman	2011-02-13	Мужской	9	Желателен	Никогда
26	Gillian	Johns	Sasha O. Shannon	2011-06-26	Мужской	70	Желателен	Никогда
27	Mona	Small	Medge V. Walker	2017-03-18	Мужской	96	Возможен	Готов
28	Unity	Mosley	Elvis E. Skinner	2014-05-14	Мужской	2	Возможен	Никогда
29	Orson	Francis	Cassady G. Hicks	2016-03-31	Женский	89	Возможен	Готов
30	Althea	Holmes	Steel H. Medina	2005-02-25	Женский	43	Возможен	Готов
31	Colorado	Sweeney	Raja I. Maynard	2016-03-07	Женский	28	Возможен	Никогда
32	Gary	Clayton	Summer R. Guerra	2015-01-10	Мужской	13	Невозможен	Готов
33	Malik	Fields	Peter N. Weber	2004-12-06	Мужской	82	Желателен	Готов
34	Ferdinand	Erickson	Yael S. Norton	2011-04-08	Мужской	81	Возможен	Иногда
35	Ashely	Rogers	Cadman M. Daugherty	2010-11-16	Мужской	75	Невозможен	Иногда
36	Cheyenne	Powell	Gregory F. Roberson	2009-03-07	Мужской	56	Возможен	Готов
37	Sigourney	Hale	Macy V. Ramsey	2012-05-26	Женский	50	Желателен	Никогда
38	Rowan	Humphrey	Hannah K. Petty	2005-05-15	Мужской	93	Желателен	Готов
39	Guinevere	Gomez	Kitra V. Ratliff	2008-02-21	Мужской	8	Возможен	Готов
40	Hedda	Olson	Colby G. Dillon	2015-03-16	Мужской	75	Возможен	Готов
41	Diana	Adkins	Geoffrey F. Lawrence	2014-07-30	Мужской	95	Возможен	Готов
42	Beau	Alexander	Janna Z. Mcclain	2005-12-28	Мужской	62	Желателен	Готов
43	Gregory	Cabrera	Reuben Y. Gill	2015-08-15	Мужской	91	Возможен	Иногда
44	Ivana	Tran	Caldwell S. Lowe	2009-11-17	Женский	35	Возможен	Никогда
45	Walter	Frost	Jerry M. Harding	2017-06-22	Мужской	6	Невозможен	Никогда
46	Olympia	Carey	Declan I. Lynch	2007-04-11	Женский	70	Желателен	Иногда
47	Pamela	Mendoza	Lacota L. Whitley	2013-03-06	Мужской	2	Невозможен	Готов
48	Zenia	Welch	Peter N. Petty	2017-03-22	Женский	63	Возможен	Готов
49	Nola	Mason	Cullen S. Melton	2014-11-02	Мужской	47	Желателен	Никогда
50	Xander	Langley	Quail T. Hayden	2015-11-25	Женский	41	Невозможен	Никогда
51	Armand	Hays	Nigel S. Mcleod	2012-02-18	Мужской	74	Возможен	Никогда
52	Josiah	Chavez	Rhiannon H. Horne	2008-11-10	Мужской	68	Возможен	Готов
53	Marvin	Mcgee	Ciaran N. Pittman	2007-08-16	Мужской	64	Возможен	Готов
54	Hermione	Avery	Rama N. Romero	2015-06-12	Мужской	60	Желателен	Никогда
55	Mikayla	Mcintosh	Candice O. Rodriguez	2017-07-19	Мужской	26	Невозможен	Готов
56	Adara	Nichols	Guy B. Holt	2015-10-01	Мужской	10	Невозможен	Никогда
57	Hunter	Vinson	Hadassah N. Zimmerman	2013-07-25	Женский	38	Невозможен	Никогда
58	Deacon	Weaver	Ivana O. Frederick	2007-02-23	Мужской	49	Невозможен	Готов
59	Wallace	Blanchard	Phoebe P. Gamble	2007-03-07	Женский	40	Желателен	Готов
60	Jaime	Walter	Curran E. Mckinney	2011-12-24	Мужской	48	Невозможен	Иногда
61	Ferris	Gordon	Patricia L. Wolf	2005-05-10	Мужской	1	Возможен	Иногда
62	Jolene	Bean	Lane Z. Maxwell	2016-08-11	Женский	64	Желателен	Иногда
63	Isabelle	Dennis	Ursula M. Hicks	2005-11-23	Женский	17	Невозможен	Иногда
64	Charissa	Valdez	Penelope I. Hahn	2009-03-21	Мужской	61	Невозможен	Иногда
65	Oleg	Goodwin	Moses N. Decker	2005-04-23	Мужской	75	Желателен	Готов
66	Kimberley	Jimenez	Zeph V. Duffy	2011-01-28	Женский	89	Невозможен	Готов
67	Hedy	Vazquez	Graiden C. Perry	2006-03-12	Мужской	15	Желателен	Никогда
68	Merrill	Kirby	Whilemina P. Burris	2016-02-18	Мужской	8	Невозможен	Никогда
69	Alana	Kent	Mikayla G. Gibson	2007-07-07	Женский	59	Возможен	Никогда
70	Kelsie	Floyd	Ila Q. Sampson	2011-03-15	Женский	94	Невозможен	Готов
71	Xena	Hardy	Nell K. Fry	2013-05-25	Мужской	80	Возможен	Готов
72	Keely	Maldonado	Leroy S. Salinas	2012-02-21	Женский	74	Желателен	Никогда
73	Amos	Pacheco	Austin N. Melton	2007-02-15	Женский	99	Невозможен	Готов
74	Finn	Chapman	Shoshana N. Ferguson	2009-07-23	Мужской	34	Возможен	Иногда
75	Whitney	Peck	Eliana S. Shaw	2013-01-20	Мужской	37	Желателен	Готов
76	Shelley	Green	Mari U. Bonner	2015-05-10	Мужской	31	Желателен	Готов
77	Reagan	Hyde	Stewart N. Daniels	2010-04-05	Мужской	18	Невозможен	Никогда
78	Zia	Graves	Claudia C. Salinas	2005-04-12	Женский	10	Возможен	Иногда
79	Iris	House	Rebecca V. Stokes	2015-05-27	Женский	22	Возможен	Готов
80	Sydnee	Thompson	Inez H. Hansen	2011-07-14	Женский	39	Возможен	Никогда
81	Willow	Matthews	Beatrice K. Gomez	2007-08-03	Мужской	22	Возможен	Готов
82	Caryn	Contreras	Kimberley D. Ratliff	2016-06-27	Женский	97	Возможен	Иногда
83	Madison	Wright	Nehru V. Bullock	2006-12-19	Женский	56	Возможен	Никогда
84	Slade	Ingram	Jin G. Noble	2010-10-24	Женский	8	Желателен	Готов
85	Gareth	Rowe	Colleen N. Knowles	2005-08-23	Мужской	29	Желателен	Никогда
86	Germaine	Rodgers	Kameko B. Fulton	2005-10-07	Женский	49	Возможен	Готов
87	Cassady	Nielsen	Forrest R. Lynch	2013-12-11	Женский	89	Желателен	Иногда
88	Darius	England	Chantale T. Pierce	2009-07-24	Женский	16	Возможен	Никогда
89	Destiny	Burris	John F. Chang	2010-03-21	Мужской	27	Желателен	Иногда
90	Cleo	Mills	Rina X. Barlow	2008-10-13	Женский	81	Возможен	Иногда
91	Rooney	Bowers	Giacomo B. Irwin	2007-11-06	Женский	37	Желателен	Никогда
92	Dora	Sharp	Troy C. Dawson	2014-01-18	Женский	80	Желателен	Готов
93	Tanya	Ball	Kane S. Cross	2009-12-15	Женский	5	Желателен	Готов
94	Paloma	Moon	Rhiannon B. Howard	2005-11-23	Мужской	68	Желателен	Иногда
95	Tobias	Campos	Jameson F. Stevenson	2013-11-04	Женский	3	Невозможен	Иногда
96	Gareth	Ball	Connor U. Ballard	2010-01-17	Женский	82	Желателен	Готов
97	Oscar	Wyatt	Jerry P. Marquez	2008-02-24	Мужской	35	Невозможен	Иногда
98	Katelyn	Byrd	Buffy U. Walter	2009-04-06	Женский	30	Желателен	Готов
99	Sigourney	Hernandez	Dana K. Wagner	2012-07-17	Женский	3	Желателен	Готов
100	Helen	Todd	Fatima Y. Phelps	2008-12-18	Женский	64	Невозможен	Никогда
\.


--
-- Data for Name: resume_portfolio; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_portfolio (resume_id, url_files) FROM stdin;
1	{bbc.co.uk/en-ca?search=1&q=de}
2	{netflix.com/sub/cars?q=4}
3	{yahoo.com/one?search=1&q=de}
4	{reddit.com/settings?ab=441&aad=2}
5	{reddit.com/settings?str=se}
6	{netflix.com/user/110?g=1,reddit.com/group/9?gi=100,youtube.com/group/9?q=test,pinterest.com/en-us?page=1&offset=1}
7	{google.com/user/110?ab=441&aad=2}
8	{pinterest.com/en-us?page=1&offset=1}
9	{google.com/fr?g=1}
10	{bbc.co.uk/fr?q=11}
11	{walmart.com/en-us?client=g}
12	{instagram.com/sub?q=test,reddit.com/group/9?gi=100,youtube.com/group/9?q=test}
13	{ebay.com/sub?gi=100}
14	{twitter.com/sub?client=g}
16	{bbc.co.uk/group/9?search=1&q=de,reddit.com/group/9?gi=100}
15	{youtube.com/en-us?client=g}
18	{facebook.com/fr?k=0}
19	{facebook.com/site?str=se,reddit.com/group/9?gi=100}
20	{instagram.com/one?k=0}
21	{google.com/fr?search=1}
22	{pinterest.com/one?p=8}
24	{ebay.com/group/9?q=test,reddit.com/group/9?gi=100,youtube.com/group/9?q=test,pinterest.com/en-us?page=1&offset=1}
25	{zoom.us/site?k=0}
28	{instagram.com/one?search=1}
27	{yahoo.com/sub?search=1}
29	{reddit.com/group/9?gi=100,reddit.com/group/9?gi=100,youtube.com/group/9?q=test}
30	{guardian.co.uk/fr?q=test,reddit.com/group/9?gi=100}
31	{guardian.co.uk/site?gi=100}
32	{walmart.com/en-ca?search=1&q=de,reddit.com/group/9?gi=100,baidu.com/site?g=1}
34	{twitter.com/settings?ad=115,reddit.com/group/9?gi=100}
35	{yahoo.com/group/9?search=1}
36	{zoom.us/group/9?client=g,reddit.com/group/9?gi=100}
38	{youtube.com/group/9?q=test}
39	{baidu.com/sub/cars?q=4,reddit.com/group/9?gi=100,baidu.com/site?g=1}
40	{naver.com/en-ca?p=8}
41	{google.com/en-ca?search=1}
42	{cnn.com/sub/cars?ab=441&aad=2,reddit.com/group/9?gi=100}
43	{walmart.com/sub?q=11}
45	{ebay.com/one?q=0}
46	{google.com/en-ca?g=1}
48	{wikipedia.org/one?search=1,reddit.com/group/9?gi=100,baidu.com/site?g=1,pinterest.com/en-us?page=1&offset=1}
49	{ebay.com/site?search=1&q=de}
50	{naver.com/fr?k=0}
52	{wikipedia.org/user/110?ad=115}
54	{twitter.com/site?q=11}
56	{pinterest.com/sub?k=0}
57	{whatsapp.com/sub/cars?str=se,twitter.com/site?q=11,baidu.com/site?g=1}
58	{facebook.com/en-ca?q=0}
59	{baidu.com/site?g=1}
60	{pinterest.com/fr?search=1,twitter.com/site?q=11,ebay.com/user/110?p=8}
62	{whatsapp.com/group/9?search=1&q=de}
63	{facebook.com/en-ca?q=test}
64	{netflix.com/one?q=4}
65	{naver.com/one?q=0}
67	{twitter.com/one?client=g,twitter.com/site?q=11}
68	{pinterest.com/user/110?client=g}
69	{wikipedia.org/one?k=0,twitter.com/site?q=11,ebay.com/user/110?p=8}
70	{ebay.com/site?ad=115}
71	{baidu.com/sub/cars?k=0}
72	{netflix.com/sub/cars?p=8}
74	{nytimes.com/one?ab=441&aad=2,twitter.com/site?q=11}
75	{google.com/user/110?p=8}
76	{wikipedia.org/site?k=0}
77	{facebook.com/settings?q=4,twitter.com/site?q=11}
79	{naver.com/en-ca?ab=441&aad=2}
80	{nytimes.com/settings?k=0,twitter.com/site?q=11,ebay.com/user/110?p=8}
81	{youtube.com/group/9?k=0}
82	{walmart.com/en-ca?q=4,cnn.com/settings?q=0}
83	{zoom.us/en-ca?str=se}
85	{baidu.com/site?ad=115,cnn.com/settings?q=0,ebay.com/user/110?p=8}
86	{bbc.co.uk/en-ca?search=1&q=de}
87	{pinterest.com/settings?ab=441&aad=2}
89	{cnn.com/settings?q=0,cnn.com/settings?q=0,ebay.com/user/110?p=8,pinterest.com/en-us?page=1&offset=1}
90	{yahoo.com/site?gi=100}
92	{twitter.com/user/110?client=g}
93	{google.com/sub/cars?q=test,cnn.com/settings?q=0}
94	{baidu.com/en-us?k=0}
96	{netflix.com/fr?str=se,cnn.com/settings?q=0}
97	{twitter.com/sub?search=1}
98	{bbc.co.uk/sub?q=0}
99	{bbc.co.uk/sub/cars?search=1&q=de,cnn.com/settings?q=0}
100	{ebay.com/user/110?p=8}
\.


--
-- Data for Name: resume_position_and_salary; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_position_and_salary (resume_id, "position", specialization_id, salary, busyness, work_shedule) FROM stdin;
1	neque vitae semper egestas, urna	16	193035	Волонтерство	Сменный график
2	ante bibendum ullamcorper. Duis cursus, diam at	82	236024	Стажировка	Сменный график
3	dui nec urna suscipit nonummy. Fusce fermentum	1	146871	Полная занятость	Гибкий график
4	sit amet lorem semper	70	19390	Частичная занятость	Гибкий график
5	lectus justo eu arcu. Morbi sit	57	168162	Проектная работа	Полный день
6	litora torquent per conubia nostra, per	17	244258	Частичная занятость	Сменный график
7	Quisque nonummy ipsum non arcu. Vivamus	83	240709	Полная занятость	Удаленная работа
8	posuere, enim nisl elementum purus,	59	112642	Полная занятость	Удаленная работа
9	mi enim,	55	91927	Проектная работа	Гибкий график
10	cursus non, egestas a, dui. Cras pellentesque.	16	125985	Волонтерство	Полный день
11	tristique pharetra.	18	212822	Стажировка	Удаленная работа
12	magna. Praesent interdum ligula eu enim.	23	160554	Проектная работа	Гибкий график
13	sed turpis nec mauris blandit mattis.	98	25332	Волонтерство	Сменный график
14	at auctor	60	74842	Волонтерство	Удаленная работа
15	et, rutrum non, hendrerit id, ante.	53	27148	Проектная работа	Полный день
16	placerat, orci lacus vestibulum	58	177509	Полная занятость	Гибкий график
17	eu tempor erat neque	55	38164	Стажировка	Удаленная работа
18	habitant morbi tristique senectus et netus et	55	173617	Волонтерство	Сменный график
19	aliquam eros turpis non	72	232521	Полная занятость	Сменный график
20	varius ultrices, mauris ipsum porta elit, a	37	127719	Волонтерство	Сменный график
21	Sed congue, elit sed consequat auctor, nunc	24	150996	Волонтерство	Полный день
22	turpis nec mauris blandit mattis.	14	134052	Проектная работа	Сменный график
23	In nec orci. Donec nibh.	88	190635	Частичная занятость	Гибкий график
24	tellus, imperdiet non,	92	100095	Волонтерство	Полный день
25	malesuada fames ac turpis egestas.	28	56639	Полная занятость	Сменный график
26	sed sem egestas blandit.	12	10045	Стажировка	Вахтовый метод
27	eu, eleifend nec, malesuada ut,	55	166143	Волонтерство	Сменный график
28	per inceptos hymenaeos.	95	33836	Частичная занятость	Гибкий график
29	dolor dolor, tempus non,	61	200132	Частичная занятость	Сменный график
30	Suspendisse aliquet, sem	1	186692	Проектная работа	Сменный график
31	elit, a feugiat tellus lorem eu metus.	92	94238	Стажировка	Гибкий график
32	lectus pede et risus.	26	201051	Стажировка	Гибкий график
33	bibendum. Donec felis orci,	24	18393	Стажировка	Полный день
34	elit, pellentesque	46	218394	Полная занятость	Вахтовый метод
35	Sed eu eros. Nam	5	214436	Полная занятость	Удаленная работа
36	dui nec	29	208458	Волонтерство	Удаленная работа
37	enim, sit amet ornare	73	185582	Частичная занятость	Сменный график
38	ullamcorper viverra. Maecenas iaculis aliquet	68	138924	Волонтерство	Сменный график
39	sem molestie sodales. Mauris blandit enim consequat	50	83171	Проектная работа	Вахтовый метод
40	lorem, auctor quis, tristique	30	109551	Проектная работа	Удаленная работа
41	lobortis risus. In mi pede,	45	245507	Полная занятость	Удаленная работа
42	justo. Proin non	31	169739	Частичная занятость	Вахтовый метод
43	parturient montes, nascetur	23	26591	Стажировка	Полный день
44	ligula. Aenean gravida nunc	91	15103	Частичная занятость	Вахтовый метод
45	id, ante. Nunc mauris sapien,	87	186858	Волонтерство	Сменный график
46	augue malesuada malesuada. Integer	56	65790	Частичная занятость	Сменный график
47	tempus, lorem fringilla	9	122140	Проектная работа	Полный день
48	Donec porttitor tellus non magna.	24	156416	Стажировка	Удаленная работа
49	interdum. Nunc sollicitudin	5	253783	Стажировка	Полный день
50	in consequat enim diam vel	57	200160	Частичная занятость	Полный день
51	turpis vitae purus gravida	31	5187	Частичная занятость	Удаленная работа
52	magna. Praesent interdum ligula	53	31920	Проектная работа	Полный день
53	ornare sagittis felis. Donec tempor,	44	185124	Полная занятость	Гибкий график
54	tincidunt pede ac urna. Ut	79	28909	Стажировка	Гибкий график
55	vestibulum lorem, sit amet ultricies	34	198346	Полная занятость	Вахтовый метод
56	ultrices, mauris ipsum porta elit, a	26	159801	Волонтерство	Гибкий график
57	eu sem. Pellentesque	47	1987	Волонтерство	Вахтовый метод
58	Pellentesque ut ipsum ac mi eleifend egestas.	16	186207	Стажировка	Полный день
59	tincidunt aliquam arcu. Aliquam ultrices iaculis	14	209125	Проектная работа	Гибкий график
60	aliquet molestie tellus. Aenean	37	76312	Стажировка	Удаленная работа
61	odio vel est tempor	66	74223	Стажировка	Гибкий график
62	lectus ante dictum mi, ac	40	161604	Частичная занятость	Гибкий график
63	enim, condimentum eget, volutpat	83	256243	Проектная работа	Полный день
64	ullamcorper, velit in	5	151091	Полная занятость	Сменный график
65	Aliquam nisl. Nulla eu neque pellentesque massa	45	201835	Стажировка	Удаленная работа
66	id, libero. Donec consectetuer mauris	11	59652	Волонтерство	Сменный график
67	ridiculus mus. Aenean eget magna.	27	225785	Стажировка	Гибкий график
68	consequat purus. Maecenas libero est, congue	41	60284	Частичная занятость	Гибкий график
69	auctor, nunc nulla vulputate dui,	47	115201	Проектная работа	Удаленная работа
70	arcu. Vestibulum ante ipsum primis in	15	47368	Проектная работа	Гибкий график
71	lorem vitae odio sagittis semper. Nam tempor	71	243630	Полная занятость	Полный день
72	dis parturient montes, nascetur ridiculus mus. Donec	10	170232	Проектная работа	Полный день
73	natoque penatibus	37	204305	Проектная работа	Гибкий график
74	dolor, tempus non, lacinia at, iaculis quis,	70	266844	Стажировка	Гибкий график
75	orci quis lectus. Nullam suscipit,	36	120906	Частичная занятость	Вахтовый метод
76	eu, odio. Phasellus at augue id	70	72956	Волонтерство	Удаленная работа
77	id, blandit at, nisi. Cum sociis	32	71433	Полная занятость	Гибкий график
78	magna sed dui.	45	174389	Частичная занятость	Вахтовый метод
79	enim commodo hendrerit. Donec	20	119030	Полная занятость	Полный день
80	Donec nibh. Quisque nonummy	6	164218	Частичная занятость	Удаленная работа
81	amet, risus. Donec	68	77800	Проектная работа	Удаленная работа
82	sed dui. Fusce aliquam, enim nec	58	262864	Стажировка	Вахтовый метод
83	Phasellus vitae mauris sit	55	192066	Частичная занятость	Вахтовый метод
84	iaculis enim, sit amet	98	201996	Проектная работа	Полный день
85	id, libero. Donec consectetuer mauris	5	266625	Волонтерство	Удаленная работа
86	non dui nec urna	20	245113	Частичная занятость	Гибкий график
87	Nunc pulvinar arcu et pede. Nunc	98	220966	Стажировка	Сменный график
88	molestie in, tempus eu, ligula. Aenean euismod	90	47597	Проектная работа	Полный день
89	tincidunt adipiscing.	59	172258	Волонтерство	Сменный график
90	tempus scelerisque, lorem	71	132023	Частичная занятость	Удаленная работа
91	ullamcorper. Duis cursus,	10	220537	Полная занятость	Вахтовый метод
92	nascetur ridiculus mus. Proin	74	116291	Проектная работа	Полный день
93	enim. Mauris quis turpis vitae purus	74	29859	Полная занятость	Удаленная работа
94	Integer in magna. Phasellus dolor elit,	59	238943	Проектная работа	Удаленная работа
95	Duis risus odio, auctor vitae, aliquet nec,	65	90696	Волонтерство	Вахтовый метод
96	Maecenas libero	55	20933	Проектная работа	Гибкий график
97	tempor, est ac mattis semper,	19	133489	Стажировка	Гибкий график
98	lorem ac risus. Morbi	68	71754	Волонтерство	Сменный график
99	nec enim. Nunc ut erat. Sed	10	55914	Частичная занятость	Удаленная работа
100	morbi tristique senectus et	42	165761	Волонтерство	Вахтовый метод
\.


--
-- Data for Name: resume_tests_and_exams; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_tests_and_exams (resume_id, education_institution, organization_that_conducted, specialization, year_of_completion) FROM stdin;
1	ut, pellentesque eget, dictum placerat,	sapien. Aenean massa. Integer	aliquet odio. Etiam ligula	2009
2	enim, gravida sit amet, dapibus	Nunc sollicitudin commodo ipsum.	sed turpis	2015
3	pharetra. Quisque ac libero nec ligula consectetuer	scelerisque dui. Suspendisse ac	magna a neque. Nullam ut nisi	2021
4	amet, consectetuer adipiscing elit. Aliquam auctor,	tempus eu, ligula.	Donec sollicitudin adipiscing	2017
5	dolor quam, elementum	ligula. Aliquam erat	mollis dui, in sodales	2019
6	ut, pharetra sed, hendrerit a, arcu. Sed	urna justo faucibus lectus,	Sed pharetra, felis	2013
7	dui. Suspendisse ac metus	Suspendisse eleifend. Cras sed leo.	massa lobortis ultrices. Vivamus	2021
8	vel, vulputate eu,	neque vitae semper egestas,	dictum	2017
8	Ut tincidunt vehicula risus.	neque pellentesque massa lobortis	lectus	2016
10	enim diam vel arcu. Curabitur	senectus et netus et malesuada	mus.	2014
11	lacus. Quisque purus sapien, gravida non, sollicitudin	purus. Maecenas libero	ut erat. Sed nunc est, mollis	2007
12	ornare, facilisis eget,	Proin vel arcu eu	sit amet risus. Donec egestas. Aliquam	2013
17	elit, pharetra ut, pharetra sed,	pellentesque massa lobortis ultrices. Vivamus	lorem vitae odio sagittis semper. Nam tempor	2010
14	lorem fringilla ornare placerat, orci	convallis dolor. Quisque	cursus vestibulum. Mauris magna. Duis dignissim	2009
15	habitant morbi tristique senectus et netus	sociis natoque penatibus et	nascetur	2006
16	a tortor. Nunc commodo auctor velit. Aliquam	sit amet ornare	libero nec ligula consectetuer rhoncus. Nullam velit	2007
17	diam. Proin dolor.	gravida nunc sed pede.	fermentum metus. Aenean sed pede	2006
18	faucibus id, libero. Donec	aptent taciti sociosqu ad	consectetuer ipsum	2020
19	nunc sit amet metus.	Donec sollicitudin adipiscing ligula. Aenean	Praesent luctus. Curabitur egestas nunc sed libero.	2014
20	purus mauris a nunc.	Curabitur vel lectus.	Nam ac nulla. In	2015
21	ac ipsum. Phasellus vitae mauris	non enim commodo	Cras dictum ultricies ligula. Nullam enim. Sed	2011
22	tristique senectus et netus	mauris elit, dictum eu, eleifend	et ultrices posuere cubilia	2006
23	arcu imperdiet ullamcorper. Duis	iaculis, lacus pede	Nam ac nulla. In tincidunt congue	2021
24	eu, ligula. Aenean	dui nec urna suscipit	penatibus et	2022
25	ipsum nunc id enim.	enim commodo hendrerit. Donec	dolor. Quisque tincidunt pede ac urna.	2008
26	lacus. Aliquam rutrum lorem	libero. Morbi accumsan laoreet	mattis. Cras	2005
16	justo sit amet nulla. Donec	orci quis lectus.	ante blandit viverra. Donec	2016
16	leo. Cras vehicula	orci lobortis augue scelerisque	amet, consectetuer adipiscing elit. Curabitur sed	2005
29	Donec est. Nunc	nulla. In tincidunt congue	ac facilisis facilisis, magna tellus faucibus leo,	2006
30	consequat purus. Maecenas libero est,	rutrum eu, ultrices	lacus. Quisque imperdiet, erat nonummy	2008
31	vitae diam. Proin dolor.	sit amet ornare	Proin dolor. Nulla semper tellus id	2019
32	hendrerit consectetuer, cursus et, magna. Praesent	et arcu imperdiet ullamcorper.	arcu. Vestibulum	2019
33	vitae, posuere at, velit. Cras lorem	eu arcu. Morbi	leo elementum sem, vitae aliquam eros	2008
34	vitae sodales nisi magna sed	et malesuada fames	auctor velit.	2018
35	euismod enim. Etiam gravida	sociis natoque penatibus et	lorem. Donec elementum, lorem ut	2008
24	Sed nunc est, mollis non, cursus non,	Fusce aliquet magna a	blandit congue. In scelerisque	2009
37	blandit enim consequat purus.	lorem, vehicula et,	lorem semper auctor. Mauris vel turpis. Aliquam	2010
38	lorem. Donec elementum, lorem ut aliquam iaculis,	mattis. Integer eu lacus.	sagittis augue, eu tempor erat	2006
39	dui augue eu	enim diam vel arcu. Curabitur	vulputate, nisi sem semper erat,	2008
40	Nulla facilisis. Suspendisse commodo tincidunt nibh.	iaculis, lacus pede sagittis augue,	justo. Proin non massa non ante	2016
41	cursus et, magna. Praesent interdum ligula	Cras vehicula aliquet libero.	fringilla ornare	2003
27	urna et arcu imperdiet ullamcorper.	tempor augue ac ipsum.	lobortis. Class aptent taciti sociosqu	2009
43	Donec nibh. Quisque nonummy	neque. In ornare sagittis	Suspendisse eleifend. Cras sed	2009
27	odio sagittis semper. Nam tempor diam dictum	arcu. Vestibulum ante ipsum	arcu	2015
45	et, rutrum eu,	Fusce diam nunc, ullamcorper eu,	Morbi metus. Vivamus euismod urna. Nullam lobortis	2014
46	a ultricies adipiscing, enim	odio tristique pharetra.	metus sit amet ante. Vivamus	2005
47	a, arcu. Sed et	nec urna suscipit	sem. Nulla interdum. Curabitur	2020
48	nibh. Phasellus nulla. Integer vulputate,	at risus. Nunc ac	euismod et,	2007
49	euismod ac, fermentum vel, mauris.	montes, nascetur ridiculus mus. Proin	magna a tortor. Nunc commodo	2005
50	a, malesuada id, erat. Etiam	Sed nunc est, mollis non,	ligula elit, pretium et,	2018
51	pede, nonummy ut, molestie in,	nascetur ridiculus mus. Proin	sapien. Aenean massa.	2012
52	ornare, libero at auctor	tristique pharetra. Quisque ac	a mi	2009
53	non, cursus non, egestas a, dui.	sed dui. Fusce aliquam, enim	odio. Aliquam vulputate	2021
54	Donec est. Nunc ullamcorper, velit in	tellus faucibus leo, in	Duis mi enim, condimentum eget, volutpat ornare,	2007
53	Aenean sed pede nec ante	lorem ipsum sodales purus,	ridiculus	2014
56	sem ut dolor dapibus	vestibulum lorem, sit amet	id, ante. Nunc mauris sapien, cursus	2017
57	elit, pellentesque a,	sapien. Nunc pulvinar arcu et	sed sem egestas blandit. Nam nulla magna,	2020
58	a, arcu. Sed et libero.	ante ipsum primis in	at augue id ante dictum	2020
59	luctus felis purus ac tellus. Suspendisse	vestibulum, neque sed dictum	Quisque nonummy ipsum non arcu.	2012
60	mauris sagittis placerat. Cras	sociis natoque penatibus et	mus.	2013
69	nibh vulputate mauris	ornare, libero at	sit amet, consectetuer adipiscing elit. Curabitur	2017
62	litora torquent per conubia nostra, per	lorem, eget mollis	mauris a	2012
63	congue, elit sed consequat auctor, nunc	gravida sagittis. Duis gravida.	ipsum dolor	2005
64	congue a, aliquet vel,	dolor. Fusce feugiat.	egestas. Duis ac arcu.	2015
65	lobortis ultrices. Vivamus	faucibus leo, in lobortis	pretium aliquet,	2010
66	sapien molestie orci	erat vel pede	erat nonummy	2013
67	nisl. Maecenas malesuada fringilla est.	vestibulum nec, euismod in, dolor.	lobortis augue	2007
68	Proin ultrices. Duis volutpat	arcu. Morbi sit	diam dictum sapien. Aenean massa. Integer	2005
69	ultrices iaculis odio. Nam interdum	eleifend, nunc risus varius orci,	fermentum vel, mauris.	2010
73	felis, adipiscing fringilla, porttitor vulputate, posuere	ac tellus. Suspendisse sed dolor.	mattis ornare, lectus	2016
71	velit. Sed malesuada augue ut	porttitor eros nec tellus. Nunc	non quam. Pellentesque habitant morbi tristique	2019
72	scelerisque mollis. Phasellus libero	lectus rutrum urna, nec	elit. Nulla facilisi. Sed neque. Sed	2015
73	condimentum. Donec at arcu.	Phasellus in felis.	Cras interdum. Nunc sollicitudin commodo	2007
74	ornare. Fusce mollis. Duis	pretium aliquet, metus urna	mi. Aliquam gravida mauris ut mi.	2012
75	non, lobortis quis, pede. Suspendisse dui. Fusce	mi tempor lorem,	at, velit. Cras lorem	2020
76	non, dapibus rutrum,	ullamcorper, nisl arcu iaculis	risus a ultricies adipiscing, enim	2014
77	eros non enim commodo hendrerit. Donec	Aliquam fringilla cursus purus.	vel, faucibus id, libero. Donec consectetuer	2004
77	Aenean egestas hendrerit neque. In ornare	nisl arcu iaculis enim,	scelerisque sed, sapien. Nunc	2008
79	Sed malesuada augue ut lacus.	Nam ac nulla. In	libero nec ligula consectetuer rhoncus.	2006
80	euismod urna. Nullam lobortis quam a	pede. Cum sociis natoque	nec ante. Maecenas	2006
81	Cum sociis natoque penatibus et	nisl arcu iaculis	felis, adipiscing	2012
82	ante ipsum primis in	Aenean gravida nunc sed	Pellentesque tincidunt tempus risus. Donec egestas.	2021
83	lacinia at, iaculis quis, pede.	vitae dolor. Donec fringilla. Donec	augue id ante	2021
84	quis, pede. Suspendisse dui. Fusce	euismod urna. Nullam lobortis	In at pede.	2007
85	dui augue eu tellus. Phasellus	fermentum risus, at	Duis cursus, diam	2008
86	Aenean eget metus.	libero nec ligula consectetuer	diam dictum sapien.	2013
87	mattis. Integer eu lacus. Quisque imperdiet,	odio sagittis semper. Nam	a, auctor non, feugiat nec, diam.	2011
87	morbi tristique senectus et netus	lorem lorem, luctus ut,	Phasellus fermentum convallis ligula. Donec	2005
87	ut ipsum ac mi eleifend egestas. Sed	lectus. Nullam suscipit,	lobortis mauris.	2016
90	euismod est arcu ac orci. Ut	in molestie tortor nibh sit	ornare, lectus ante dictum mi,	2015
91	Etiam laoreet, libero et tristique	egestas a, dui. Cras pellentesque.	vestibulum nec, euismod in, dolor.	2021
92	ligula. Aliquam erat volutpat. Nulla	gravida. Aliquam tincidunt,	sagittis felis. Donec tempor, est ac	2020
93	accumsan convallis, ante lectus convallis est,	scelerisque neque sed sem	tellus non magna.	2003
94	enim non nisi. Aenean	augue ut lacus. Nulla	enim	2008
95	amet metus. Aliquam erat volutpat. Nulla	rutrum, justo. Praesent	arcu. Vestibulum	2015
96	justo sit amet nulla.	dignissim pharetra. Nam	aliquet, metus urna	2018
97	ipsum. Suspendisse sagittis. Nullam	sit amet diam eu	Curabitur dictum.	2011
98	tellus, imperdiet non,	lobortis. Class aptent	sem elit,	2020
99	adipiscing, enim mi tempor lorem, eget	Nulla tempor augue ac	gravida non, sollicitudin a, malesuada id,	2011
100	lorem ac risus. Morbi	volutpat. Nulla dignissim.	ultrices posuere	2017
\.


--
-- Data for Name: resume_work_shedule; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.resume_work_shedule (id, shedule_id, resume_id) FROM stdin;
1	5	44
2	4	40
3	4	36
4	5	91
5	1	56
6	5	82
7	2	11
8	3	99
9	2	84
10	4	57
11	1	40
12	4	14
13	2	20
14	3	49
15	2	67
16	3	22
17	2	27
18	4	23
19	2	46
20	2	99
21	5	18
22	2	71
23	3	33
24	3	6
25	2	26
26	4	82
27	3	90
28	2	51
29	3	16
30	2	23
31	4	39
32	4	31
33	5	41
34	2	70
35	3	94
36	3	12
37	4	30
38	3	48
39	5	96
40	4	83
41	3	20
42	5	48
43	4	21
44	3	31
45	3	55
46	2	44
47	1	89
48	4	4
49	2	2
50	3	57
51	3	62
52	3	56
53	2	58
54	2	35
55	5	47
56	2	45
57	2	8
58	5	80
59	2	40
60	4	75
61	5	81
62	1	5
63	1	21
64	3	97
65	4	100
66	4	99
67	4	86
68	4	23
69	4	22
70	4	64
71	4	89
72	5	93
73	2	67
74	1	91
75	4	36
76	4	23
77	3	92
78	4	34
79	4	2
80	4	73
81	5	73
82	3	23
83	4	23
84	5	46
85	4	44
86	2	15
87	5	84
88	3	16
89	3	75
90	4	29
91	4	65
92	2	92
93	3	17
94	4	22
95	2	55
96	4	29
97	2	32
98	2	98
99	2	48
100	2	23
\.


--
-- Data for Name: reviews_of_employers; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.reviews_of_employers (id, employer_id, vacancy_name, total_score_for_review, positive, negative, working_conditions_stars, group_stars, guide_stars, growth_opportunities_stars, conditions_for_recretions_stars, income_level_stars, created_at) FROM stdin;
2	85	quis, pede. Suspendisse dui.	4	tempus risus. Donec egestas. Duis ac arcu. Nunc	arcu. Vivamus sit amet risus. Donec egestas. Aliquam	1	4	5	2	5	3	2022-04-29 03:58:39
3	48	nisl. Nulla eu neque	4	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada	iaculis enim, sit amet ornare lectus justo eu	4	5	2	4	4	3	2023-05-30 00:38:46
4	64	quam, elementum at, egestas	3	sagittis. Nullam vitae diam. Proin dolor. Nulla semper	nisi dictum augue malesuada malesuada. Integer id magna	4	4	1	1	2	5	2021-12-10 21:35:15
5	31	Aenean eget metus. In	3	dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas	ut mi. Duis risus odio, auctor vitae, aliquet	2	4	2	2	2	3	2022-05-11 23:36:43
6	34	Nam consequat dolor vitae	4	facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean	neque et nunc. Quisque ornare tortor at risus.	4	4	5	4	2	3	2022-01-06 14:06:49
7	1	Donec est mauris, rhoncus	3	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin	erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.	1	4	3	2	3	2	2022-07-29 20:23:08
8	27	Duis elementum, dui quis	2	dictum ultricies ligula. Nullam enim. Sed nulla ante,	cursus a, enim. Suspendisse aliquet, sem ut cursus	3	2	1	2	2	2	2021-11-07 07:53:28
9	43	nisl. Quisque fringilla euismod	3	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.	aliquet odio. Etiam ligula tortor, dictum eu, placerat	3	5	4	2	2	2	2023-04-01 15:06:17
10	91	massa. Vestibulum accumsan neque	2	Mauris ut quam vel sapien imperdiet ornare. In	bibendum sed, est. Nunc laoreet lectus quis massa.	2	1	2	4	2	1	2023-01-30 23:44:45
11	95	augue ac ipsum. Phasellus	3	arcu. Aliquam ultrices iaculis odio. Nam interdum enim	Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas	5	3	2	5	1	2	2022-04-12 02:27:19
12	94	netus et malesuada fames	3	mi tempor lorem, eget mollis lectus pede et	cubilia Curae Phasellus ornare. Fusce mollis. Duis sit	2	3	2	4	3	2	2022-03-05 15:36:25
13	6	tempus eu, ligula. Aenean	4	Nam ligula elit, pretium et, rutrum non, hendrerit	amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse	1	3	4	5	3	5	2022-10-11 16:56:22
14	14	Donec felis orci, adipiscing	3	ut, sem. Nulla interdum. Curabitur dictum. Phasellus in	Aenean eget magna. Suspendisse tristique neque venenatis lacus.	2	3	2	3	4	3	2021-10-20 03:51:41
15	75	in magna. Phasellus dolor	4	ac mi eleifend egestas. Sed pharetra, felis eget	purus ac tellus. Suspendisse sed dolor. Fusce mi	3	3	4	2	5	4	2022-10-01 14:28:53
16	53	lacinia. Sed congue, elit	4	est. Nunc laoreet lectus quis massa. Mauris vestibulum,	a feugiat tellus lorem eu metus. In lorem.	4	2	5	4	3	2	2021-12-26 18:05:43
17	33	eget mollis lectus pede	3	tempor bibendum. Donec felis orci, adipiscing non, luctus	pede, malesuada vel, venenatis vel, faucibus id, libero.	4	2	2	4	3	3	2023-05-31 11:10:40
18	38	ridiculus mus. Proin vel	4	varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas	dictum cursus. Nunc mauris elit, dictum eu, eleifend	4	4	3	3	5	5	2023-03-03 08:34:21
19	19	ultrices a, auctor non,	2	magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum	Nullam velit dui, semper et, lacinia vitae, sodales	1	1	2	5	3	2	2021-11-01 04:47:20
20	42	nec tellus. Nunc lectus	3	adipiscing elit. Aliquam auctor, velit eget laoreet posuere,	ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor	4	1	3	4	1	4	2022-10-11 06:47:25
21	96	consectetuer ipsum nunc id	2	auctor, velit eget laoreet posuere, enim nisl elementum	Aenean massa. Integer vitae nibh. Donec est mauris,	3	1	2	1	1	3	2021-11-25 00:13:33
22	33	dictum augue malesuada malesuada.	3	risus varius orci, in consequat enim diam vel	non, sollicitudin a, malesuada id, erat. Etiam vestibulum	2	4	2	2	2	4	2021-11-28 07:42:07
23	54	gravida sagittis. Duis gravida.	2	Suspendisse aliquet, sem ut cursus luctus, ipsum leo	sodales elit erat vitae risus. Duis a mi	3	1	4	2	2	1	2022-09-08 12:53:43
24	92	erat. Etiam vestibulum massa	4	a, arcu. Sed et libero. Proin mi. Aliquam	magna. Nam ligula elit, pretium et, rutrum non,	3	4	1	4	5	4	2023-01-10 11:03:47
25	73	lacus. Nulla tincidunt, neque	3	metus. Vivamus euismod urna. Nullam lobortis quam a	arcu. Sed eu nibh vulputate mauris sagittis placerat.	1	4	3	4	2	2	2022-12-09 04:03:32
26	87	Aenean gravida nunc sed	3	fringilla. Donec feugiat metus sit amet ante. Vivamus	sit amet, faucibus ut, nulla. Cras eu tellus	1	1	3	3	3	5	2022-08-14 17:31:48
27	73	aliquet libero. Integer in	3	amet, risus. Donec nibh enim, gravida sit amet,	nec tempus mauris erat eget ipsum. Suspendisse sagittis.	2	2	4	2	4	3	2023-04-23 17:57:00
28	56	Vestibulum ut eros non	3	enim, gravida sit amet, dapibus id, blandit at,	Sed nunc est, mollis non, cursus non, egestas	4	3	2	1	2	4	2022-01-05 10:51:01
29	9	arcu eu odio tristique	3	tempor erat neque non quam. Pellentesque habitant morbi	ut cursus luctus, ipsum leo elementum sem, vitae	4	4	2	3	4	2	2023-08-19 05:12:04
30	75	Nulla facilisi. Sed neque.	3	neque tellus, imperdiet non, vestibulum nec, euismod in,	ut, pharetra sed, hendrerit a, arcu. Sed et	5	1	2	3	4	3	2022-05-28 14:45:24
31	1	tincidunt. Donec vitae erat	4	Mauris vel turpis. Aliquam adipiscing lobortis risus. In	nec ante. Maecenas mi felis, adipiscing fringilla, porttitor	4	4	1	4	4	4	2022-12-13 11:32:07
32	12	Ut tincidunt orci quis	3	id ante dictum cursus. Nunc mauris elit, dictum	Sed pharetra, felis eget varius ultrices, mauris ipsum	4	3	1	2	4	1	2023-09-13 09:04:14
33	94	Ut nec urna et	4	adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing	urna et arcu imperdiet ullamcorper. Duis at lacus.	2	5	3	4	2	4	2022-09-08 13:52:04
34	88	enim. Curabitur massa. Vestibulum	4	facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer	aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod	3	5	2	5	2	4	2023-06-22 11:45:35
35	13	lorem, luctus ut, pellentesque	3	facilisis vitae, orci. Phasellus dapibus quam quis diam.	a purus. Duis elementum, dui quis accumsan convallis,	3	2	2	5	2	2	2021-12-16 22:42:59
36	15	nascetur ridiculus mus. Donec	3	ultrices a, auctor non, feugiat nec, diam. Duis	lacinia orci, consectetuer euismod est arcu ac orci.	1	5	4	2	3	4	2021-12-31 16:43:07
37	12	iaculis nec, eleifend non,	4	Donec egestas. Aliquam nec enim. Nunc ut erat.	parturient montes, nascetur ridiculus mus. Proin vel arcu	4	2	4	4	3	5	2022-02-07 06:26:37
38	13	ut, nulla. Cras eu	3	faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec	et ultrices posuere cubilia Curae Donec tincidunt. Donec	4	2	2	4	2	4	2023-10-10 23:36:50
39	70	sem. Nulla interdum. Curabitur	3	litora torquent per conubia nostra, per inceptos hymenaeos.	adipiscing lobortis risus. In mi pede, nonummy ut,	4	1	3	2	4	2	2022-07-20 16:13:41
40	78	Phasellus in felis. Nulla	3	dictum eu, placerat eget, venenatis a, magna. Lorem	rhoncus. Nullam velit dui, semper et, lacinia vitae,	5	4	4	4	1	1	2023-08-18 19:35:07
41	52	ut odio vel est	3	montes, nascetur ridiculus mus. Proin vel nisl. Quisque	eu nibh vulputate mauris sagittis placerat. Cras dictum	2	4	3	3	3	4	2023-01-04 05:59:10
42	87	arcu eu odio tristique	2	porttitor eros nec tellus. Nunc lectus pede, ultrices	cursus a, enim. Suspendisse aliquet, sem ut cursus	2	2	1	3	1	5	2023-09-17 04:02:41
43	68	ultrices. Duis volutpat nunc	4	fringilla. Donec feugiat metus sit amet ante. Vivamus	sem eget massa. Suspendisse eleifend. Cras sed leo.	5	4	2	3	3	3	2022-05-14 09:55:58
44	77	sit amet massa. Quisque	2	nec, malesuada ut, sem. Nulla interdum. Curabitur dictum.	ipsum non arcu. Vivamus sit amet risus. Donec	1	2	2	2	4	1	2022-05-04 21:00:19
45	99	nec ligula consectetuer rhoncus.	4	rhoncus. Nullam velit dui, semper et, lacinia vitae,	neque sed sem egestas blandit. Nam nulla magna,	1	4	5	2	5	3	2022-07-16 15:11:19
46	63	dui. Suspendisse ac metus	2	Proin vel nisl. Quisque fringilla euismod enim. Etiam	magna et ipsum cursus vestibulum. Mauris magna. Duis	1	1	3	1	4	1	2022-12-16 07:22:00
47	62	Sed eu nibh vulputate	4	condimentum. Donec at arcu. Vestibulum ante ipsum primis	est arcu ac orci. Ut semper pretium neque.	5	2	2	4	4	4	2022-10-07 09:37:34
48	72	Vivamus sit amet risus.	3	Aenean massa. Integer vitae nibh. Donec est mauris,	Nullam velit dui, semper et, lacinia vitae, sodales	4	3	2	4	2	2	2022-04-23 15:11:27
49	59	Curabitur ut odio vel	3	dui. Cum sociis natoque penatibus et magnis dis	vel, mauris. Integer sem elit, pharetra ut, pharetra	4	3	2	4	2	1	2023-01-03 16:06:47
50	34	elit elit fermentum risus,	4	eget metus. In nec orci. Donec nibh. Quisque	sodales nisi magna sed dui. Fusce aliquam, enim	5	2	3	4	2	5	2022-09-14 06:53:05
51	33	at augue id ante	3	sit amet ante. Vivamus non lorem vitae odio	urna. Nunc quis arcu vel quam dignissim pharetra.	3	3	4	4	1	2	2023-02-17 08:11:08
52	79	adipiscing, enim mi tempor	3	Pellentesque habitant morbi tristique senectus et netus et	feugiat non, lobortis quis, pede. Suspendisse dui. Fusce	1	2	5	3	2	3	2022-07-23 00:14:10
53	6	enim, gravida sit amet,	3	Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus	mi fringilla mi lacinia mattis. Integer eu lacus.	3	3	3	5	2	3	2023-05-05 09:02:41
54	79	risus quis diam luctus	3	sed turpis nec mauris blandit mattis. Cras eget	velit. Cras lorem lorem, luctus ut, pellentesque eget,	3	1	1	2	4	4	2021-10-24 05:57:20
55	30	egestas rhoncus. Proin nisl	3	ante ipsum primis in faucibus orci luctus et	hendrerit neque. In ornare sagittis felis. Donec tempor,	3	1	1	3	5	4	2021-12-13 13:02:41
56	37	est tempor bibendum. Donec	2	Nulla tincidunt, neque vitae semper egestas, urna justo	facilisis non, bibendum sed, est. Nunc laoreet lectus	4	2	3	1	1	1	2021-12-30 08:45:23
57	45	elit. Etiam laoreet, libero	4	vulputate dui, nec tempus mauris erat eget ipsum.	per inceptos hymenaeos. Mauris ut quam vel sapien	5	4	3	4	4	4	2022-11-20 12:46:39
58	77	vehicula et, rutrum eu,	4	leo. Morbi neque tellus, imperdiet non, vestibulum nec,	enim mi tempor lorem, eget mollis lectus pede	4	2	5	4	3	5	2023-07-12 18:05:05
59	37	tristique pellentesque, tellus sem	3	Quisque imperdiet, erat nonummy ultricies ornare, elit elit	nisi sem semper erat, in consectetuer ipsum nunc	4	2	5	2	2	4	2022-05-24 04:07:07
60	41	Nam ligula elit, pretium	3	Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas	orci, adipiscing non, luctus sit amet, faucibus ut,	1	1	3	5	4	2	2022-11-07 16:27:56
61	5	consectetuer, cursus et, magna.	3	vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis	penatibus et magnis dis parturient montes, nascetur ridiculus	1	5	1	5	2	2	2021-10-17 15:14:25
62	70	Maecenas iaculis aliquet diam.	3	gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus	ante blandit viverra. Donec tempus, lorem fringilla ornare	5	1	5	2	2	3	2023-04-15 22:14:45
63	23	consequat dolor vitae dolor.	3	nisl. Maecenas malesuada fringilla est. Mauris eu turpis.	mauris ut mi. Duis risus odio, auctor vitae,	3	4	3	4	1	1	2022-12-15 04:25:24
64	5	est, congue a, aliquet	3	eu tellus eu augue porttitor interdum. Sed auctor	ullamcorper magna. Sed eu eros. Nam consequat dolor	4	3	1	5	4	1	2023-05-01 03:47:29
65	75	Pellentesque habitant morbi tristique	3	ut, pellentesque eget, dictum placerat, augue. Sed molestie.	Nulla aliquet. Proin velit. Sed malesuada augue ut	3	1	3	3	4	5	2022-11-12 20:13:36
66	37	pretium neque. Morbi quis	3	arcu. Vestibulum ut eros non enim commodo hendrerit.	Duis sit amet diam eu dolor egestas rhoncus.	3	4	2	3	4	2	2023-07-31 10:11:00
67	55	ante lectus convallis est,	3	magna a neque. Nullam ut nisi a odio	posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis	5	4	1	1	2	4	2023-09-01 07:31:23
68	60	lacus pede sagittis augue,	3	eu, ligula. Aenean euismod mauris eu elit. Nulla	adipiscing elit. Aliquam auctor, velit eget laoreet posuere,	5	3	2	2	2	4	2022-10-23 02:41:19
69	48	vehicula et, rutrum eu,	3	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla	ornare placerat, orci lacus vestibulum lorem, sit amet	1	1	3	3	4	4	2023-08-04 07:08:02
70	16	sed libero. Proin sed	2	euismod enim. Etiam gravida molestie arcu. Sed eu	viverra. Donec tempus, lorem fringilla ornare placerat, orci	1	4	3	3	1	2	2023-05-29 21:48:44
71	92	vestibulum lorem, sit amet	4	mattis velit justo nec ante. Maecenas mi felis,	dui quis accumsan convallis, ante lectus convallis est,	5	5	2	3	5	4	2022-07-06 04:04:43
72	12	ut dolor dapibus gravida.	4	Donec est mauris, rhoncus id, mollis nec, cursus	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,	4	3	1	4	4	4	2023-01-26 03:29:20
73	10	Nulla interdum. Curabitur dictum.	3	aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus	a, enim. Suspendisse aliquet, sem ut cursus luctus,	3	3	3	4	4	2	2023-03-08 19:00:52
74	55	accumsan neque et nunc.	4	ipsum. Curabitur consequat, lectus sit amet luctus vulputate,	vestibulum massa rutrum magna. Cras convallis convallis dolor.	3	1	5	4	4	4	2022-03-13 13:12:01
75	47	interdum feugiat. Sed nec	3	eleifend. Cras sed leo. Cras vehicula aliquet libero.	Nullam lobortis quam a felis ullamcorper viverra. Maecenas	3	2	4	2	1	4	2022-07-15 20:43:19
76	42	vulputate mauris sagittis placerat.	4	arcu. Vestibulum ante ipsum primis in faucibus orci	dui. Fusce aliquam, enim nec tempus scelerisque, lorem	4	5	2	3	4	5	2022-01-31 05:00:27
77	56	quis, tristique ac, eleifend	2	justo. Proin non massa non ante bibendum ullamcorper.	aptent taciti sociosqu ad litora torquent per conubia	1	3	3	1	2	3	2022-05-29 08:06:31
78	67	In tincidunt congue turpis.	3	Aliquam adipiscing lobortis risus. In mi pede, nonummy	Donec egestas. Duis ac arcu. Nunc mauris. Morbi	4	4	1	2	5	3	2022-12-02 09:55:07
79	80	at, libero. Morbi accumsan	3	consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet	ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.	4	2	4	3	4	1	2022-11-14 20:44:19
80	88	est mauris, rhoncus id,	4	facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer	mauris. Integer sem elit, pharetra ut, pharetra sed,	2	2	5	5	4	2	2023-10-06 05:02:37
81	23	tristique senectus et netus	4	et ultrices posuere cubilia Curae Phasellus ornare. Fusce	sem ut cursus luctus, ipsum leo elementum sem,	3	5	4	5	1	2	2022-01-10 12:48:20
82	9	sapien, gravida non, sollicitudin	3	dui, semper et, lacinia vitae, sodales at, velit.	ut aliquam iaculis, lacus pede sagittis augue, eu	1	2	3	2	3	5	2022-02-11 09:44:04
83	95	mattis. Cras eget nisi	3	amet, consectetuer adipiscing elit. Aliquam auctor, velit eget	nec urna suscipit nonummy. Fusce fermentum fermentum arcu.	4	1	4	3	2	5	2022-07-08 22:03:06
84	91	Aliquam erat volutpat. Nulla	3	ullamcorper magna. Sed eu eros. Nam consequat dolor	nibh dolor, nonummy ac, feugiat non, lobortis quis,	5	2	3	4	2	3	2022-09-27 07:25:53
85	68	amet nulla. Donec non	3	cursus in, hendrerit consectetuer, cursus et, magna. Praesent	magna. Duis dignissim tempor arcu. Vestibulum ut eros	3	2	1	5	2	3	2022-12-13 08:48:38
86	83	ultricies ornare, elit elit	2	Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus	suscipit, est ac facilisis facilisis, magna tellus faucibus	5	1	2	3	2	1	2022-04-27 23:11:47
87	43	enim. Etiam gravida molestie	4	quam. Pellentesque habitant morbi tristique senectus et netus	consectetuer mauris id sapien. Cras dolor dolor, tempus	4	2	3	4	4	4	2023-10-02 08:31:02
88	25	sed pede nec ante	3	nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus	ridiculus mus. Donec dignissim magna a tortor. Nunc	3	3	5	1	5	2	2023-07-04 12:49:24
89	55	ridiculus mus. Aenean eget	3	euismod mauris eu elit. Nulla facilisi. Sed neque.	erat nonummy ultricies ornare, elit elit fermentum risus,	2	2	5	5	3	2	2022-01-28 23:33:54
90	46	consequat purus. Maecenas libero	3	egestas nunc sed libero. Proin sed turpis nec	gravida. Praesent eu nulla at sem molestie sodales.	2	3	5	3	3	3	2022-07-25 18:55:12
91	62	molestie pharetra nibh. Aliquam	3	sollicitudin a, malesuada id, erat. Etiam vestibulum massa	auctor velit. Aliquam nisl. Nulla eu neque pellentesque	3	2	4	2	4	3	2022-10-21 23:02:38
92	19	bibendum ullamcorper. Duis cursus,	3	Nulla eu neque pellentesque massa lobortis ultrices. Vivamus	penatibus et magnis dis parturient montes, nascetur ridiculus	2	4	5	1	5	2	2023-07-21 12:40:39
93	47	imperdiet ullamcorper. Duis at	4	ante bibendum ullamcorper. Duis cursus, diam at pretium	Integer sem elit, pharetra ut, pharetra sed, hendrerit	4	5	1	5	2	4	2023-07-05 14:37:07
94	52	nonummy ipsum non arcu.	3	metus. Vivamus euismod urna. Nullam lobortis quam a	magnis dis parturient montes, nascetur ridiculus mus. Aenean	1	4	2	2	4	3	2022-07-26 09:15:43
95	45	Quisque ac libero nec	3	dignissim lacus. Aliquam rutrum lorem ac risus. Morbi	per inceptos hymenaeos. Mauris ut quam vel sapien	4	2	4	1	3	2	2023-08-09 13:47:47
96	7	penatibus et magnis dis	2	id, ante. Nunc mauris sapien, cursus in, hendrerit	aliquet vel, vulputate eu, odio. Phasellus at augue	1	2	1	3	4	2	2022-09-24 17:59:37
97	3	dolor sit amet, consectetuer	4	aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod	nonummy ultricies ornare, elit elit fermentum risus, at	2	5	3	1	5	4	2023-06-24 04:07:53
98	84	lobortis quis, pede. Suspendisse	2	bibendum fermentum metus. Aenean sed pede nec ante	ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam	1	1	2	2	3	5	2023-05-31 07:25:40
99	81	vel est tempor bibendum.	3	et tristique pellentesque, tellus sem mollis dui, in	vehicula et, rutrum eu, ultrices sit amet, risus.	1	5	4	3	3	3	2023-08-07 16:55:35
100	51	lorem tristique aliquet. Phasellus	4	porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla	Integer sem elit, pharetra ut, pharetra sed, hendrerit	4	3	3	5	3	4	2022-09-27 21:48:42
101	62	arcu. Vestibulum ante ipsum	3	lectus quis massa. Mauris vestibulum, neque sed dictum	lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam	3	4	2	4	1	5	2022-09-08 09:22:39
\.


--
-- Data for Name: specializations; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.specializations (id, name, industry_id) FROM stdin;
1	congue a,	13
2	eget metus	3
3	interdum ligula	12
4	vitae, orci.	6
5	lectus. Nullam	7
6	Mauris vel	7
7	iaculis enim,	13
8	egestas. Sed	3
9	amet nulla.	4
10	egestas. Aliquam	1
11	vulputate dui,	9
12	accumsan laoreet	13
13	laoreet lectus	13
14	vulputate mauris	2
15	a, enim.	11
16	dui. Cras	5
17	Sed molestie.	8
18	at, nisi.	9
19	Mauris nulla.	6
20	luctus lobortis.	2
21	ut, pharetra	3
22	mauris. Integer	6
23	neque non	11
24	metus. In	9
25	risus. Donec	8
26	at fringilla	6
27	pede sagittis	13
28	ornare lectus	13
29	dolor dolor,	5
30	ut, pharetra	12
31	ultricies sem	6
32	dapibus id,	3
33	blandit viverra.	15
34	libero dui	2
35	est, congue	10
36	non lorem	8
37	dapibus rutrum,	4
38	volutpat. Nulla	13
39	consectetuer euismod	6
40	velit eu	11
41	dignissim magna	4
42	Fusce aliquam,	7
43	scelerisque, lorem	2
44	sit amet,	5
45	varius orci,	2
46	varius ultrices,	6
47	risus. In	5
48	arcu vel	4
49	orci. Ut	3
50	porttitor scelerisque	11
51	tempor bibendum.	8
52	Sed diam	15
53	sociis natoque	5
54	gravida sagittis.	5
55	sed dui.	2
56	nec, cursus	15
57	vulputate, nisi	5
58	eget, venenatis	8
59	lacus vestibulum	3
60	bibendum fermentum	3
61	ullamcorper magna.	8
62	erat, in	12
63	velit dui,	10
64	Etiam imperdiet	15
65	facilisis lorem	12
66	feugiat non,	7
67	facilisis eget,	8
68	tincidunt adipiscing.	13
69	Aliquam nec	1
70	sapien, gravida	13
71	vitae odio	12
72	nisl. Maecenas	3
73	Donec non	2
74	nisi nibh	15
75	in aliquet	13
76	Vivamus sit	12
77	semper egestas,	13
78	pharetra, felis	12
79	dictum sapien.	11
80	Praesent interdum	14
81	hendrerit id,	7
82	fringilla est.	10
83	Nunc pulvinar	15
84	Sed congue,	13
85	ipsum leo	5
86	odio sagittis	9
87	convallis dolor.	9
88	parturient montes,	10
89	semper erat,	14
90	pellentesque a,	3
91	nec, leo.	3
92	Vivamus rhoncus.	10
93	Suspendisse ac	5
94	arcu et	7
95	Aenean sed	8
96	nec enim.	8
97	eget massa.	2
98	ornare, facilisis	12
99	Mauris quis	4
100	magna. Sed	9
\.


--
-- Data for Name: visibility_resume; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.visibility_resume (id, name) FROM stdin;
1	Видно компаниям-клиентам HeadHunter
2	Видно выбранным компаниям
3	Скрыто от выбранных компаний, видно остальным
4	Видно только по прямой ссылке
5	Не видно никому
\.


--
-- Data for Name: work_experience; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.work_experience (id, experience) FROM stdin;
1	Не имеет значения
2	Нет опыта
3	От 1 года до 3 лет
4	От 3 до 6 лет
5	Более 6 лет
\.


--
-- Data for Name: work_shedule; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.work_shedule (id, name) FROM stdin;
1	Полный день
2	Сменный график
3	Гибкий график
4	Удаленная работа
5	Вахтовый метод
\.


--
-- Data for Name: workers; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.workers (id, first_name, last_name, email, telephone, created_at, job_search_area_id) FROM stdin;
1	Aidan	Stanley	nunc.in@hotmail.ca	92463769147	2023-09-19 22:08:36	57
2	Alexander	Sanchez	pellentesque.eget.dictum@yahoo.ca	34385072880	2022-03-16 19:49:51	27
3	Chloe	Key	erat.vel@yahoo.com	16330404545	2022-10-31 14:52:07	81
4	Colleen	Chen	sed.turpis.nec@aol.org	27223862234	2022-03-04 16:01:40	15
5	Jael	Cash	enim.nisl@icloud.ca	92652867861	2022-04-13 09:05:50	17
6	Herrod	Randall	consectetuer.rhoncus@outlook.net	40205212041	2023-07-10 06:38:24	14
7	Elton	Griffith	adipiscing.ligula@outlook.net	20706682522	2022-11-22 20:24:58	15
8	Cally	Roman	in.molestie.tortor@yahoo.com	31424476984	2022-08-24 16:05:47	81
9	Odette	Quinn	magnis.dis@outlook.couk	53686221825	2022-01-26 23:15:44	37
10	Deirdre	Underwood	donec@outlook.net	23756459911	2022-11-24 11:04:39	37
11	Portia	Bray	id.magna@yahoo.couk	95153862205	2022-07-16 03:11:45	61
12	Thor	Finch	diam.lorem@outlook.edu	26120936776	2022-06-05 11:54:38	2
13	Amena	Vaughn	sit.amet@hotmail.com	80627729650	2022-04-20 17:13:00	64
14	Peter	Hickman	placerat@outlook.couk	28795237360	2023-10-15 03:33:56	85
15	Imogene	Boyer	nulla@icloud.couk	17830907816	2023-09-09 16:11:05	28
16	Summer	Myers	eget.magna@hotmail.org	99834237937	2023-09-04 06:08:26	84
17	Jameson	Beach	leo@google.ca	12307758981	2022-11-13 03:29:24	15
18	Noelani	Delgado	at.pretium.aliquet@google.net	48117280674	2022-09-23 02:22:21	78
19	Debra	Rosario	dignissim.magna@hotmail.couk	49188425401	2021-10-24 02:30:47	57
20	Abigail	Miles	aliquam.eu.accumsan@outlook.edu	33850557340	2022-02-11 08:22:39	8
21	Liberty	Mitchell	rutrum.fusce.dolor@protonmail.com	24583197208	2022-07-21 08:33:15	47
22	Magee	Mcintosh	risus.donec@hotmail.org	29027210015	2022-04-07 23:42:28	65
23	Wendy	Foster	mollis.nec@hotmail.couk	26020645131	2022-06-04 14:31:16	38
24	Basil	Burks	porttitor.tellus@aol.com	93968332232	2022-09-25 09:14:22	25
25	Kameko	Keith	turpis.egestas@hotmail.com	36477075813	2022-03-21 14:37:36	69
26	Oleg	Whitney	elit@protonmail.net	34402109458	2022-11-29 00:38:47	22
27	Rashad	Chan	ac@icloud.org	85725620439	2022-02-16 18:23:08	57
28	Nora	Knowles	dui@hotmail.net	4489553447	2022-06-04 23:05:19	31
29	Kareem	Villarreal	arcu@icloud.edu	9399896568	2022-03-01 04:15:47	74
30	Quinn	Riggs	eget.ipsum@hotmail.couk	28207720232	2022-01-20 10:52:42	56
31	Juliet	Wiggins	sapien@outlook.com	42024423122	2022-11-26 22:12:30	51
32	Octavius	Witt	risus.morbi@hotmail.edu	27853245983	2022-05-31 23:53:18	22
33	Evangeline	Mcdaniel	massa@outlook.net	41362906254	2023-07-29 04:03:46	68
34	Anne	Cain	aliquam.erat.volutpat@google.ca	38770644460	2023-02-19 14:39:55	43
35	Laith	Ball	fringilla@protonmail.org	78523516640	2023-04-07 02:42:17	10
36	Byron	Dorsey	sodales@yahoo.ca	28335084637	2022-11-17 17:24:25	72
37	Patricia	Romero	nulla.tincidunt@aol.org	92161827398	2022-11-23 21:47:25	63
38	Clark	Key	sed.et@aol.com	39761866501	2023-06-30 03:25:44	85
39	Jameson	Hinton	enim.suspendisse.aliquet@google.org	53406690703	2023-08-06 06:53:34	50
40	Abra	Sutton	enim.diam.vel@yahoo.edu	43852928546	2022-11-12 00:46:42	75
41	Uriel	Moreno	a.dui.cras@google.ca	70452737036	2023-02-06 07:20:47	40
42	Cruz	Santiago	adipiscing.enim@protonmail.couk	78822861487	2022-07-26 20:05:54	81
43	Kasimir	Hart	congue@outlook.ca	25265856569	2023-04-23 13:06:37	48
44	Lillian	Page	ut@google.org	39601929542	2022-05-08 19:26:00	76
45	Nicholas	Morrow	aliquet.metus.urna@protonmail.org	88118213513	2023-01-13 19:28:02	77
46	Caleb	Jacobs	luctus.aliquet@yahoo.ca	75425667054	2023-05-25 09:59:16	79
47	Christine	Riggs	aliquam.erat@outlook.couk	56668714941	2022-07-16 03:18:42	33
48	Gannon	Cote	sed.dui@outlook.couk	49483306539	2022-10-29 13:10:21	13
49	Wyatt	Newton	penatibus@google.edu	25876195760	2023-09-18 00:51:21	71
50	Ishmael	Morse	vel.arcu@google.com	88061181199	2022-02-27 03:14:08	3
51	Robin	Carney	et.tristique@aol.com	80380426051	2022-03-23 12:18:44	19
52	Imelda	Olsen	elit.curabitur@google.org	63057404812	2023-01-03 13:45:20	4
53	Hall	Sims	magnis.dis@protonmail.org	87128460412	2023-08-28 05:45:13	51
54	Hollee	Butler	enim.nunc.ut@hotmail.edu	55205030979	2023-07-13 12:45:02	68
55	Rae	Beach	facilisis.magna@protonmail.net	36781909057	2023-09-06 01:39:22	79
56	Lenore	Goodwin	ullamcorper@outlook.ca	17990746564	2021-11-11 01:47:54	70
57	Chandler	Marks	massa.vestibulum.accumsan@aol.couk	52030323872	2023-05-26 07:24:03	35
58	Latifah	Rice	neque.venenatis.lacus@icloud.edu	25564106124	2022-08-25 00:55:50	46
59	Gage	Valentine	quis.diam@aol.ca	87137369463	2022-07-30 07:03:34	40
60	Lynn	Odom	aenean@google.net	87011674408	2023-06-25 17:07:57	80
61	Regan	Ochoa	pretium.aliquet@outlook.org	80413580397	2022-09-01 05:08:28	56
62	Boris	Stein	lorem.eget.mollis@icloud.org	82954449557	2023-10-10 13:50:02	66
63	Scarlet	Bonner	sit.amet@google.org	77159331126	2023-03-03 16:35:45	21
64	Paula	Salazar	a.sollicitudin.orci@icloud.edu	14622265697	2023-09-09 02:54:55	23
65	Nathan	Burch	odio.semper.cursus@yahoo.couk	21572188056	2022-12-05 14:52:45	31
66	Geraldine	Brock	ipsum.sodales@aol.com	86494747934	2023-03-17 20:05:13	60
67	Kiona	Bush	dui.semper.et@yahoo.edu	91732210961	2022-11-17 21:20:54	70
68	Basia	Harding	viverra@protonmail.couk	48210281426	2022-06-06 10:47:53	26
69	Daquan	Cooper	tempor@yahoo.ca	92995252333	2023-07-25 11:25:16	60
70	Hamish	Nunez	mollis.lectus.pede@google.net	75861682258	2022-11-12 15:22:14	25
71	Armand	Cantu	mi.ac@yahoo.net	89499654547	2023-07-08 04:01:27	27
72	Vivian	Harvey	luctus.et@hotmail.org	62507378493	2022-05-09 09:38:31	5
73	Sebastian	Ramsey	phasellus@icloud.couk	49126488544	2022-11-07 03:45:41	47
74	Channing	Mcconnell	est@aol.org	56199418270	2023-03-21 12:22:06	42
75	Clare	Leblanc	eget.venenatis@icloud.edu	10133713795	2022-12-25 11:41:27	64
76	Bruce	Gallegos	nisi.cum@icloud.net	9592867467	2023-09-09 03:52:59	84
77	Britanney	Yang	a.tortor@hotmail.net	95222132674	2021-11-21 00:56:39	26
78	Sebastian	Fuller	in.lobortis@protonmail.edu	41466398592	2023-07-29 22:06:06	4
79	Sawyer	Shannon	mollis.lectus@outlook.edu	9619614481	2023-08-11 13:39:13	16
80	Deanna	Hebert	non.enim@protonmail.com	87330062522	2023-01-09 05:44:23	79
81	Preston	Sloan	auctor@yahoo.net	22739066531	2023-09-07 07:02:54	53
82	Reuben	Larson	nisl.quisque@aol.org	55843820520	2022-07-05 08:11:03	11
83	Cleo	Ramirez	nunc.ut@yahoo.edu	60823786862	2023-02-26 08:54:38	5
84	Miranda	Davis	sed.leo@icloud.couk	43190240014	2022-01-29 08:57:59	84
85	Ruby	Webster	suspendisse@aol.net	67249363780	2022-11-10 00:50:45	60
86	Yvette	Tanner	ligula.donec@hotmail.net	51921602571	2022-02-03 23:02:19	48
87	Amaya	Holcomb	eu.arcu.morbi@google.edu	26348688751	2021-10-19 01:42:44	57
88	Kevyn	Lyons	adipiscing.lobortis@google.com	44508406004	2021-10-31 12:07:18	13
89	Arthur	Lawson	enim.consequat.purus@icloud.org	80725301151	2022-09-11 07:44:12	83
90	Alice	Contreras	euismod.enim@yahoo.ca	23745189507	2023-07-06 13:53:05	73
91	Amelia	Petersen	at.egestas@protonmail.edu	81247451617	2022-03-12 22:50:05	51
92	Tatum	Pacheco	accumsan@icloud.com	87065201076	2023-01-07 20:43:55	41
93	Fatima	Lindsey	eleifend.egestas@protonmail.com	26495268976	2023-03-18 15:26:58	61
94	Scarlett	Pitts	non@yahoo.org	64928175570	2023-06-01 03:45:31	3
95	Irene	Hill	magna.tellus.faucibus@icloud.couk	30637644834	2022-09-23 09:39:02	62
96	Theodore	Roach	egestas@hotmail.ca	57325692632	2022-10-15 16:55:29	72
97	Ashely	Bush	imperdiet@aol.net	74387893867	2023-07-18 11:47:40	70
98	Myra	Macias	facilisi@yahoo.net	37526063352	2023-02-23 17:05:26	53
99	Joseph	Houston	faucibus.orci@google.edu	42281605555	2021-12-31 01:53:07	13
100	Ivy	Rojas	non.dui@yahoo.org	29917034883	2021-10-22 12:45:58	78
\.


--
-- Data for Name: workers_resume; Type: TABLE DATA; Schema: public; Owner: hh_admin
--

COPY public.workers_resume (id, worker_id, photo_url, info, availability_of_car, drivers_lisense, native_language, visibility_id, created_at) FROM stdin;
1	96	cnn.com?ab=441&aad=2	arcu. Curabitur ut odio vel est tempor bibendum. Donec	f	{BE}	Итальянский	2	2022-02-11 09:19:33
2	68	nytimes.com?q=4	non nisi. Aenean eget metus. In nec orci. Donec nibh.	f	{BE}	Немецкий	5	2021-10-30 22:46:59
3	76	pinterest.com?page=1&offset=1	porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris	t	{BE}	Итальянский	4	2021-10-06 07:28:32
4	90	yahoo.com?q=11	rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit.	t	{B}	Русский	2	2021-11-09 20:02:12
5	27	twitter.com?search=1	nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.	f	{Tb}	Немецкий	4	2022-10-02 11:21:26
6	67	zoom.us?search=1	augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum.	t	{Tb}	Французский	4	2022-10-13 08:15:50
7	20	zoom.us?page=1&offset=1	mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,	t	{C}	Немецкий	3	2022-04-20 11:03:21
8	55	nytimes.com?str=se	vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non	t	{E}	Английский	4	2021-09-09 12:04:21
9	45	bbc.co.uk?q=test	neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer	f	{B}	Немецкий	1	2021-10-20 18:00:05
10	72	wikipedia.org?q=4	augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique	t	{B}	Немецкий	2	2022-09-26 05:33:55
11	47	pinterest.com?q=0	luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus	f	{B}	Итальянский	2	2021-08-22 10:02:03
12	82	pinterest.com?gi=100	neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio	f	{DE}	Немецкий	2	2022-06-12 06:00:20
13	87	zoom.us?page=1&offset=1	fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut	t	{B}	Русский	3	2022-08-27 11:32:15
14	46	youtube.com?q=4	pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,	f	{A}	Французский	3	2021-11-27 02:50:17
15	58	instagram.com?q=test	libero et tristique pellentesque, tellus sem mollis dui, in sodales	t	{DE}	Английский	2	2022-05-22 10:58:07
16	78	yahoo.com?q=11	enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie	t	{E}	Английский	4	2022-01-13 08:23:35
17	66	youtube.com?search=1	in consequat enim diam vel arcu. Curabitur ut odio vel	t	{B}	Итальянский	4	2021-10-10 05:30:11
18	97	yahoo.com?client=g	bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque	f	{B}	Немецкий	2	2022-08-31 10:04:18
19	76	zoom.us?str=se	vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada	t	{CE}	Французский	5	2022-06-13 02:10:54
20	55	walmart.com?q=test	Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis	f	{A}	Французский	3	2022-03-13 13:16:07
21	28	nytimes.com?gi=100	nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in	f	{Tb}	Немецкий	4	2022-03-29 17:33:34
22	72	ebay.com?q=11	Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam	t	{Tb}	Русский	5	2021-08-18 09:56:18
23	19	zoom.us?search=1	et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna	f	{D}	Английский	3	2022-05-25 18:48:27
24	53	reddit.com?q=4	In at pede. Cras vulputate velit eu sem. Pellentesque	f	{CE}	Английский	4	2022-07-31 10:15:15
25	38	bbc.co.uk?q=11	sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam	t	{C}	Итальянский	4	2022-08-13 12:45:51
26	69	instagram.com?q=4	montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim.	t	{E}	Немецкий	1	2022-05-23 06:56:48
27	33	youtube.com?g=1	Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget	t	{DE}	Русский	4	2022-06-10 14:08:40
28	29	bbc.co.uk?g=1	ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget	t	{E}	Английский	1	2021-09-03 08:17:42
29	9	reddit.com?page=1&offset=1	nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est.	t	{Tb}	Русский	1	2022-06-04 01:14:13
30	66	wikipedia.org?search=1	nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus	f	{CE}	Французский	1	2021-11-14 06:19:12
31	39	reddit.com?gi=100	sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.	t	{C}	Английский	5	2022-02-27 11:49:10
32	90	google.com?g=1	at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus	f	{BE}	Русский	2	2022-09-26 11:30:33
33	77	pinterest.com?g=1	ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,	t	{Tb}	Итальянский	3	2021-07-23 06:08:07
34	31	whatsapp.com?p=8	tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,	f	{B}	Английский	4	2022-09-02 13:24:54
35	26	zoom.us?gi=100	Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero	t	{BE}	Английский	5	2022-09-10 21:48:50
36	33	ebay.com?q=0	felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu	f	{D}	Итальянский	4	2021-08-14 19:23:37
37	11	reddit.com?search=1	dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum	t	{A}	Русский	3	2022-07-05 22:38:34
38	30	nytimes.com?ad=115	lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis	t	{E}	Русский	4	2022-09-16 05:58:17
39	66	guardian.co.uk?search=1	aliquet vel, vulputate eu, odio. Phasellus at augue id ante	f	{DE}	Русский	4	2021-10-12 03:12:15
40	39	facebook.com?q=4	fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo	f	{C}	Итальянский	2	2022-05-20 19:00:30
41	59	zoom.us?ad=115	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis.	f	{E}	Французский	5	2022-01-12 05:58:34
42	83	facebook.com?ad=115	tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum	t	{D}	Русский	2	2021-12-10 21:01:29
43	79	pinterest.com?search=1&q=de	neque. Nullam ut nisi a odio semper cursus. Integer	f	{Tb}	Английский	2	2021-09-25 16:23:51
44	5	pinterest.com?q=test	cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue.	t	{D}	Немецкий	2	2021-07-08 14:35:39
45	64	instagram.com?str=se	cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur	t	{D}	Французский	3	2022-08-19 14:52:54
46	100	ebay.com?q=11	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc	t	{BE}	Французский	3	2022-07-30 19:10:45
47	65	pinterest.com?ab=441&aad=2	feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor,	t	{C}	Французский	4	2022-10-07 04:47:54
48	59	cnn.com?gi=100	massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor	f	{DE}	Французский	5	2021-11-13 12:29:12
49	39	bbc.co.uk?ab=441&aad=2	Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non	f	{BE}	Русский	4	2021-09-09 11:08:08
50	24	facebook.com?g=1	risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis	t	{BE}	Английский	2	2022-09-21 09:23:05
51	49	ebay.com?p=8	Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	t	{CE}	Английский	2	2022-01-22 22:45:35
52	59	reddit.com?ab=441&aad=2	amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan	t	{D}	Русский	2	2022-01-21 01:23:19
53	51	reddit.com?k=0	ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel	t	{Tb}	Французский	2	2022-02-04 04:44:44
54	98	baidu.com?str=se	eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent	f	{CE}	Русский	4	2022-05-17 20:28:30
55	34	pinterest.com?search=1	sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique	f	{CE}	Французский	3	2022-03-17 21:39:07
56	93	twitter.com?q=4	vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend	t	{BE}	Итальянский	2	2022-03-01 04:22:14
57	94	baidu.com?k=0	aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida.	t	{D}	Французский	3	2022-01-30 23:26:23
58	89	walmart.com?q=4	fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,	t	{BE}	Английский	5	2022-07-30 04:05:29
59	5	nytimes.com?ab=441&aad=2	Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium	t	{BE}	Французский	3	2022-01-17 22:50:53
60	26	baidu.com?g=1	congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum.	t	{C}	Немецкий	3	2022-07-15 20:35:37
61	11	yahoo.com?k=0	ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse	f	{BE}	Русский	1	2021-09-30 22:35:13
62	23	youtube.com?q=11	lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi	t	{D}	Немецкий	3	2022-07-07 07:15:40
63	92	ebay.com?q=0	nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non,	t	{DE}	Французский	5	2022-02-05 03:46:10
64	39	pinterest.com?gi=100	metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis	f	{C}	Итальянский	2	2022-03-20 18:05:44
65	98	instagram.com?page=1&offset=1	id magna et ipsum cursus vestibulum. Mauris magna. Duis	t	{B}	Итальянский	4	2022-09-21 02:53:31
66	21	baidu.com?search=1&q=de	Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae	f	{DE}	Французский	1	2022-07-15 20:00:48
67	91	wikipedia.org?ab=441&aad=2	egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros.	f	{Tb}	Немецкий	5	2021-11-18 21:27:53
68	4	pinterest.com?p=8	urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	f	{B}	Французский	3	2021-11-09 08:42:50
69	52	nytimes.com?client=g	lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.	f	{BE}	Русский	4	2022-10-10 12:31:06
70	57	facebook.com?p=8	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae	t	{A}	Английский	3	2022-10-09 03:54:45
71	11	naver.com?ab=441&aad=2	dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper	t	{Tb}	Французский	5	2022-01-13 05:54:07
72	57	bbc.co.uk?page=1&offset=1	augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris	t	{E}	Итальянский	5	2021-07-13 05:53:25
73	36	zoom.us?client=g	elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis	f	{BE}	Английский	3	2021-12-01 02:20:45
74	35	guardian.co.uk?k=0	dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse	t	{Tb}	Французский	2	2021-09-03 12:39:43
75	84	zoom.us?client=g	mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec	t	{C}	Немецкий	2	2021-12-21 05:38:55
76	17	wikipedia.org?p=8	dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec	f	{D}	Французский	1	2021-07-13 00:14:23
77	34	wikipedia.org?q=4	Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi	f	{C}	Английский	5	2021-12-07 05:29:34
78	12	instagram.com?ad=115	nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut	f	{D}	Русский	1	2022-06-22 05:56:43
79	78	bbc.co.uk?client=g	sit amet ante. Vivamus non lorem vitae odio sagittis	f	{DE}	Французский	1	2021-10-22 23:36:51
80	40	baidu.com?q=0	Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla	t	{BE}	Итальянский	4	2021-08-27 17:51:15
81	16	wikipedia.org?search=1&q=de	Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis.	t	{CE}	Французский	3	2022-09-07 15:41:28
82	13	ebay.com?k=0	non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at	t	{C}	Немецкий	2	2021-07-21 08:37:47
83	93	wikipedia.org?q=0	Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas	t	{Tb}	Немецкий	1	2022-07-04 22:35:27
84	81	ebay.com?p=8	dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio	t	{E}	Русский	1	2021-12-16 11:04:10
85	71	zoom.us?search=1	taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam	f	{E}	Английский	3	2021-08-01 23:51:44
86	64	walmart.com?q=11	eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis	t	{DE}	Немецкий	3	2021-08-13 17:16:02
87	2	netflix.com?g=1	risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean	t	{A}	Русский	3	2021-11-01 12:57:56
88	79	bbc.co.uk?q=4	consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc	t	{CE}	Русский	3	2021-11-18 01:50:18
89	48	instagram.com?k=0	dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio	t	{CE}	Немецкий	3	2021-11-14 22:18:11
90	2	wikipedia.org?g=1	lectus pede et risus. Quisque libero lacus, varius et, euismod et,	t	{BE}	Французский	1	2021-07-19 07:06:40
91	97	ebay.com?ad=115	magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla	f	{BE}	Русский	1	2022-06-29 17:14:24
92	98	bbc.co.uk?search=1	dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor.	f	{DE}	Русский	1	2021-11-24 03:46:44
93	5	youtube.com?ad=115	Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus.	f	{B}	Французский	1	2022-08-05 00:33:23
94	2	guardian.co.uk?g=1	Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum	f	{B}	Русский	5	2022-08-24 15:57:00
95	20	nytimes.com?q=4	tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.	f	{Tb}	Русский	2	2021-10-10 23:51:41
96	39	nytimes.com?q=0	est, mollis non, cursus non, egestas a, dui. Cras pellentesque.	f	{Tb}	Немецкий	4	2022-03-30 06:12:33
97	21	facebook.com?gi=100	lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis	f	{E}	Французский	2	2021-12-12 08:51:55
98	28	reddit.com?q=test	facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et	f	{B}	Английский	2	2022-03-16 15:37:33
99	96	youtube.com?str=se	ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et	t	{DE}	Русский	3	2022-08-23 14:52:27
100	42	bbc.co.uk?q=0	a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et	t	{A}	Итальянский	4	2022-10-09 15:29:45
\.


--
-- Name: busyness_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.busyness_id_seq', 5, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.cities_id_seq', 100, true);


--
-- Name: employee_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.employee_responses_id_seq', 1, false);


--
-- Name: employer_feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.employer_feedbacks_id_seq', 3, true);


--
-- Name: employers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.employers_id_seq', 100, true);


--
-- Name: industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.industries_id_seq', 15, true);


--
-- Name: job_openings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.job_openings_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.regions_id_seq', 82, true);


--
-- Name: resume_busyness_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.resume_busyness_id_seq', 100, true);


--
-- Name: resume_work_shedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.resume_work_shedule_id_seq', 100, true);


--
-- Name: reviews_of_employers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.reviews_of_employers_id_seq', 101, true);


--
-- Name: specializations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.specializations_id_seq', 100, true);


--
-- Name: visibility_resume_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.visibility_resume_id_seq', 5, true);


--
-- Name: work_experience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.work_experience_id_seq', 5, true);


--
-- Name: work_shedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.work_shedule_id_seq', 5, true);


--
-- Name: workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.workers_id_seq', 100, true);


--
-- Name: workers_resume_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hh_admin
--

SELECT pg_catalog.setval('public.workers_resume_id_seq', 100, true);


--
-- Name: busyness busyness_name_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.busyness
    ADD CONSTRAINT busyness_name_key UNIQUE (name);


--
-- Name: busyness busyness_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.busyness
    ADD CONSTRAINT busyness_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: employee_responses employee_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employee_responses
    ADD CONSTRAINT employee_responses_pkey PRIMARY KEY (id);


--
-- Name: employer_feedbacks employer_feedbacks_name_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employer_feedbacks
    ADD CONSTRAINT employer_feedbacks_name_key UNIQUE (name);


--
-- Name: employer_feedbacks employer_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employer_feedbacks
    ADD CONSTRAINT employer_feedbacks_pkey PRIMARY KEY (id);


--
-- Name: employers employers_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (id);


--
-- Name: industries industries_name_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_name_key UNIQUE (name);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (id);


--
-- Name: job_openings job_openings_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.job_openings
    ADD CONSTRAINT job_openings_pkey PRIMARY KEY (id);


--
-- Name: mailing_and_notifications mailing_and_notifications_worker_id_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.mailing_and_notifications
    ADD CONSTRAINT mailing_and_notifications_worker_id_key UNIQUE (worker_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: resume_busyness resume_busyness_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_busyness
    ADD CONSTRAINT resume_busyness_pkey PRIMARY KEY (id);


--
-- Name: resume_work_shedule resume_work_shedule_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_work_shedule
    ADD CONSTRAINT resume_work_shedule_pkey PRIMARY KEY (id);


--
-- Name: reviews_of_employers reviews_of_employers_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.reviews_of_employers
    ADD CONSTRAINT reviews_of_employers_pkey PRIMARY KEY (id);


--
-- Name: specializations specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


--
-- Name: visibility_resume visibility_resume_name_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.visibility_resume
    ADD CONSTRAINT visibility_resume_name_key UNIQUE (name);


--
-- Name: visibility_resume visibility_resume_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.visibility_resume
    ADD CONSTRAINT visibility_resume_pkey PRIMARY KEY (id);


--
-- Name: work_experience work_experience_experience_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.work_experience
    ADD CONSTRAINT work_experience_experience_key UNIQUE (experience);


--
-- Name: work_experience work_experience_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.work_experience
    ADD CONSTRAINT work_experience_pkey PRIMARY KEY (id);


--
-- Name: work_shedule work_shedule_name_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.work_shedule
    ADD CONSTRAINT work_shedule_name_key UNIQUE (name);


--
-- Name: work_shedule work_shedule_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.work_shedule
    ADD CONSTRAINT work_shedule_pkey PRIMARY KEY (id);


--
-- Name: workers workers_email_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_email_key UNIQUE (email);


--
-- Name: workers workers_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);


--
-- Name: workers_resume workers_resume_pkey; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers_resume
    ADD CONSTRAINT workers_resume_pkey PRIMARY KEY (id);


--
-- Name: workers workers_telephone_key; Type: CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_telephone_key UNIQUE (telephone);


--
-- Name: cities cities_region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_region_id_fk FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: employee_responses employee_responses_employer_feedback_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employee_responses
    ADD CONSTRAINT employee_responses_employer_feedback_id_fk FOREIGN KEY (employer_feedback_id) REFERENCES public.employer_feedbacks(id);


--
-- Name: employee_responses employee_responses_job_opening_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employee_responses
    ADD CONSTRAINT employee_responses_job_opening_id_fk FOREIGN KEY (job_opening_id) REFERENCES public.job_openings(id);


--
-- Name: employee_responses employee_responses_worker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employee_responses
    ADD CONSTRAINT employee_responses_worker_id_fk FOREIGN KEY (worker_id) REFERENCES public.workers(id);


--
-- Name: employers employers_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_city_id_fk FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: employers employers_industry_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_industry_id_fk FOREIGN KEY (industry_id) REFERENCES public.industries(id);


--
-- Name: job_openings job_openings_busyness_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.job_openings
    ADD CONSTRAINT job_openings_busyness_id_fk FOREIGN KEY (busyness_id) REFERENCES public.busyness(id);


--
-- Name: job_openings job_openings_employer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.job_openings
    ADD CONSTRAINT job_openings_employer_id_fk FOREIGN KEY (employer_id) REFERENCES public.employers(id);


--
-- Name: job_openings job_openings_work_experience_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.job_openings
    ADD CONSTRAINT job_openings_work_experience_id_fk FOREIGN KEY (work_experience_id) REFERENCES public.work_experience(id);


--
-- Name: job_openings job_openings_work_shedule_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.job_openings
    ADD CONSTRAINT job_openings_work_shedule_id_fk FOREIGN KEY (work_shedule_id) REFERENCES public.work_shedule(id);


--
-- Name: mailing_and_notifications mailing_and_notifications_worker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.mailing_and_notifications
    ADD CONSTRAINT mailing_and_notifications_worker_id_fk FOREIGN KEY (worker_id) REFERENCES public.workers(id);


--
-- Name: messages messages_employer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_employer_id_fk FOREIGN KEY (employer_id) REFERENCES public.employers(id);


--
-- Name: messages messages_worker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_worker_id_fk FOREIGN KEY (worker_id) REFERENCES public.workers(id);


--
-- Name: resume_busyness resume_busyness_busyness_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_busyness
    ADD CONSTRAINT resume_busyness_busyness_id_fk FOREIGN KEY (busyness_id) REFERENCES public.busyness(id);


--
-- Name: resume_busyness resume_busyness_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_busyness
    ADD CONSTRAINT resume_busyness_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_personal_info resume_education_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_personal_info
    ADD CONSTRAINT resume_education_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_electronic_certificates resume_electronic_certificates_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_electronic_certificates
    ADD CONSTRAINT resume_electronic_certificates_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_languages resume_languages_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_languages
    ADD CONSTRAINT resume_languages_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_personal_info resume_personal_info_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_personal_info
    ADD CONSTRAINT resume_personal_info_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_portfolio resume_portfolio_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_portfolio
    ADD CONSTRAINT resume_portfolio_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_position_and_salary rpas_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_position_and_salary
    ADD CONSTRAINT rpas_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_position_and_salary rpas_specialization_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_position_and_salary
    ADD CONSTRAINT rpas_specialization_id_fk FOREIGN KEY (specialization_id) REFERENCES public.specializations(id);


--
-- Name: resume_tests_and_exams rtae_resume_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_tests_and_exams
    ADD CONSTRAINT rtae_resume_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_work_shedule rws_resumee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_work_shedule
    ADD CONSTRAINT rws_resumee_id_fk FOREIGN KEY (resume_id) REFERENCES public.workers_resume(id);


--
-- Name: resume_work_shedule rws_shedule_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.resume_work_shedule
    ADD CONSTRAINT rws_shedule_id_fk FOREIGN KEY (shedule_id) REFERENCES public.work_shedule(id);


--
-- Name: specializations specializations_industry_id; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_industry_id FOREIGN KEY (industry_id) REFERENCES public.industries(id);


--
-- Name: workers workers_job_search_area_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_job_search_area_id_fk FOREIGN KEY (job_search_area_id) REFERENCES public.cities(id);


--
-- Name: workers_resume workers_resume_visibility_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers_resume
    ADD CONSTRAINT workers_resume_visibility_id_fk FOREIGN KEY (visibility_id) REFERENCES public.visibility_resume(id);


--
-- Name: workers_resume workers_resume_worker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: hh_admin
--

ALTER TABLE ONLY public.workers_resume
    ADD CONSTRAINT workers_resume_worker_id_fk FOREIGN KEY (worker_id) REFERENCES public.workers(id);


--
-- PostgreSQL database dump complete
--

