/*
1. Створити таблицю для реєстрації наступних DDL-подій: тип події, 
що спричинила запуск тригера; ім'я користувача; ім'я об'єкта БД. 
Створити тригер реєстрації заданих подій створення об'єктів. 
Подати тест-кейси перевірки роботи тригера.
*/
CREATE TABLE DLL_WATCHER_NEW
(
    operation   VARCHAR2(30),
    username   VARCHAR2(30),
    obj_name    VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER DLL_WATCHER_NEW
    AFTER CREATE OR ALTER OR DROP
    ON PASHNYEV.SCHEMA
BEGIN
    INSERT INTO DLL_WATCHER
    VALUES(
		ORA_SYSEVENT, 
		ORA_LOGIN_USER, 
		ORA_DICT_OBJ_NAME
    );
END;
/

CREATE TABLE test
(
    something NUMBER(8)
);

DROP TABLE test;



select * from DLL_WATCHER
          
/*
CREATE	PASHNYEV	TEST
DROP	PASHNYEV	TEST
*/
       
          
