/*  Задача: получить информацию о работодателях
    и узнать количество человек,приглашённых на работу  этим работодателем на нашей 
    платформе за последний год. Сортируем по убыванию по количеству приглашений 
    и по рейтингу.
*/

SELECT e.id, 
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
WHERE employer_feedback_id = 2 
    AND er.response_time > (CURRENT_TIMESTAMP - interval '1 year')
GROUP BY e.id
ORDER BY total_invitations_for_last_year DESC, e.rating DESC;



/*
 id |                                  description                                   | rating | industry_id | city_id | total_invitations_for_last_year 
----+--------------------------------------------------------------------------------+--------+-------------+---------+---------------------------------
  6 | Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis           |      0 |           5 |      34 |                               4
 46 | consectetuer euismod est arcu ac orci. Ut semper pretium neque.                |      1 |          10 |      46 |                               3
 28 | ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,           |      4 |           8 |       8 |                               2
 79 | sem mollis dui, in sodales elit erat vitae risus. Duis                         |      4 |           8 |      75 |                               2
 37 | aliquet, metus urna convallis erat, eget tincidunt dui augue eu                |      4 |           8 |      76 |                               2
 82 | et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.          |      3 |          14 |      15 |                               2
 16 | augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum.        |      3 |           7 |      14 |                               2
 71 | lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,        |      3 |           9 |      46 |                               2
 20 | ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra             |      1 |           2 |      63 |                               2
 81 | faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend.     |      4 |          11 |      71 |                               1
 74 | at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit      |      4 |          15 |      11 |                               1
  2 | purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula               |      4 |          11 |      31 |                               1
  9 | et magnis dis parturient montes, nascetur ridiculus mus. Proin vel             |      3 |           7 |       8 |                               1
 47 | Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci                      |      3 |          13 |      36 |                               1
  3 | metus sit amet ante. Vivamus non lorem vitae odio sagittis                     |      3 |          13 |      80 |                               1
 48 | Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac    |      2 |          11 |      57 |                               1
 35 | Sed neque. Sed eget lacus. Mauris non dui nec urna                             |      2 |           2 |       4 |                               1
 49 | bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna         |      2 |           6 |      28 |                               1
 54 | erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.         |      2 |           4 |      75 |                               1
 63 | Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus,   |      2 |          11 |      23 |                               1
 50 | Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam |      2 |           3 |       2 |                               1
 30 | fermentum risus, at fringilla purus mauris a nunc. In at                       |      1 |          11 |      12 |                               1
 24 | ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt                 |      1 |           6 |      12 |                               1
 99 | nisi. Cum sociis natoque penatibus et magnis dis parturient montes,            |      1 |           8 |      27 |                               1
 44 | dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,            |      0 |          12 |      50 |                               1
 19 | ante ipsum primis in faucibus orci luctus et ultrices posuere                  |      0 |          10 |      34 |                               1
 69 | facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa.              |      0 |           3 |      55 |                               1
 42 | nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat                  |      0 |           9 |      29 |                               1

*/