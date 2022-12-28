-- 1. �������� ����������� ������ ��� ��������� ����������� �� ����� ����
-- ���������, ���� ��� ��������� ����� � ����-��� ������� ���� ���� ����� �� �����������
-- � ���������� ��������, �� ��� ��������� ������. ������� ����-���� �������� ������
-- �������.
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER user_modification
    AFTER INSERT OR UPDATE OR DELETE ON usr
BEGIN
    dbms_output.enable;
    IF INSERTING THEN
        dbms_output.put_line('INSERTING INTO USER ... ');
    ELSIF UPDATING THEN
        dbms_output.put_line('UPDATING USER ... ');
    ELSIF DELETING THEN
        dbms_output.put_line('DELETING USER ... ');
    END IF;
END;


INSERT INTO usr (user_id,username)
VALUES (48,'vika');


/*
INSERTING INTO FURNITURE ... 
1 row inserted.
*/

DELETE FROM usr WHERE user_id = 49;

/*
DELETING FURNITURE ... 
0 rows deleted.
*/

-- 2. ��������� �������� �������� ���� �� ��� ������ �����������, ��'� �����
-- �������� � ����� ������. ������� ����-���� �������� ������ �������.

CREATE OR REPLACE TRIGGER usr_modification
    AFTER INSERT OR UPDATE OR DELETE ON usr
    FOR EACH ROW
    WHEN (USER = 'pashnyev')
BEGIN
    IF INSERTING THEN
        dbms_output.put_line('PASHNYEV INSERTING INTO USER ... ');
    ELSIF UPDATING THEN
        dbms_output.put_line('PASHNYEV UPDATING USER ... ');
    ELSIF DELETING THEN
        dbms_output.put_line('PASHNYEV DELETING USER ... ');
    END IF;
END;

INSERT INTO usr (user_id,username)
VALUES (50,'Katya');



/*

INSERTING INTO USER ... 


1 row inserted.
*/

-- ��� ������������ ����������� ����� ������� ������ ��'� �����������

CREATE OR REPLACE TRIGGER user_modification
    AFTER INSERT OR UPDATE OR DELETE ON usr
    FOR EACH ROW
    WHEN (USER = 'wrong_user')
BEGIN
    IF INSERTING THEN
        dbms_output.put_line('INSERTING INTO USER ... ');
    ELSIF UPDATING THEN
        dbms_output.put_line('UPDATING USER ... ');
    ELSIF DELETING THEN
        dbms_output.put_line('DELETING USER ... ');
    END IF;
END;



DELETE FROM USR WHERE user_id = 5;

-- 0 rows deleted.