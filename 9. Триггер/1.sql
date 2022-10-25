/*  Создал триггер на добавление нового работника в таблицу workers
    и изменение информации в столбцах телефон, эмейл у уже существующего
    работника.
    Если мы добавляем запись с уже существующими телефоном/эмейлом,
    БД выдаст предупреждение
*/


CREATE FUNCTION check_data_for_duplication()
RETURNS TRIGGER AS
$$
DECLARE is_duplicate_email BOOLEAN;
        is_duplicate_telephone BOOLEAN;
BEGIN
    is_duplicate_email:= EXISTS(SELECT email 
                          FROM workers 
                          WHERE email = NEW.email 
                         );
    is_duplicate_telephone:= EXISTS(SELECT telephone 
                          FROM workers 
                          WHERE telephone = NEW.telephone 
                         );                     
    IF is_duplicate_email THEN
        RAISE 'Duplicate user EMAIL: %', is_duplicate_email USING ERRCODE = 'unique_violation';
    ELSIF is_duplicate_telephone THEN
        RAISE 'Duplicate user TELEPHONE: %', is_duplicate_telephone USING ERRCODE = 'unique_violation';
    ELSE
        RETURN NEW;
    END IF;
END;
$$
LANGUAGE PLPGSQL;



CREATE TRIGGER check_user_data 
    BEFORE INSERT
    OR
    UPDATE OF telephone, email
    ON workers
FOR EACH ROW
EXECUTE FUNCTION check_data_for_duplication();



/*
Проверка рабоьоспособности:
Добавляю нового работника

INSERT INTO workers (first_name,last_name,email,telephone,created_at,job_search_area_id)
VALUES
  ('Aid','Staney','nuncsa.in@hotmail.ca',92463758147,'2023-09-19 22:08:36',57);

INSERT 0 1
Query returned successfully in 46 msec.

После повторного ввода той же команды ошибка
ERROR:  Duplicate user EMAIL: t
CONTEXT:  PL/pgSQL function check_data_for_duplication() line 14 at RAISE
SQL state: 23505
