/*  Создал представление, выбирающее работников,
    которые ещё не откликнулись ни на одну вакансию
*/

CREATE VIEW workers_without_responses_to_vacancies AS
SELECT w.id AS worker_id,
    w.first_name,
    w.last_name,
    w.email,
    w.telephone,
    w.created_at,
    w.job_search_area_id
FROM workers w
LEFT JOIN employee_responses er
    ON w.id = er.worker_id
WHERE er.id IS NULL
ORDER BY w.id;



SELECT * FROM workers_without_responses_to_vacancies;


/*

 worker_id | first_name | last_name |                email                |  telephone  |     created_at      | job_search_area 
-----------+------------+-----------+-------------------------------------+-------------+---------------------+-----------------
         1 | Aidan      | Stanley   | nunc.in@hotmail.ca                  | 92463769147 | 2023-09-19 22:08:36 |              57
         2 | Alexander  | Sanchez   | pellentesque.eget.dictum@yahoo.ca   | 34385072880 | 2022-03-16 19:49:51 |              27
         3 | Chloe      | Key       | erat.vel@yahoo.com                  | 16330404545 | 2022-10-31 14:52:07 |              81
         5 | Jael       | Cash      | enim.nisl@icloud.ca                 | 92652867861 | 2022-04-13 09:05:50 |              17
         8 | Cally      | Roman     | in.molestie.tortor@yahoo.com        | 31424476984 | 2022-08-24 16:05:47 |              81
        10 | Deirdre    | Underwood | donec@outlook.net                   | 23756459911 | 2022-11-24 11:04:39 |              37
        13 | Amena      | Vaughn    | sit.amet@hotmail.com                | 80627729650 | 2022-04-20 17:13:00 |              64
        18 | Noelani    | Delgado   | at.pretium.aliquet@google.net       | 48117280674 | 2022-09-23 02:22:21 |              78
        20 | Abigail    | Miles     | aliquam.eu.accumsan@outlook.edu     | 33850557340 | 2022-02-11 08:22:39 |               8
        21 | Liberty    | Mitchell  | rutrum.fusce.dolor@protonmail.com   | 24583197208 | 2022-07-21 08:33:15 |              47
        22 | Magee      | Mcintosh  | risus.donec@hotmail.org             | 29027210015 | 2022-04-07 23:42:28 |              65
        28 | Nora       | Knowles   | dui@hotmail.net                     |  4489553447 | 2022-06-04 23:05:19 |              31
        32 | Octavius   | Witt      | risus.morbi@hotmail.edu             | 27853245983 | 2022-05-31 23:53:18 |              22
        34 | Anne       | Cain      | aliquam.erat.volutpat@google.ca     | 38770644460 | 2023-02-19 14:39:55 |              43
        36 | Byron      | Dorsey    | sodales@yahoo.ca                    | 28335084637 | 2022-11-17 17:24:25 |              72
        38 | Clark      | Key       | sed.et@aol.com                      | 39761866501 | 2023-06-30 03:25:44 |              85
        39 | Jameson    | Hinton    | enim.suspendisse.aliquet@google.org | 53406690703 | 2023-08-06 06:53:34 |              50
        46 | Caleb      | Jacobs    | luctus.aliquet@yahoo.ca             | 75425667054 | 2023-05-25 09:59:16 |              79
        47 | Christine  | Riggs     | aliquam.erat@outlook.couk           | 56668714941 | 2022-07-16 03:18:42 |              33
        49 | Wyatt      | Newton    | penatibus@google.edu                | 25876195760 | 2023-09-18 00:51:21 |              71
        54 | Hollee     | Butler    | enim.nunc.ut@hotmail.edu            | 55205030979 | 2023-07-13 12:45:02 |              68
        56 | Lenore     | Goodwin   | ullamcorper@outlook.ca              | 17990746564 | 2021-11-11 01:47:54 |              70
        58 | Latifah    | Rice      | neque.venenatis.lacus@icloud.edu    | 25564106124 | 2022-08-25 00:55:50 |              46
        59 | Gage       | Valentine | quis.diam@aol.ca                    | 87137369463 | 2022-07-30 07:03:34 |              40
        61 | Regan      | Ochoa     | pretium.aliquet@outlook.org         | 80413580397 | 2022-09-01 05:08:28 |              56
        63 | Scarlet    | Bonner    | sit.amet@google.org                 | 77159331126 | 2023-03-03 16:35:45 |              21
        68 | Basia      | Harding   | viverra@protonmail.couk             | 48210281426 | 2022-06-06 10:47:53 |              26
        88 | Kevyn      | Lyons     | adipiscing.lobortis@google.com      | 44508406004 | 2021-10-31 12:07:18 |              13
        89 | Arthur     | Lawson    | enim.consequat.purus@icloud.org     | 80725301151 | 2022-09-11 07:44:12 |              83
        90 | Alice      | Contreras | euismod.enim@yahoo.ca               | 23745189507 | 2023-07-06 13:53:05 |              73
        91 | Amelia     | Petersen  | at.egestas@protonmail.edu           | 81247451617 | 2022-03-12 22:50:05 |              51
        94 | Scarlett   | Pitts     | non@yahoo.org                       | 64928175570 | 2023-06-01 03:45:31 |               3
        95 | Irene      | Hill      | magna.tellus.faucibus@icloud.couk   | 30637644834 | 2022-09-23 09:39:02 |              62
        96 | Theodore   | Roach     | egestas@hotmail.ca                  | 57325692632 | 2022-10-15 16:55:29 |              72
        98 | Myra       | Macias    | facilisi@yahoo.net                  | 37526063352 | 2023-02-23 17:05:26 |              53
        99 | Joseph     | Houston   | faucibus.orci@google.edu            | 42281605555 | 2021-12-31 01:53:07 |              13
       100 | Ivy        | Rojas     | non.dui@yahoo.org                   | 29917034883 | 2021-10-22 12:45:58 |              78
(37 rows)

*/