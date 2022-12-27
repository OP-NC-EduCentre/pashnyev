-- 3.1. Виконайте DELETE-запит із попередніх рішень, додавши аналіз даних із неявного
-- курсору. Наприклад, кількість віддалених рядків 

BEGIN
    DELETE FROM USR U
    WHERE NOT EXISTS (
        SELECT * FROM CAR C WHERE C.USER_ID = U.USER_ID
    );
    DBMS_OUTPUT.PUT_LINE('Кількість видалених рядків: ' || SQL%ROWCOUNT);
END;
/




-- 3.2. Повторіть виконання завдання 3 етапу 1 з використанням явного курсору.
DECLARE
    CURSOR usr_list IS
        SELECT username, AVG(user_id) as avg_id
        FROM USR
        GROUP BY username;
        
    usr_rec usr_list%ROWTYPE;
BEGIN
    OPEN usr_list;
    FETCH usr_list INTO usr_rec;
    DBMS_OUTPUT.PUT_LINE(RPAD('Username', 15, ' ') || 'id');
    WHILE usr_list%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(usr_rec.username, 15, ' ') || usr_rec.avg_id);
        FETCH usr_list INTO usr_rec;
    END LOOP;
    CLOSE usr_list;
END;
/

/*

Username       id
lera           47
Dima           70
vika           48
Anton          26
Ruslan         32
Katya          50
Misha          2
Alban          66
Ivan           25
George         1
Anatolii       31
PL/SQL procedure successfully completed.*/




-- 3.3 З урахуванням вашої предметної області створити анонімний PL/SQL-блок, який
-- викликатиме один із варіантів подібних SQL-запитів залежно від значення версії СУБД.
-- При вирішенні використовувати:
--   значення змінної DBMS_DB_VERSION.VERSION;
--   явний курсор із параметричним циклом.

BEGIN
    DBMS_OUTPUT.PUT_LINE('Версія CУБД: ' || DBMS_DB_VERSION.VERSION);
        DECLARE
        CURSOR car_list IS
            SELECT car_id, make
            FROM Car
            ORDER BY MAKE DESC
            FETCH FIRST 5 ROWS ONLY;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(RPAD('id', 10, ' ') || 'Model');
            FOR car_item IN car_list LOOP
                DBMS_OUTPUT.PUT_LINE(RPAD(car_item.car_id, 10, ' ') || car_item.make);
            END LOOP;
        END;
END;
/

-- Версія CУБД: 21
-- Номер     Вага, т
/*Версія CУБД: 18
id        Model
100       
70        Skoda
51        Porsh
2         Nissan
32        Lamborgini


PL/SQL procedure successfully completed.*/
