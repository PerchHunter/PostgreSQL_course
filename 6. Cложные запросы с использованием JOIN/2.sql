/*  Задача: вывести информацию о работодателе и работнике,
    у которых активен общий чат
*/


SELECT e.id AS employer_id,
    e.name AS employer_name,
    w.id AS worker_id,
    w.first_name AS worker_name,
    w.last_name AS worker_surname,
    w.email AS worker_email,
    COUNT(*) AS count_messages_in_chat
FROM workers w
JOIN messages m
    ON w.id = m.worker_id
JOIN employers e
    ON m.employer_id = e.id
GROUP BY e.id, w.id
ORDER BY e.id;



/*

employer_id |           employer_name           | worker_id | worker_name | worker_surname |            worker_email             | count_messages_in_chat 
-------------+-----------------------------------+-----------+-------------+----------------+-------------------------------------+------------------------
           4 | accumsan interdum libero          |       100 | Ivy         | Rojas          | non.dui@yahoo.org                   |                      1
           5 | Ut tincidunt vehicula risus.      |        51 | Robin       | Carney         | et.tristique@aol.com                |                      1
           5 | Ut tincidunt vehicula risus.      |        54 | Hollee      | Butler         | enim.nunc.ut@hotmail.edu            |                      1
           7 | in, hendrerit                     |        52 | Imelda      | Olsen          | elit.curabitur@google.org           |                      1
           9 | faucibus id, libero. Donec        |        84 | Miranda     | Davis          | sed.leo@icloud.couk                 |                      1
          10 | metus. Aenean sed                 |        63 | Scarlet     | Bonner         | sit.amet@google.org                 |                      1
          11 | Curabitur dictum. Phasellus       |         3 | Chloe       | Key            | erat.vel@yahoo.com                  |                      1
          12 | tellus eu augue porttitor         |         3 | Chloe       | Key            | erat.vel@yahoo.com                  |                      1
          12 | tellus eu augue porttitor         |        77 | Britanney   | Yang           | a.tortor@hotmail.net                |                      1
          14 | sed sem egestas blandit.          |        57 | Chandler    | Marks          | massa.vestibulum.accumsan@aol.couk  |                      1
          16 | accumsan neque et nunc.           |        88 | Kevyn       | Lyons          | adipiscing.lobortis@google.com      |                      1

...
...
...

          98 | et, lacinia vitae, sodales        |        61 | Regan       | Ochoa          | pretium.aliquet@outlook.org         |                      1
          99 | lacus. Quisque                    |         8 | Cally       | Roman          | in.molestie.tortor@yahoo.com        |                      1
          99 | lacus. Quisque                    |        45 | Nicholas    | Morrow         | aliquet.metus.urna@protonmail.org   |                      1
          99 | lacus. Quisque                    |        70 | Hamish      | Nunez          | mollis.lectus.pede@google.net       |                      1
          99 | lacus. Quisque                    |        80 | Deanna      | Hebert         | non.enim@protonmail.com             |                      1
(100 rows)

