/*  Задача: Получить данные пользователей, у которых 
    есть резюме с видимостью 1 (Видно компаниям-клиентам HeadHunter)
    и у которых район поиска работы г. Смоленск 
*/

SELECT first_name, last_name, email, telephone
FROM workers
WHERE id = ANY(SELECT worker_id 
         FROM workers_resume
         WHERE visibility_id = 1)
AND job_search_area_id = (SELECT id
                        FROM cities
                        WHERE name = 'Смоленск');



/*

 first_name | last_name |              email              |  telephone  
------------+-----------+---------------------------------+-------------
 Portia     | Bray      | id.magna@yahoo.couk             | 95153862205
 Fatima     | Lindsey   | eleifend.egestas@protonmail.com | 26495268976
(2 rows)

*/