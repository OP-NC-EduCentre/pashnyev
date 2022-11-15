/*
3.1 Створити нового користувача, ім'я якого = «ваше_прізвище_латиницею»+'EAV',
наприклад, blazhko_eav, з правами, достатніми для створення та заповнення таблиць БД EAV.
*/

CREATE USER PASHNEV_EAV IDENTIFIED BY p1234;
GRANT CONNECT TO PASHNEV_EAV;
/*
3.2 Створити таблиці БД EAV та заповнити таблиці об'єктних типів та атрибутних типів,
взявши рішення з лабораторної роботи No5.
*/
CREATE TABLE attrtype
(
    attr_id            NUMBER(20),
    object_type_id     NUMBER(20),
    object_type_id_ref NUMBER(20),
    code               VARCHAR2(20),
    name               VARCHAR2(200)
);

ALTER TABLE attrtype
    ADD CONSTRAINT attrtype_pk
        PRIMARY KEY (attr_id);
ALTER TABLE attrtype
    ADD CONSTRAINT attrtype_object_type_id_fk
        FOREIGN KEY (object_type_id) REFERENCES objtype (object_type_id);
ALTER TABLE attrtype
    ADD CONSTRAINT attrtype_object_type_id_ref_fk
        FOREIGN KEY (object_type_id_ref) REFERENCES objtype (object_type_id);
        
/*
3.3 Створити генератор послідовності таблиці OBJECTS БД EAV, ініціалізувавши його
початковим значенням з урахуванням вже заповнених значень.
*/
        
CREATE SEQUENCE obj_seq start with 20;

/*
3.4 Налаштувати права доступу нового користувача до таблиць схеми даних із таблицями
реляційної БД вашої предметної області, створеної в лабораторній роботі No2.
*/
GRANT RESOURCE TO PASHNEV_EAV;
GRANT CREATE VIEW TO PASHNEV_EAV;
ALTER USER PASHNEV_EAV quota unlimited on USERS;
/*
3.5 Створити множину запитів типу INSERT INTO ... SELECT, які автоматично заповнять
таблицю OBJECTS, взявши потрібні дані з реляційної бази даних вашої предметної області.
*/

INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME)
	SELECT obj_seq.NEXTVAL,NULL,OT.OBJECT_TYPE_ID,usr.username
	FROM OBJTYPE OT, USR
	WHERE 
	    OT.CODE = 'USR';
    select * from OBJECTS;
    
    /*
    20		3	Alban	
    21		3	George	
    22		3	Misha	
    23		3	Dima	
    24		3	Ivan	
    25		3	Anton	
    26		3	Anatolii	
    27		3	Ruslan	
    */