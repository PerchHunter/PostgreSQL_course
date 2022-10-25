/*  Задача: Получить список вакансий
    в ИТ-компаниях (id = 7  в таблице industries(отрасли)),
    у которых рейтинг больше 3 баллов,
    в городе Владивосток
*/

SELECT *
FROM job_openings 
WHERE employer_id = ANY(SELECT id 
                        FROM employers 
                        WHERE rating > 3 
                        AND industry_id = 7 
                        AND city_id = (SELECT id
                                       FROM cities
                                       WHERE name = 'Владивосток'));


/*

 id | employer_id |              position              | salary | work_experience_id | work_shedule_id | busyness_id |        description         
----+-------------+------------------------------------+--------+--------------------+-----------------+-------------+----------------------------
 49 |          77 | Aliquam adipiscing lobortis risus. | 1 362  |                  4 |               2 |           3 | lorem ipsum sodales purus,
(1 row)

*/