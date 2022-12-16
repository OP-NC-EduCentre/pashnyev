/*
4.1. З урахуванням вашої предметної області створити табличну функцію, що
повертає значення будь-яких двох колонок будь-якої таблиці з урахуванням значення однієї
з колонок, що передається як параметр. Показати приклад виклику функції.
*/
CREATE TYPE Emp_short_info AS OBJECT (
 empno 	NUMBER(4),
 ename 	VARCHAR(10),
 job 	VARCHAR(10)
);

CREATE TYPE Emp_short_info_List IS TABLE OF Emp_short_info;

CREATE OR REPLACE FUNCTION get_emp_list(v_deptno IN NUMBER)
RETURN Emp_short_info_List 
AS
	Emp_list Emp_short_info_List := Emp_short_info_List();
BEGIN
	-- виконати запит, передавши результат до колекції
 	SELECT Emp_short_info(empno,ename,job) -- приведення даних до OBJECT-типу
		 BULK COLLECT INTO Emp_list 
		 FROM emp
		 WHERE deptno = v_deptno;
	-- повернути колекцію 
	RETURN Emp_list;
END;

CREATE TYPE USR_INFO AS OBJECT (
 user_id 	NUMBER(10), 	
 username VARCHAR(20)
);

CREATE TYPE USR_INFO_LIST IS TABLE OF USR_INFO;

CREATE OR REPLACE FUNCTION get_usr_list(v_usr_id IN NUMBER)
RETURN USR_INFO_LIST
AS
	USR_RES USR_INFO_LIST := USR_INFO_LIST();
BEGIN
 	SELECT USR_INFO(user_id,username) 
		 BULK COLLECT INTO USR_RES
		 FROM users
		 WHERE user_id = v_usr_id;
	RETURN USR_RES;
END;

/*
4.2. Повторіть рішення попереднього завдання, але з використанням конвеєрної
табличної функції.
*/
CREATE OR REPLACE PACKAGE user_pkg IS
	-- оголошення типу як PL/SQL-запису, що визначається програмістом
	TYPE USR_INFO IS RECORD (
		usr_id	NUMBER(10),
		username VARCHAR(20)
	);
	TYPE USR_INFO_LIST IS TABLE OF USR_INFO;
	FUNCTION get_usr_list(v_user_id IN NUMBER)
		RETURN USR_INFO_LIST PIPELINED;
END user_pkg;

