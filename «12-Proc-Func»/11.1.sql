/*
1.1. Повторіть виконання завдання 4 етапу 1 із попередньої лабораторної роботи:
? циклічно внести 5000 рядків;
? визначити загальний час на внесення зазначених рядків;
? вивести на екран значення часу.
*/

CREATE SEQUENCE user_seq
 START WITH     1000
 INCREMENT BY   1;
 
CREATE TABLE users
( user_id number(10) NOT NULL,
  username varchar2(50) NOT NULL,
  CONSTRAINT user_id_pk PRIMARY KEY (user_id)
);

SET TIMING ON;


BEGIN
   
	FOR i IN 1..5000 LOOP
		INSERT INTO users
					(user_id, username) 
			VALUES(
					user_seq.NEXTVAL, 
					'Test');
	END LOOP;
END;
/*
PL/SQL procedure successfully completed.

Elapsed: 00:00:00.577
*/
/*
1.2. Повторіть виконання попереднього завдання, порівнявши час виконання
циклічних внесень рядків, використовуючи два способи: FOR і FORALL.
*/
ROLLBACK;
 
FOR i IN 1..5000 LOOP
    delete from users;
end LOOP;
/*

5,000 rows deleted.

Elapsed: 00:00:00.060
*/
    
FORALL i IN users.FIRST..users.LAST
      DELETE FROM users;
END;
/*
5,000 rows deleted.

Elapsed: 00:00:00.059
*/
/*
1.3. Для однієї з таблиць отримайте рядки з використанням курсору та пакетної
обробки SELECT-операції з оператором BULK COLLECT.
*/
DECLARE
   TYPE User IS TABLE OF users%ROWTYPE;
   usr_list User;
BEGIN
  SELECT user_id, username
     BULK COLLECT INTO usr_list FROM users;
END;
/*
PL/SQL procedure successfully completed.

Elapsed: 00:00:00.233
*/
