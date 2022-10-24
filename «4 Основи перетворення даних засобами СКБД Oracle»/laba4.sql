
/*1.1 ��� ��� ������� ���� �� �������� ���������� �����������, ��� �����������
����������� ��������� ����� ������� �������, �� ������� � ��������� ����. ��������� ��������
����� � ��������. �������� ������� �������� ������ ����� �� ����� �������.*/

CREATE SEQUENCE test_seq START WITH 4;
CREATE SEQUENCE another_seq start WITH 10;
CREATE SEQUENCE ord_seq start WITH 1000;

/*1.2 ��� ��� ��� ��������'������ ������� �������� ����������, �� ��������� �� INSERT-
������� �������� ����� � �� ������� ����� ���� � ����������� ��'���� �� PK-�������� �����
������� � FK-�������� 2-� ������� ���� � ������������� ������������� NEXTVAL � CURRVAL.
*/

insert into usr values(test_seq.nextval,'Anton');
insert into car values('BMV','X5',another_seq.nextval,test_seq.CURRVAL);

/*
1.3 �������� ���������� ��� ������� ���������� �������������, �������������� ��������
������� ���� Oracle.
*/
SELECT * FROM USER_SEQUENCES;

/*
ANOTHER_SEQ	1	9999999999999999999999999999	1	N	N	20	70	N	N	N	N
TEST_SEQ	1	9999999999999999999999999999	1	N	N	20	84	N	N	N	N
*/

/*
1.4 �������������� ���� Oracle >= 12 ��� ���� � ������� �������� ��������� ���������
������� PK-������� ����� DEFAULT-��������. �������� ������� �������� ������ ����� �� �������.?
*/




ALTER TABLE ord MODIFY 
	(order_id number DEFAULT ord_seq.nextval);





SELECT columns
FROM usr
FULL outer JOIN car
ON usr.username = car.mode_car;

SELECT 
	usr.username, 
	spr.creator
	FROM usr
	CROSS JOIN spr;
