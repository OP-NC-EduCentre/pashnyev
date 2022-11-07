--4.1 �������� ������� ����� ���������� ��'����.
drop table objects CASCADE CONSTRAINTS;
CREATE TABLE OBJECTS (
	OBJECT_ID      NUMBER(20),
	PARENT_ID      NUMBER(20),
	OBJECT_TYPE_ID NUMBER(20),
	NAME           VARCHAR2(2000),
	DESCRIPTION    VARCHAR2(4000)
);

ALTER TABLE OBJECTS ADD CONSTRAINT OBJECTS_PK
	PRIMARY KEY (OBJECT_ID);
ALTER TABLE OBJECTS ADD CONSTRAINT OBJECTS_PARENT_ID_FK
	FOREIGN KEY (PARENT_ID) REFERENCES OBJECTS (OBJECT_ID);
ALTER TABLE OBJECTS ADD CONSTRAINT OBJECTS_OBJECT_TYPE_ID_FK
	FOREIGN KEY (OBJECT_TYPE_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID);
--4.2 �� ����� ����� ���� ����� ���� �������, ���������� � ����������� ����� No3,��������� ����� ���������� ��'����.
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) 
	VALUES (3,NULL,3,'newUser','unknown user');
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) 
	VALUES (1,3,1,'newOrder','unknown user make order');
INSERT INTO OBJECTS (OBJECT_ID,PARENT_ID,OBJECT_TYPE_ID,NAME,DESCRIPTION) 
	VALUES (2,3,2,'newCar','unknown user make car');
    --4.3 �������� �������� ���������� ��'���� ��� ������ � ��'������ ����, �������������� ���� ���.
    SELECT OBJECT_ID,NAME
	FROM OBJECTS
	WHERE OBJECT_TYPE_ID = 3;
    /*3	newUser*/
--4.4 �������� ���� ��������� ��'���� �������� ���� ��� ������ � ��'������ ����,�������������� ���� ���.
SELECT OBJECT_ID,NAME
	FROM OBJECTS
	WHERE OBJECT_ID = 1;
    /*1	newOrder*/