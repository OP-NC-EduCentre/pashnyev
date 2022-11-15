/*
2.1 Створити віртуальну таблицю, структура та вміст якої відповідає рішенню завдання
2.3 з лабораторної роботи No5, але враховує опцію «WITH READ ONLY»: отримати інформацію
про атрибутні типи. Отримати вміст таблиці.

*/

CREATE or REPLACE VIEW LIST_EAV
(O_CODE,ATR_ID,A_CODE,A_NAME)
AS
SELECT O.CODE,A.ATTR_ID,A.CODE,A.NAME
FROM OBJTYPE O, ATTRTYPE A
WHERE O.OBJECT_TYPE_ID = A.OBJECT_TYPE_ID
ORDER BY A.OBJECT_TYPE_ID,A.ATTR_ID
WITH READ ONLY;
-- Отримання вмісту віртуальної таблиці
SELECT * 
FROM LIST_EAV;
/*
ORD	1	OWN_ID	Owner id
ORD	2	ORD_DATE	Order date
CAR	3	MOD	Model of car
USR	4	USR	Username
USR	5	USR_ID	Username id
*/
/*
2.2 Виконати видалення одного рядка з віртуальної таблиці, створеної у попередньому
завданні. Прокоментувати реакцію СУБД.
*/
DELETE FROM LIST_EAV
WHERE ATR_ID=2;
/*SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
42399.0000 - "cannot perform a DML operation on a read-only view"
/*

2.3 Створити віртуальну таблицю, що містить дві колонки:
назва класу, кількість екземплярів об'єктів класу. Отримати вміст таблиці.
*/

CREATE OR REPLACE VIEW EAV_COUNT
AS 
SELECT OBJECT_TYPE_ID,count(OBJECT_ID)
FROM ATTRTYPE
GROUP BY OBJECT_TYPE_ID
ORDER BY OBJECT_TYPE_ID
WITH READ ONLY;

select * from EAV_COUNT;
/*
2.4 Перевірити можливість виконання операції зміни даних у віртуальній таблиці,
створеної у попередньому завданні. Прокоментувати реакцію СУБД.
*/
insert into EAV_COUNT values(3,5)
/*
SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
42399.0000 - "cannot perform a DML operation on a read-only view"
*/
