-- 1.1. ������� ������� ���� �����, �� ������ �������� ���� date. �������� ����, ��
-- ���������� �������� ���� �������, �������������� ��������� ���� �����. ������� ������
-- ��������, �������������� SQL-������� ��� ���������� ������� �����������, ������������
-- ���� �� ��������� �����. ������� �� ����� �����.

ALTER TABLE usr
ADD birthday Date;

DECLARE
    v_usr Usr%ROWTYPE;
BEGIN
	v_usr.username := 'Albinos';
	v_usr.user_id := 53;
    v_usr.birthday := TO_DATE('12/12/2002', 'DD/MM/YYYY');
    DBMS_OUTPUT.PUT_LINE('username: ' || v_usr.username);
    DBMS_OUTPUT.PUT_LINE('user_id: ' || v_usr.user_id);
     DBMS_OUTPUT.PUT_LINE('user_birthday: ' || v_usr.birthday);
    
END;
/

/*
username: Albinos
user_id: 53
user_birthday: 12-DEC-02


PL/SQL procedure successfully completed.
*/




-- 1.2. ������ ���������� �� ���� � �������, ������ � ������������ �������.
-- ��������������� ���������� ������ �������� ����������� �� ������������ ������� ����.





-- 1.3. ��� ���� � ������� �������� ������� ��������� ���������� �������� ���� �
-- ����� �������, �������������� ����� ������ �� ������� ��������� ���� �������. ���������
-- �������� ����� � ������� �� �����.

DECLARE
    v_avg_id USR.user_id%TYPE;
BEGIN
    SELECT AVG(user_id) INTO v_avg_id
    FROM usr
    WHERE username='lera';
    DBMS_OUTPUT.PUT_LINE('AWG id: ' || v_avg_id || ' ');
END;
/
/*AWG id: 47 


PL/SQL procedure successfully completed.
*/
-- ������� ���� ���������: 1,75 �




-- 1.4. ��������� �������� 5 ����� � ������� ���� �����, �������������� ���� �
-- �����������. �������� ���������� ����� ����������� �����������, ����� ����� ����������.

BEGIN
    FOR i IN 1..5 LOOP
        INSERT INTO spr (TYPE_SPR,CREATOR,SPARE_ID,ORD_ID)
        VALUES ('Engine', 'Kawasaki',spr_seq.nextval,2);
    END LOOP;
END;
/