-- 2.1. ��������� ��������� �������� 3 ����� 1, ������������ �������� ��������� ����� �
-- ������ �� ����� �� ������������� �������.
DECLARE
    v_avg_id USR.user_id%TYPE;
BEGIN
    SELECT AVG(user_id) INTO v_avg_id
    FROM usr
    WHERE username='lera';
    DBMS_OUTPUT.PUT_LINE('AWG id: ' || v_avg_id || ' ');
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Wrong username');
END;
/*
AWG id: 47 
PL/SQL procedure successfully completed.
*/
/

-- ���������� ������ ���� �� ��������




-- 2.2. ��������� ��������� �������� 3 ����� 1, ������������ �������� ���������
-- ������������� ������ �� �����.

DECLARE
    v_avg_id USR.user_id%TYPE;
BEGIN
    SELECT AVG(user_id) INTO v_avg_id
    FROM usr
    WHERE username='lera';
    DBMS_OUTPUT.PUT_LINE('AWG id: ' || v_avg_id || ' ');
   EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('There are a lot of users with this username');
END;
/




-- 2.3. ��������� ��������� �������� 3 ����� 1, ������������ �������� �� ���������
-- ��������� �������.

DECLARE
    v_owner CAR.user_id%TYPE := 1;
BEGIN
    INSERT INTO Car (car_id,make,user_id)
    VALUES (car_id_seq.NEXTVAL, 'AUDI',v_owner);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('wrong user id...');
END;
/
