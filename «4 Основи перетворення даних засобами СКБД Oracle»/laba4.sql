
/*1.1 Для всіх таблиць нової БД створити генератори послідовності, щоб забезпечити
автоматичне створення нових значень колонок, які входять у первинний ключ. Врахувати наявність
рядків у таблицях. Виконати тестове внесення одного рядка до кожної таблиці.*/

CREATE SEQUENCE test_seq START WITH 4;
CREATE SEQUENCE another_seq start WITH 10;
CREATE SEQUENCE ord_seq start WITH 1000;

/*1.2 Для всіх пар взаємопов'язаних таблиць створити транзакції, що включають дві INSERT-
команди внесення рядка в дві таблиці кожної пари з урахуванням зв'язку між PK-колонкою першої
таблиці і FK-колонкою 2-ї таблиці пари з використанням псевдоколонок NEXTVAL і CURRVAL.
*/

insert into usr values(test_seq.nextval,'Anton');
insert into car values('BMV','X5',another_seq.nextval,test_seq.CURRVAL);

/*
1.3 Отримати інформацію про створені генератори послідовностей, використовуючи системну
таблицю СУБД Oracle.
*/
SELECT * FROM USER_SEQUENCES;

/*
ANOTHER_SEQ	1	9999999999999999999999999999	1	N	N	20	70	N	N	N	N
TEST_SEQ	1	9999999999999999999999999999	1	N	N	20	84	N	N	N	N
*/

/*
1.4 Використовуючи СУБД Oracle >= 12 для однієї з таблиць створити генерацію унікальних
значень PK-колонки через DEFAULT-оператор. Виконати тестове внесення одного рядка до таблиці.?
*/




ALTER TABLE ord MODIFY 
	(order_id number DEFAULT ord_seq.nextval);





SELECT columns
FROM usr
FULL outer JOIN car
ON usr.username = car.mode_car;

SELECT 
	usr.username, 
	spr.creator
	FROM usr
	CROSS JOIN spr;
