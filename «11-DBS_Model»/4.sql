-- 4.1. ��������� �������� 5 ����� � ������� ���� ����� �� ��������� ����������
-- �������. �������� ���������� ����� ����������� �����������, ����� ����� ����������.
create sequence car_id_seq start with 100;
DECLARE
    sql_str VARCHAR2(500);
    v_id CAR.car_id%TYPE;
    v_mode CAR.mode_car%TYPE;
    v_user_id CAR.USER_ID%TYPE;
    v_make CAR.MAKE%TYPE;
BEGIN
    sql_str := 'INSERT INTO CAR (make,mode_car,car_id,user-id) VALUES (:1, :2, :3,:4)';

    FOR i IN 1..5 LOOP
        v_make := 'toyota';
        v_mode:= 'corola';
        v_id :=car_id_seq.nextval;
        v_user_id:= 47;
        
        EXECUTE IMMEDIATE sql_str 
            USING v_make, v_mode, v_id,v_user_id;
    END LOOP;
END;
/





-- 4.2. ������� ��������� ����� ��������� �������, ������� ������� ��� ������ ��������
-- ����-��� ��������� �������. ���������� �������� �������� ��������� ������� � ��
-- ����������.

DECLARE 
	create_str VARCHAR2(500);
	v_count NUMBER;
BEGIN
    SELECT 1 INTO v_count
		FROM all_tables 
		WHERE table_name= upper('spr') AND 
				owner=upper('pashnyev');
	
    EXECUTE IMMEDIATE 'DROP TABLE spr';
END;
/





-- 4.3. ������� ALTER SEQUENCE ���� �������� ��������� �������� ����������
-- ��������� � ���� ���� 12. ��� ����� ����� ���������� ���������� �� �������: ���������
-- ���������� �� ��������� ���������� � ����� ���������� ���������.
-- 
-- � ����������� ���� ��������� ������ �������� �������� PL/SQL-����, ����
-- ����������� ���� �� ������� SQL-������ ���� ����������� �������� ���������� ������� ��
-- �������� ���� ����.

DECLARE
    new_value NUMBER(4) := 15;
    sql_str VARCHAR2(500);
BEGIN
    DBMS_OUTPUT.PUT_LINE('����� ����: ' || DBMS_DB_VERSION.VERSION);
    
        sql_str := 'ALTER SEQUENCE car_id_seq RESTART START WITH ' || new_value;
        EXECUTE IMMEDIATE sql_str;
    DBMS_OUTPUT.PUT_LINE('��������� �����: ' || sql_str);
END;
/

-- ����� ����: 21
-- ��������� �����: ALTER SEQUENCE slot_id RESTART START WITH 15