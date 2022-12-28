/*
1. �������� ������� ��� ��������� ��������� DDL-����: ��� ��䳿, 
�� ���������� ������ �������; ��'� �����������; ��'� ��'���� ��. 
�������� ������ ��������� ������� ���� ��������� ��'����. 
������ ����-����� �������� ������ �������.
*/
CREATE TABLE DLL_WATCHER
(
    operation   VARCHAR2(30),
    username   VARCHAR2(30),
    obj_name    VARCHAR2(30)
);

CREATE OR REPLACE TRIGGER DLL_WATCHER
    AFTER CREATE OR ALTER OR DROP
    ON ADMIN.SCHEMA
BEGIN
    INSERT INTO DLL_WATCHER
    VALUES(
		ORA_SYSEVENT, 
		ORA_LOGIN_USER, 
		ORA_DICT_OBJ_NAME
    );
END;
/
          
