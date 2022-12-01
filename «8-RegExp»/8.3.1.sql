/*
1. ���� � ������� ������� ������� ������ �������� �������� � ����� �������,
���������� �������. ��������� ������� UPDATE, �������� ������ �� ��� �����.
*/
SELECT 
    regexp_replace(
        'hello world',
		'(.*)\s(.*)',
		'\2 \1') 
FROM dual;

/*
2. ���� � ������� ������� �� ������ �������� �������� � ����������� ��������
������� � ������ EEE@EEE.EEE.UA, �� E � ����-��� ��������� �����. ������� �����,
��������� ����� ����������� � ���������� ������ (�������� ����� �������� @).
*/         
  SELECT 
    regexp_substr(
        'ger@com.EDU.UA',
		'[A-Z a-z]{3}') 
from dual;

SELECT 
    regexp_substr(
        ' E-mail my@ukr.net ',
        '([a-z][a-z0-9._%-]+@[a-z0-9._%-]+\.[a-z]{2,4})') 
from dual;
/*
3. ���� � ������� ������� ������� ������ �������� �������� � ������� ���������
�������� � ������ +XX(XXX)XXX-XX-XX, �� X � �����. ��������� ������� UPDATE,
������� ����� ������� �������� ����� �Mobile:�.

*/
SELECT 
    regexp_replace(
	    '+75(380)097-76-54','^',
		'Mobile: ') 
FROM dual;

/*
4. ������� �� ������� � ����������� ������� ��������� ��������, �� ���������
������� ���, ����� �� ������� ���������� ������, �������������� ������� ALTER TABLE
������� ADD CONSTRAINT ��������� CHECK (�����). �������� ������ ��������� �� ����
��������� UPDATE-������ �� ����������� �� ������������� ���������� �������.
*/

CREATE TABLE user_email (email VARCHAR2(20),
 CHECK (REGEXP_LIKE(email,'[A-z]@[A-z]')));

 
INSERT INTO user_email VALUES ('pashnev@com')
INSERT INTO user_email VALUES ('pashnev.com')
  
  /*
  1 row inserted.


Error starting at line : 46 in command -
INSERT INTO user_email VALUES ('pashnev.com')
Error report -
ORA-02290: check constraint (PASHNYEV.SYS_C00113926) violated
  */


/*
5. ������� ���� ��� � ������� � ������� ��������� ��������, ��������� ����� �����
�������� � �������� ������.
*/
SELECT 
    regexp_replace(
	    phone,
		'd{10}','_') 
FROM user_phone;



/*
6. ������� � ������� � �������� ��������� ��������� ��������, �� ��������� �������
���, ����� �� �������, ���������� � ������� 3. �������� ������ ��������� �� ����
��������� UPDATE-������ �� ����������� �� ������������� ���������� �������.


*/
DROP TABLE user_phone;
CREATE TABLE user_phone (phone VARCHAR2(20),
 CHECK (REGEXP_LIKE(phone,'[0-9]{10}')));

 
 INSERT INTO user_phone VALUES (7777777777);
 
 INSERT INTO user_phone VALUES(5);
/*
1 row inserted.


Error starting at line : 80 in command -
 INSERT INTO user_phone VALUES(5)
Error report -
ORA-02290: check constraint (PASHNYEV.SYS_C00113929) violated


*/
  

