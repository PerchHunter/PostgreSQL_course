postgres=# CREATE USER hh_admin WITH PASSWORD '-11111';
CREATE ROLE
postgres=# CREATE DATABASE headhunter;
CREATE DATABASE
postgres=# GRANT ALL PRIVILEGES ON DATABASE headhunter TO hh_admin;
GRANT


-- таблица работников

CREATE TABLE workers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telephone DECIMAL NOT NULL UNIQUE,
    created_at timestamp without time zone NOT NULL,
    job_search_area_id SMALLINT DEFAULT NULL
);


-- таблица включенных у работника оповещений

CREATE TABLE mailing_and_notifications (
    worker_id INTEGER NOT NULL UNIQUE,
    alerts_and_tips BOOLEAN NOT NULL DEFAULT TRUE,
    news_and_advertising BOOLEAN NOT NULL DEFAULT TRUE,
    new_vacancies BOOLEAN NOT NULL DEFAULT TRUE,
    birthday_greetings BOOLEAN NOT NULL DEFAULT TRUE,
    daily_notification_of_resume_views BOOLEAN NOT NULL DEFAULT TRUE,
    instant_notifications_of_resume_views BOOLEAN NOT NULL DEFAULT TRUE,
    internships BOOLEAN NOT NULL DEFAULT TRUE,
    auto_search_for_vacancies BOOLEAN NOT NULL DEFAULT TRUE,
    job_invitations BOOLEAN NOT NULL DEFAULT TRUE,
    correspondence_with_the_employer BOOLEAN NOT NULL DEFAULT TRUE
);


--таблица работодателей

CREATE TABLE employers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250)  NOT NULL DEFAULT 'Название не указано',
    photo_url VARCHAR(250) DEFAULT NULL,
    description TEXT NOT NULL,
    rating float(1) DEFAULT NULL,
    industry_id INTEGER NOT NULL,
    city_id INTEGER NOT NULL
);


/*  таблица отзывов о работодателе
    столбцы с префиксом stars это пункты,
    которые оценивали бы работники по 5-балльной шкале.
    На основе этих оценок формировалась бы общая оценка 
*/

CREATE TABLE reviews_of_employers (
    id SERIAL PRIMARY KEY,
    employer_id INTEGER NOT NULL,
    vacancy_name VARCHAR(250) NOT NULL,
    total_score_for_review float(1) NOT NULL,
    positive TEXT DEFAULT NULL,
    negative TEXT DEFAULT NULL,
    working_conditions_stars SMALLINT NOT NULL,
    group_stars SMALLINT NOT NULL,
    guide_stars SMALLINT NOT NULL,
    growth_opportunities_stars SMALLINT NOT NULL,
    conditions_for_recretions_stars SMALLINT NOT NULL,
    income_level_stars SMALLINT NOT NULL,
    created_at timestamp without time zone NOT NULL
);


-- таблица регионов страны 

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


/* таблица городов
    Внимание! Так как данные генерировались рандомно,
    названия городов и id регионов не совпадают с реальными в жизни
*/

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region_id INTEGER NOT NULL
);


-- таблица отраслей деятельности

CREATE TABLE industries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);


-- таблица специальностей

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    industry_id INTEGER NOT NULL
);


-- занятость

CREATE TABLE busyness (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


-- график работы

CREATE TABLE work_shedule (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


-- какие вырианты графика работы выбрал работник

CREATE TABLE resume_work_shedule (
    id SERIAL PRIMARY KEY,
    shedule_id INTEGER NOT NULL,
    resume_id INTEGER NOT NULL
);


-- какие вырианты занятости выбрал работник

CREATE TABLE resume_busyness (
    id SERIAL PRIMARY KEY,
    busyness_id INTEGER NOT NULL,
    resume_id INTEGER NOT NULL
);


-- опыт работы (стаж)

CREATE TABLE work_experience (
    id SERIAL PRIMARY KEY,
    experience VARCHAR(50) NOT NULL UNIQUE
);


-- видимость резюме

CREATE TABLE visibility_resume (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);



/* таблица резюме работников.
    Чтобы таблица не была огромной, 
    решил применить вертикальное секционирование. 
    Ниже идут таблицы, связанные с этой по resume_id.
*/

CREATE TABLE workers_resume (
    id SERIAL PRIMARY KEY,
    worker_id INTEGER NOT NULL,
    photo_url VARCHAR(250) DEFAULT NULL,
    info TEXT DEFAULT NULL,
    availability_of_car BOOLEAN NOT NULL DEFAULT FALSE,
    drivers_lisense VARCHAR(2)[] DEFAULT NULL,
    native_language VARCHAR(50) DEFAULT NULL,
    visibility_id INTEGER NOT NULL DEFAULT 5, 
    created_at timestamp without time zone NOT NULL
);


-- раздел персональной информации в резюме
CREATE TYPE gender_type AS ENUM ('Мужской', 'Женский');
CREATE TYPE business_trips_type AS ENUM ('Никогда', 'Готов', 'Иногда');
CREATE TYPE movement_type AS ENUM ('Невозможен', 'Желателен', 'Возможен');

CREATE TABLE resume_personal_info (
    resume_id INTEGER NOT NULL,
    worker_name VARCHAR(50) DEFAULT NULL,
    worker_surname VARCHAR(50) DEFAULT NULL,
    worker_patronymic VARCHAR(50) DEFAULT NULL,
    date_of_birth DATE DEFAULT NULL,
    gender gender_type NOT NULL DEFAULT 'Мужской',
    city_of_residence INTEGER DEFAULT NULL,
    movement movement_type NOT NULL DEFAULT 'Невозможен',
    readiness_for_business_trips business_trips_type NOT NULL DEFAULT 'Никогда'
);

-- должность и зарплата
CREATE TYPE busyness_type AS ENUM('Полная занятость', 'Частичная занятость', 'Проектная работа', 'Волонтерство', 'Стажировка');
CREATE TYPE work_shedule_type AS ENUM('Полный день', 'Сменный график', 'Гибкий график', 'Удаленная работа', 'Вахтовый метод');

CREATE TABLE resume_position_and_salary (
    resume_id INTEGER NOT NULL,
    position VARCHAR(250) DEFAULT NULL,
    specialization_id INTEGER,
    salary float(2) DEFAULT NULL,
    busyness busyness_type DEFAULT NULL,
    work_shedule work_shedule_type DEFAULT NULL
);

-- файлы работ в портфолио

CREATE TABLE resume_portfolio (
    resume_id INTEGER NOT NULL,
    url_files VARCHAR(250)[]
);


-- раздел "образование"
CREATE TYPE education_level_type AS ENUM('', 'Среднее', 'Среднее специальное', 
                                    'Неоконченное высшее', 'Высшее', 'Бакалавр',
                                    'Магистр', 'Кандидат наук','Доктор наук');

CREATE TABLE resume_education (
    resume_id INTEGER NOT NULL,
    level education_level_type DEFAULT NULL,
    educational_institution VARCHAR(250) NOT NULL,
    faculty VARCHAR(250) NOT NULL,
    specialization VARCHAR(250) NOT NULL,
    year_of_graduation SMALLINT NOT NULL
);


-- раздел "тесты и экзамены"

CREATE TABLE resume_tests_and_exams (
    resume_id INTEGER NOT NULL,
    education_institution VARCHAR(250) NOT NULL,
    organization_that_conducted VARCHAR(250) NOT NULL,
    specialization VARCHAR(250) NOT NULL,
    year_of_completion SMALLINT NOT NULL
);


-- раздел "электронные сертификаты"

CREATE TABLE resume_electronic_certificates (
    resume_id INTEGER NOT NULL,
    name VARCHAR(250) NOT NULL,
    url VARCHAR(250) NOT NULL,
    specialization VARCHAR(250) NOT NULL,
    year_of_receipt SMALLINT NOT NULL
);


-- раздел "иностранные языки"
CREATE TYPE lang_level AS ENUM ('A1 - начальный', 'A2 -  элементарный', 'B1 - средний', 
                                'B2 - средне-продвинутый', 'C1 - продвинутый', 'С2 - в совершенстве');

CREATE TABLE resume_languages (
    resume_id INTEGER NOT NULL,
    language VARCHAR(50) NOT NULL,
    level lang_level DEFAULT 'A1 - начальный'
);


-- Таблица вакансий

CREATE TABLE job_openings (
    id SERIAL PRIMARY KEY,
    employer_id INTEGER NOT NULL,
    position VARCHAR(250) NOT NULL,
    salary  INTEGER NOT NULL,
    work_experience_id INTEGER NOT NULL,
    work_shedule_id INTEGER NOT NULL,
    busyness_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    created_at timestamp without time zone NOT NULL
);


-- Отклики работников

CREATE TABLE employee_responses (
    id SERIAL PRIMARY KEY,
    worker_id INTEGER NOT NULL,
    job_opening_id INTEGER NOT NULL,
    employer_feedback_id INTEGER NOT NULL DEFAULT 1,
    response_time timestamp without time zone NOT NULL
);


-- Обратная связь работодателей (статус отклика (в ожидании, отказ, приглашение))

CREATE TABLE employer_feedbacks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
);


-- Сообщения

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    worker_id INTEGER NOT NULL,
    employer_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    is_delivered BOOLEAN,
    created_at timestamp without time zone NOT NULL
);



