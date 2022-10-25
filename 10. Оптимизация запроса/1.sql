/*  Задача: получить информацию о работодателях
    и узнать количество человек,приглашённых на работу  этим работодателем на нашей 
    платформе за последний год. Сортируем по убыванию по количеству приглашений 
    и по рейтингу.

    employers - таблица работодателей,
    job_openings - таблица вакансий 
    employee_responses - таблица откликов работников на вакансии (
        столбец response_time - время отклика работника на вакансию,
        столбец employer_feedback_id - обратная связь работодателя
        0 - в ожидании, 1 - Отказ, 2 - приглашение 
    ),


*/

EXPLAIN ANALYZE SELECT e.id, 
    e.description, 
    e.rating, 
    e.industry_id, 
    e.city_id,
    COUNT(*) AS total_invitations_for_last_year
FROM employers e
JOIN job_openings jo
    ON e.id = jo.employer_id
JOIN employee_responses er
    ON jo.id = er.job_opening_id
WHERE er.employer_feedback_id = 2 
    AND er.response_time > (CURRENT_TIMESTAMP - interval '1 year')
GROUP BY e.id
ORDER BY total_invitations_for_last_year DESC, e.rating DESC;

                                                                   QUERY PLAN                                                                    
-------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=16.07..16.17 rows=37 width=92) (actual time=0.202..0.205 rows=28 loops=1)
   Sort Key: (count(*)) DESC, e.rating DESC
   Sort Method: quicksort  Memory: 28kB
   ->  HashAggregate  (cost=14.74..15.11 rows=37 width=92) (actual time=0.180..0.186 rows=28 loops=1)
         Group Key: e.id
         ->  Hash Join  (cost=8.81..14.55 rows=37 width=84) (actual time=0.083..0.167 rows=40 loops=1)
               Hash Cond: (e.id = jo.employer_id)
               ->  Seq Scan on employers e  (cost=0.00..5.00 rows=100 width=84) (actual time=0.005..0.071 rows=100 loops=1)
               ->  Hash  (cost=8.35..8.35 rows=37 width=4) (actual time=0.074..0.075 rows=40 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 10kB
                     ->  Hash Join  (cost=4.25..8.35 rows=37 width=4) (actual time=0.039..0.069 rows=40 loops=1)
                           Hash Cond: (er.job_opening_id = jo.id)
                           ->  Seq Scan on employee_responses er  (cost=0.00..4.00 rows=37 width=4) (actual time=0.003..0.024 rows=40 loops=1)
                                 Filter: ((employer_feedback_id = 2) AND (response_time > (CURRENT_TIMESTAMP - '1 year'::interval)))
                                 Rows Removed by Filter: 60
                           ->  Hash  (cost=3.00..3.00 rows=100 width=8) (actual time=0.033..0.033 rows=100 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 12kB
                                 ->  Seq Scan on job_openings jo  (cost=0.00..3.00 rows=100 width=8) (actual time=0.003..0.018 rows=100 loops=1)
 Planning Time: 0.191 ms
 Execution Time: 0.233 ms
(20 rows)


/*  На плане выполнения видим:
    - Сначала выполняется последовательное сканирование таблицы job_openings,
    вычисляется хеш для полученных строк. Получено 100 строк. Использовано памяти: 12 кВ.
    - Далее выполняется последовательное сканирование таблицы employee_responses, 
    для строк которой так же вычисляется хеш. 
    - Применяются фильтры 
    Filter: ((employer_feedback_id = 2) AND (response_time > (CURRENT_TIMESTAMP - '1 year'::interval)))
    Фильтрами отброшены 60 строк.
    - Сравниваются хеши двух просканированных таблиц по (er.job_opening_id = jo.id).
    - Осталось 37 строк, для них вычисляется хеш (Hash  (cost=8.35..8.35 rows=37 width=4)).
    - Выполняется последовательное сканирование таблицы employers. Получено 100 строк.
      Хеши сравниваются по (e.id = jo.employer_id)
    - Выполняется группировка. Ключ группировки e.id.
    - Выполняется сортировка.
    - Общее время выполнения 0.233 ms.

*/

-- Создадим индексы
-- Составной индекс на внешние ключи таблицы worker_id и job_opening_id (работника и id вакансии)
CREATE INDEX employee_responses_worker_id_job_opening_id_idx ON employee_responses (worker_id, job_opening_id);
-- Индекс на стобец времени отклика работника
CREATE INDEX employee_responses_response_time_idx ON employee_responses (response_time);


-- Проверяем...

EXPLAIN ANALYZE SELECT e.id, 
    e.description, 
    e.rating, 
    e.industry_id, 
    e.city_id,
    COUNT(*) AS total_invitations_for_last_year
FROM employers e
JOIN job_openings jo
    ON e.id = jo.employer_id
JOIN employee_responses er
    ON jo.id = er.job_opening_id
WHERE er.employer_feedback_id = 2 
    AND er.response_time > (CURRENT_TIMESTAMP - interval '1 year')
GROUP BY e.id
ORDER BY total_invitations_for_last_year DESC, e.rating DESC;
                                                                   QUERY PLAN                                                                    
-------------------------------------------------------------------------------------------------------------------------------------------------
 Sort  (cost=16.07..16.17 rows=37 width=92) (actual time=0.157..0.160 rows=28 loops=1)
   Sort Key: (count(*)) DESC, e.rating DESC
   Sort Method: quicksort  Memory: 28kB
   ->  HashAggregate  (cost=14.74..15.11 rows=37 width=92) (actual time=0.138..0.145 rows=28 loops=1)
         Group Key: e.id
         ->  Hash Join  (cost=8.81..14.55 rows=37 width=84) (actual time=0.079..0.116 rows=40 loops=1)
               Hash Cond: (e.id = jo.employer_id)
               ->  Seq Scan on employers e  (cost=0.00..5.00 rows=100 width=84) (actual time=0.004..0.025 rows=100 loops=1)
               ->  Hash  (cost=8.35..8.35 rows=37 width=4) (actual time=0.071..0.072 rows=40 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 10kB
                     ->  Hash Join  (cost=4.25..8.35 rows=37 width=4) (actual time=0.037..0.066 rows=40 loops=1)
                           Hash Cond: (er.job_opening_id = jo.id)
                           ->  Seq Scan on employee_responses er  (cost=0.00..4.00 rows=37 width=4) (actual time=0.004..0.024 rows=40 loops=1)
                                 Filter: ((employer_feedback_id = 2) AND (response_time > (CURRENT_TIMESTAMP - '1 year'::interval)))
                                 Rows Removed by Filter: 60
                           ->  Hash  (cost=3.00..3.00 rows=100 width=8) (actual time=0.030..0.030 rows=100 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 12kB
                                 ->  Seq Scan on job_openings jo  (cost=0.00..3.00 rows=100 width=8) (actual time=0.003..0.017 rows=100 loops=1)
 Planning Time: 0.208 ms
 Execution Time: 0.189 ms
(20 rows)

/*  Время выполнения стало меньше, но всё так же используется последовательное сканирование таблиц.
    -- Видимо, в маленьких таблицах СУБД проще выбрать все строки чем использовать индекс.
*/


/*  Попробовал вместо группировки использовать оконную функцию совместно с DISTINCT,
    но время выполнения запроса наоборот увеличилось, стало такое же как в первом запросе,
    так же увеличилась стоимость запроса.
*/

EXPLAIN ANALYZE SELECT DISTINCT e.id, 
    e.description, 
    e.rating, 
    e.industry_id, 
    e.city_id,
    COUNT(e.id) OVER (PARTITION BY e.id) AS total_invitations_for_last_year
FROM employers e
JOIN job_openings jo
    ON e.id = jo.employer_id
JOIN employee_responses er
    ON jo.id = er.job_opening_id
WHERE er.employer_feedback_id = 2 
    AND er.response_time > (CURRENT_TIMESTAMP - interval '1 year')
ORDER BY total_invitations_for_last_year DESC, e.rating DESC;
                                                                         QUERY PLAN                                                                          
-------------------------------------------------------------------------------------------------------------------------------------------------------------
 Unique  (cost=17.13..17.78 rows=37 width=92) (actual time=0.180..0.195 rows=28 loops=1)
   ->  Sort  (cost=17.13..17.22 rows=37 width=92) (actual time=0.180..0.183 rows=40 loops=1)
         Sort Key: (count(e.id) OVER (?)) DESC, e.rating DESC, e.id, e.description, e.industry_id, e.city_id
         Sort Method: quicksort  Memory: 30kB
         ->  WindowAgg  (cost=15.52..16.17 rows=37 width=92) (actual time=0.127..0.158 rows=40 loops=1)
               ->  Sort  (cost=15.52..15.61 rows=37 width=84) (actual time=0.123..0.127 rows=40 loops=1)
                     Sort Key: e.id
                     Sort Method: quicksort  Memory: 30kB
                     ->  Hash Join  (cost=8.81..14.55 rows=37 width=84) (actual time=0.080..0.117 rows=40 loops=1)
                           Hash Cond: (e.id = jo.employer_id)
                           ->  Seq Scan on employers e  (cost=0.00..5.00 rows=100 width=84) (actual time=0.005..0.025 rows=100 loops=1)
                           ->  Hash  (cost=8.35..8.35 rows=37 width=4) (actual time=0.071..0.072 rows=40 loops=1)
                                 Buckets: 1024  Batches: 1  Memory Usage: 10kB
                                 ->  Hash Join  (cost=4.25..8.35 rows=37 width=4) (actual time=0.037..0.067 rows=40 loops=1)
                                       Hash Cond: (er.job_opening_id = jo.id)
                                       ->  Seq Scan on employee_responses er  (cost=0.00..4.00 rows=37 width=4) (actual time=0.004..0.025 rows=40 loops=1)
                                             Filter: ((employer_feedback_id = 2) AND (response_time > (CURRENT_TIMESTAMP - '1 year'::interval)))
                                             Rows Removed by Filter: 60
                                       ->  Hash  (cost=3.00..3.00 rows=100 width=8) (actual time=0.030..0.031 rows=100 loops=1)
                                             Buckets: 1024  Batches: 1  Memory Usage: 12kB
                                             ->  Seq Scan on job_openings jo  (cost=0.00..3.00 rows=100 width=8) (actual time=0.003..0.018 rows=100 loops=1)
 Planning Time: 0.581 ms
 Execution Time: 0.226 ms
(23 rows)



/* Если мы можем обойтись без сортировки данных, то лучше её убрать,
    так как без неё уменьшается время выполнения запроса и стоимость выполнения
*/

EXPLAIN ANALYZE SELECT e.id, 
    e.description, 
    e.rating, 
    e.industry_id, 
    e.city_id,
    COUNT(*) AS total_invitations_for_last_year
FROM employers e
JOIN job_openings jo
    ON e.id = jo.employer_id
JOIN employee_responses er
    ON jo.id = er.job_opening_id
WHERE er.employer_feedback_id = 2 
    AND er.response_time > (CURRENT_TIMESTAMP - interval '1 year')
GROUP BY e.id;
                                                                QUERY PLAN                                                                 
-------------------------------------------------------------------------------------------------------------------------------------------
 HashAggregate  (cost=14.74..15.11 rows=37 width=92) (actual time=0.128..0.135 rows=28 loops=1)
   Group Key: e.id
   ->  Hash Join  (cost=8.81..14.55 rows=37 width=84) (actual time=0.079..0.117 rows=40 loops=1)
         Hash Cond: (e.id = jo.employer_id)
         ->  Seq Scan on employers e  (cost=0.00..5.00 rows=100 width=84) (actual time=0.005..0.025 rows=100 loops=1)
         ->  Hash  (cost=8.35..8.35 rows=37 width=4) (actual time=0.071..0.072 rows=40 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 10kB
               ->  Hash Join  (cost=4.25..8.35 rows=37 width=4) (actual time=0.037..0.067 rows=40 loops=1)
                     Hash Cond: (er.job_opening_id = jo.id)
                     ->  Seq Scan on employee_responses er  (cost=0.00..4.00 rows=37 width=4) (actual time=0.003..0.024 rows=40 loops=1)
                           Filter: ((employer_feedback_id = 2) AND (response_time > (CURRENT_TIMESTAMP - '1 year'::interval)))
                           Rows Removed by Filter: 60
                     ->  Hash  (cost=3.00..3.00 rows=100 width=8) (actual time=0.031..0.031 rows=100 loops=1)
                           Buckets: 1024  Batches: 1  Memory Usage: 12kB
                           ->  Seq Scan on job_openings jo  (cost=0.00..3.00 rows=100 width=8) (actual time=0.003..0.018 rows=100 loops=1)
 Planning Time: 0.192 ms
 Execution Time: 0.162 ms
(17 rows)
