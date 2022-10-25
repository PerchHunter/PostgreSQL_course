/*  Представление возвращает выборку работников 
    Чувашской республики (регион 21) с резюме,
     которое видно компаниям-клиентам HeadHunter
*/


CREATE VIEW  workers_visible_resume_region_21 AS 
SELECT wr.worker_id,
       rpi.worker_name AS name,
       rpi.worker_surname AS surname,
       rpi.worker_patronymic AS patronymic,
       rpi.gender,
       rpi.date_of_birth,
       r.name AS region,
       c.name AS city,
       wr.info,
       wr.native_language,
       wr.availability_of_car,
       wr.drivers_lisense,
       rpi.movement,
       w.telephone,
       w.email
FROM workers w
JOIN cities c
    ON w.job_search_area_id = c.id
JOIN regions r
    ON c.region_id = r.id
JOIN workers_resume wr
    ON w.id = wr.worker_id
JOIN resume_personal_info rpi
    ON wr.id = rpi.resume_id
WHERE wr.visibility_id = 1
    AND r.name = 'Чувашская Республика - Чувашия';
    
    
SELECT * FROM workers_visible_resume_region_21;


/*

 worker_id |  name   | surname |     patronymic     | gender  | date_of_birth |             region             |      city       |                                          info                                           | native_language | availability_of_car | drivers_lisense | movement  |  telephone  |         email          
-----------+---------+---------+--------------------+---------+---------------+--------------------------------+-----------------+-----------------------------------------------------------------------------------------+-----------------+---------------------+-----------------+-----------+-------------+------------------------
        12 | Zia     | Graves  | Claudia C. Salinas | Женский | 2005-04-12    | Чувашская Республика - Чувашия | Санкт-Петербург | nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut                       | Русский         | f                   | {D}             | Возможен  | 26120936776 | diam.lorem@outlook.edu
        66 | Althea  | Holmes  | Steel H. Medina    | Женский | 2005-02-25    | Чувашская Республика - Чувашия | Волжский        | nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus | Французский     | f                   | {CE}            | Возможен  | 86494747934 | ipsum.sodales@aol.com
        69 | Gillian | Johns   | Sasha O. Shannon   | Мужской | 2011-06-26    | Чувашская Республика - Чувашия | Волжский        | montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim.         | Немецкий        | t                   | {E}             | Желателен | 92995252333 | tempor@yahoo.ca
(3 rows)

*/
