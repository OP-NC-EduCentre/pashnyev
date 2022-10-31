
drop table OBJTYPE CASCADE CONSTRAINTS;
/*1.1. �������� ������� ����� ��'������ ����.*/
CREATE TABLE OBJTYPE (
	OBJECT_TYPE_ID NUMBER(20),
	PARENT_ID      NUMBER(20),
	CODE           VARCHAR2(20),
	NAME           VARCHAR2(200),
	DESCRIPTION    VARCHAR2(1000)
);


/*1.2.����� � ����������� ����� No1 ���� �������� UML-������� �������������� �����. ���
����� ����� � UML-�������, ���'������ �� �����, ������ ��'����� ��������������, ����������
���������� �� ���������� ����������, ��������� ���� ��'������ ����.*/
ALTER TABLE OBJTYPE ADD CONSTRAINT OBJTYPE_PK
	PRIMARY KEY (OBJECT_TYPE_ID);
ALTER TABLE OBJTYPE ADD CONSTRAINT OBJTYPE_CODE_UNIQUE
	UNIQUE (CODE);
ALTER TABLE OBJTYPE 
	MODIFY (CODE NOT NULL);
ALTER TABLE OBJTYPE ADD CONSTRAINT OBJTYPE_FK
	FOREIGN KEY (PARENT_ID) REFERENCES OBJTYPE(OBJECT_TYPE_ID);
    
    INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) 
	VALUES (3,NULL,'USR','User','just_user');
    
    INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) 
	VALUES (1,3,'ORD','Order','Order_of_user');
    
    INSERT INTO OBJTYPE (OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION) 
	VALUES (2,3,'CAR','Car','Cars_of_user');
    
/*1.3 �������� ���������� ��� ��'���� ����.*/
    
    select OBJECT_TYPE_ID,PARENT_ID,CODE,NAME,DESCRIPTION from objtype;
    /*
    3   3	USR	User	just_user
    1	3	ORD	Order	Order_of_user
    2	3	CAR	Car	Cars_of_user
    */
   /*1.4 �������� ���������� ��� ��'���� ���� �� ������ ��'���� �� ���� ���� ��������������,
���������� ����������. */
SELECT P.OBJECT_TYPE_ID,P.CODE,
	C.OBJECT_TYPE_ID OBJ_T_ID_LINK, C.CODE CODE_LINK
	FROM OBJTYPE C, OBJTYPE P
	WHERE P.OBJECT_TYPE_ID = C.PARENT_ID(+);
    /*
    3	USR	1	ORD
    3	USR	2	CAR
    1	ORD		
    2	CAR		
    */
    