drop table ATTRIBUTES CASCADE CONSTRAINTS;
--5.1 Створити таблицю описів значень атрибутів екземплярів об'єктів.
CREATE TABLE ATTRIBUTES (
	ATTR_ID NUMBER(10),
	OBJECT_ID NUMBER(20),
	VALUE VARCHAR2(4000),
	DATE_VALUE DATE,
	LIST_VALUE_ID NUMBER(10)
);  

ALTER TABLE ATTRIBUTES ADD CONSTRAINT ATTRIBUTES_PK
	PRIMARY KEY (ATTR_ID, OBJECT_ID);
ALTER TABLE ATTRIBUTES ADD CONSTRAINT ATTRIBUTES_LIST_VALUE_ID_FK
	FOREIGN KEY (LIST_VALUE_ID) REFERENCES LISTS (LIST_VALUE_ID);
ALTER TABLE ATTRIBUTES ADD CONSTRAINT ATTRIBUTES_ATTR_ID_FK
	FOREIGN KEY (ATTR_ID) REFERENCES ATTRTYPE (ATTR_ID);
ALTER TABLE ATTRIBUTES ADD CONSTRAINT ATTRIBUTES_OBJECT_ID_FK
	FOREIGN KEY (OBJECT_ID) REFERENCES OBJECTS (OBJECT_ID);
    
--5.2 На основі вмісту двох рядків двох таблиць, заповнених у лабораторній роботі No3, та опису атрибутів екземплярів об'єктів, заповнити описи значень атрибутів екземплярів об'єктів.   

INSERT INTO ATTRIBUTES(ATTR_ID, OBJECT_ID, VALUE)
	VALUES(4, 3, 'Petrov Petr'); 
INSERT INTO ATTRIBUTES(ATTR_ID, OBJECT_ID, value)
	VALUES(5, 3, another_seq.NEXTVAL);
/*5.3 Модифікувати рішення завдання 4.3, отримавши колекцію екземплярів об'єктів за заданим
значенням одного з атрибутів об'єктів.*/
SELECT *
	FROM attributes
	WHERE OBJECT_ID = 3;
    /*
4	3	Petrov Petr		
5	3	111		
*/

    
    