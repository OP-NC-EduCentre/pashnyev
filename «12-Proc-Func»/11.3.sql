/*
3.1. Оформіть рішення завдань етапу 2 у вигляді програмного пакета. Наведіть
приклад виклику збереженої процедури та функції, враховуючи назву пакету.
*/
CREATE OR REPLACE PACKAGE users_pack IS
	FUNCTION sum_user_id(result NUMBER)
	RETURN NUMBER;
    PROCEDURE add_rows (amount NUMBER);
END users_pack;

CREATE OR REPLACE PACKAGE BODY users_pack IS
   
   PROCEDURE sum_user_id(times NUMBER)
   IS
    total number:=0;
    BEGIN
        BEGIN
            select sum(user_id) into total from users;
        END; 
    END;
    
   
   PROCEDURE add_rows IS
   BEGIN
      INSERT INTO users
					(user_id, username) 
			VALUES(
					user_seq.NEXTVAL, 
					'Test');
   END add_rows;
END users_pack;



