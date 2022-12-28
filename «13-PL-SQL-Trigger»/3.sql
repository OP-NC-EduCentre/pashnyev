/*
1. Розробити механізм журналізації DML-операцій, що виконуються над таблицею вашої
 бази даних, враховуючи такі дії:
– створити таблицю з ім'ям LOG_ім'я_таблиці. Структура таблиці повинна 
включати: ім'я користувача, тип операції, дата виконання операції, атрибути, 
що містять старі та нові значення.
– створити тригер журналювання.
Перевірити роботу тригера журналювання для операцій INSERT, UPDATE, DELETE.
*/
CREATE TABLE LOG_USR (
	new_manager_id	     NUMBER,	
	new_manager_name	 CHAR(40),	
	old_manager_name	 CHAR(40),
	old_manager_poition	 CHAR(25),	
	op_type	 	         CHAR(6),		
	change_date          DATE  
); 

CREATE OR REPLACE TRIGGER LOG_USR
	AFTER INSERT OR UPDATE OR DELETE ON USR
	FOR EACH ROW
DECLARE 
	op_type_ LOG_USR.op_type%TYPE;
BEGIN
	IF INSERTING THEN 
        op_type_ := 'INSERT'; 
    END IF;
	IF UPDATING THEN 
        op_type_ := 'UPDATE';  
    END IF;
	IF DELETING THEN 
        op_type_ := 'DELETE'; 
    END IF;
	INSERT INTO LOG_MANAGERS VALUES (
		:NEW.USER_ID,
		:NEW.USERNAME,
		:OLD.USER_ID,
		:OLD.USERNAME, 
		op_type_,
		SYSDATE
	);
END;
/
/*
2. Припустимо, що використовується СУБД до 12-ї версії, яка не підтримує механізм
DEFAULT SEQUENCE, який дозволяє автоматично внести нове значення первинного ключа, 
якщо воно не задано при операції внесення. Для будь-якої колонки вашої бази даних 
створити тригер з підтримкою механізму DEFAULT SEQUENCE. Навести тест-кейс перевірки
роботи тригера.
*/
CREATE SEQUENCE CAR_ID_sequ
  MINVALUE 1
  MAXVALUE 1000
  START WITH 60
  INCREMENT BY 1;

CREATE TRIGGER usr_default_sequence 
	BEFORE INSERT 
	ON CAR
	FOR EACH ROW
BEGIN
	if :NEW.car_id IS NULL THEN
		:NEW.car_id := CAR_ID_sequ.NEXTVAL;
	END IF;
END;
/
