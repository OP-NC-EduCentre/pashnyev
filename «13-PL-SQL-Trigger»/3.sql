/*
1. ��������� ������� ����������� DML-��������, �� ����������� ��� �������� ����
 ���� �����, ���������� ��� 䳿:
� �������� ������� � ��'�� LOG_��'�_�������. ��������� ������� ������� 
��������: ��'� �����������, ��� ��������, ���� ��������� ��������, ��������, 
�� ������ ���� �� ��� ��������.
� �������� ������ ������������.
��������� ������ ������� ������������ ��� �������� INSERT, UPDATE, DELETE.
*/
CREATE TABLE LOG_USR (
	new_manager_id	     NUMBER,	
	new_manager_name	 CHAR(40),	
	old_manager_name	 CHAR(40),
	old_manager_poition	 CHAR(25),	
	op_type	 	         CHAR(6),		
	change_date          DATE  
); 

CREATE OR REPLACE TRIGGER LOG_USR
	AFTER INSERT OR UPDATE OR DELETE ON USR
	FOR EACH ROW
DECLARE 
	op_type_ LOG_USR.op_type%TYPE;
BEGIN
	IF INSERTING THEN 
        op_type_ := 'INSERT'; 
    END IF;
	IF UPDATING THEN 
        op_type_ := 'UPDATE';  
    END IF;
	IF DELETING THEN 
        op_type_ := 'DELETE'; 
    END IF;
	INSERT INTO LOG_MANAGERS VALUES (
		:NEW.USER_ID,
		:NEW.USERNAME,
		:OLD.USER_ID,
		:OLD.USERNAME, 
		op_type_,
		SYSDATE
	);
END;
/
/*
2. ����������, �� ��������������� ���� �� 12-� ����, ��� �� ������� �������
DEFAULT SEQUENCE, ���� �������� ����������� ������ ���� �������� ���������� �����, 
���� ���� �� ������ ��� �������� ��������. ��� ����-��� ������� ���� ���� ����� 
�������� ������ � ��������� �������� DEFAULT SEQUENCE. ������� ����-���� ��������
������ �������.
*/
CREATE SEQUENCE CAR_ID_sequ
  MINVALUE 1
  MAXVALUE 1000
  START WITH 60
  INCREMENT BY 1;

CREATE TRIGGER usr_default_sequence 
	BEFORE INSERT 
	ON CAR
	FOR EACH ROW
BEGIN
	if :NEW.car_id IS NULL THEN
		:NEW.car_id := CAR_ID_sequ.NEXTVAL;
	END IF;
END;
/
