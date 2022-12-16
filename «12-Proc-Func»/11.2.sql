/*
2.1. Повторити виконання завдання 1 етапу 1, створивши процедуру з вхідним
параметром у вигляді кількості рядків, що вносяться.
Навести приклад виконання створеної процедури.
*/

CREATE OR REPLACE PROCEDURE add_rows
	( times Number
	)
IS
BEGIN
	BEGIN
	FOR i IN 1..times LOOP
		INSERT INTO users
					(user_id, username) 
			VALUES(
					user_seq.NEXTVAL, 
					'Test');
	END LOOP;
END;
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

CREATE OR REPLACE FUNCTION sum_user_id(times Number)
RETURN number
IS
total number:=0;
BEGIN
	BEGIN
		select sum(user_id) into total from users;
	END; 
END;



