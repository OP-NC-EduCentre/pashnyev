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
SET SERVEROUTPUT ON
DECLARE
t1 number := dbms_utility.get_time();


BEGIN
   
	FOR i IN 1..5000 LOOP
		INSERT INTO users
					(user_id, username) 
			VALUES(
					user_seq.NEXTVAL, 
					'Test');
	END LOOP;
    
DBMS_OUTPUT.enable;
	DBMS_OUTPUT.PUT_LINE('query elapsed: '||(dbms_utility.get_time() - t1)/100);
END;



/*
PL/SQL procedure successfully completed.

query elapsed: .53
*/
/*
1.2. Повторіть виконання попереднього завдання, порівнявши час виконання
циклічних внесень рядків, використовуючи два способи: FOR і FORALL.
*/
ROLLBACK;
DECLARE
t1 number := dbms_utility.get_time();

BEGIN
FOR i IN 1..5000 LOOP

    delete from users;
end LOOP;
DBMS_OUTPUT.enable;
	DBMS_OUTPUT.PUT_LINE('query elapsed: '||(dbms_utility.get_time() - t1)/100);
END;
/*

query elapsed: 1.37

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

DECLARE
    CURSOR usr_list IS
	    SELECT
		    user_id AS id,
			username AS name
		FROM usr;
	usr_list_rec usr_list%ROWTYPE;
	
    TYPE Usr IS TABLE OF usr_list%ROWTYPE;
    usr_list2 Usr;
BEGIN
    DBMS_OUTPUT.enable;
	DBMS_OUTPUT.PUT_LINE('Output with using CURSOR: ');
    DBMS_OUTPUT.PUT_LINE(RPAD('id', 5) || RPAD('name', 15));
	FOR usr_list_rec IN usr_list LOOP
	    DBMS_OUTPUT.PUT_LINE(RPAD(usr_list_rec.id, 5)
		                          || RPAD(usr_list_rec.name, 15));
    END LOOP;
    
	DBMS_OUTPUT.PUT_LINE('Output with using BULK COLLECT: ');
	SELECT
		user_id AS id,
		username AS name
	BULK COLLECT INTO usr_list2
	FROM usr;
	DBMS_OUTPUT.PUT_LINE('Employee list:');
	FOR i IN usr_list2.FIRST..usr_list2.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(usr_list2(i).id || ' : ' || 
		usr_list2(i).name ||');
    END LOOP;
END;

/*
Output with using CURSOR: 
id   name           
66   Alban          
1    George         
2    Misha          
70   Dima           
25   Ivan           
26   Anton          
31   Anatolii       
32   Ruslan         
Output with using BULK COLLECT: 
Employee list:
66 : Alban : 
1 : George : 
2 : Misha : 
70 : Dima : 
25 : Ivan : 
26 : Anton : 
31 : Anatolii : 
32 : Ruslan : 
*/

