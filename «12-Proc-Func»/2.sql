/*
2.1. Повторити виконання завдання 1 етапу 1, створивши процедуру з вхідним
параметром у вигляді кількості рядків, що вносяться.
Навести приклад виконання створеної процедури.
*/

CREATE OR REPLACE PROCEDURE add_rows
	( times Number
	)
IS
DECLARE
	t1 TIMESTAMP; -- момент часу початку виконання запиту
	t2 TIMESTAMP; -- момент часу завершення виконання запиту
	delta INTEGER; -- час виконання запиту
BEGIN

	FOR i IN 1..times LOOP
		INSERT INTO users
					(user_id, username) 
			VALUES(
					user_seq.NEXTVAL, 
					'Test');
	END LOOP;
t2 := SYSTIMESTAMP;
delta := TO_NUMBER(TO_CHAR(t2, 'HHMISS.FF3'),'999999.999') - 
TO_NUMBER(TO_CHAR(t1, 'HHMISS.FF3'),'999999.999');
END;

DECLARE
    first_rows NUMBER;
BEGIN
	first_rows := 10;
	add_rows(first_rows);
END;
/*
2.2. Створити функцію, яка повертає суму значень однієї з цілих колонок однієї з
таблиць. Навести приклад виконання створеної функції.
*/

CREATE OR REPLACE FUNCTION sum_car_id (usr_id usr.user_id%TYPE)
RETURN NUMBER
IS
	query VARCHAR2(500);
	car_sum NUMBER;
BEGIN
	query := 'SELECT SUM(car_id) FROM usr WHERE usr_id=:1';
	EXECUTE IMMEDIATE query INTO car_sum USING IN usr_id;
    DBMS_OUTPUT.enable;
	DBMS_OUTPUT.put_line(car_sum);
	RETURN car_sum;
END;



EXEC sum_car_id(2);
