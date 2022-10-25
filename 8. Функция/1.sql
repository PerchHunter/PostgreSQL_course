/* Функция расчёта средней зарплаты, предлагаемой работодателями в определённом регионе
    и определённой отрасли.
    В данном случае получаем данные по 21 региону (в моей БД это Чувашская р-ка)
    и отрасль с id = 6 - это медицина.
*/


CREATE FUNCTION get_a_resume_of_employees_by_region (number_of_region INTEGER, industry INTEGER)
RETURNS INTEGER AS 
$$
SELECT CAST(ROUND(AVG(jo.salary)) AS INTEGER) AS avg_salary
FROM job_openings jo
JOIN employers e
    ON jo.employer_id = e.id
JOIN industries i
    ON e.industry_id = i.id
JOIN cities c
    ON e.city_id = c.id
JOIN regions r
    ON c.region_id = r.id    
WHERE i.id = industry
    AND r.id = number_of_region
$$
LANGUAGE SQL;


SELECT get_a_resume_of_employees_by_region(21, 9);
    


/*
ВЫВОД:

"get_a_resume_of_employees_by_region"
5814

*/
