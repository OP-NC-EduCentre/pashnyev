/*
4.1. З урахуванням вашої предметної області створити табличну функцію, що
повертає значення будь-яких двох колонок будь-якої таблиці з урахуванням значення однієї
з колонок, що передається як параметр. Показати приклад виклику функції.
*/
DROP TYPE usr_info_list;
DROP TYPE usr_info;

CREATE TYPE usr_info AS OBJECT (
	user_id NUMBER(4),
	username VARCHAR(15)
);
/

CREATE TYPE usr_info_list IS TABLE OF usr_info;
/

CREATE OR REPLACE FUNCTION get_usr_info_by_id (u_id IN NUMBER)
RETURN usr_info_list
AS
	usr_list usr_info_list := usr_info_list();
BEGIN
	SELECT usr_info(user_id,username)
		BULK COLLECT INTO usr_list
		FROM usr
		WHERE user_id = u_id;
	RETURN usr_list;
END;
/

SELECT user_id, username
FROM TABLE(get_usr_info_by_id(2));

/*2	Misha*/

/*
4.2. Повторіть рішення попереднього завдання, але з використанням конвеєрної
табличної функції.
*/
CREATE OR REPLACE PACKAGE usr_info_pack IS
	TYPE usr_info IS RECORD (
		user_id NUMBER(4),
		username VARCHAR(15)
	);
	TYPE usr_info_list IS TABLE OF usr_info;
	FUNCTION get_usr_info_by_id (u_id IN NUMBER)
		RETURN usr_info_list PIPELINED;
END usr_info_pack;
/

-- створення тіла пакету

CREATE OR REPLACE PACKAGE BODY usr_info_pack IS
	FUNCTION get_usr_info_by_id (u_id IN NUMBER)
		RETURN usr_info_list PIPELINED
	AS
	BEGIN
		FOR elem IN (SELECT user_id, username 
					FROM usr
					WHERE user_id = u_id) LOOP
			PIPE ROW(elem);
		END LOOP;
	END;
END usr_info_pack; 
/

-- виклик функції з пакету

SELECT user_id, username
FROM TABLE(usr_info_pack.get_usr_info_by_id(2));

/*
2	Misha
*/
