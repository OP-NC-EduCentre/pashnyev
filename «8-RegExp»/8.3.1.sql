/*
1. Одна з колонок таблиць повинна містити строкове значення з двома словами,
розділеними пробілом. Виконайте команду UPDATE, помінявши місцями ці два слова.
*/
SELECT 
    regexp_replace(
        'hello world',
		'(.*)\s(.*)',
		'\2 \1') 
FROM dual;

/*
2. Одна з колонок таблиць має містити строкове значення з електронною поштовою
адресою у форматі EEE@EEE.EEE.UA, де E – будь-яка латинська буква. Створіть запит,
вилучення логіна користувача з електронної адреси (підстрока перед символом @).
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
3. Одна з колонок таблиць повинна містити строкове значення з номером мобільного
телефону у форматі +XX(XXX)XXX-XX-XX, де X – цифра. Виконайте команду UPDATE,
додавши перед номером телефону фразу «Mobile:».

*/
SELECT 
    regexp_replace(
	    '+75(380)097-76-54','^',
		'Mobile: ') 
FROM dual;

/*
4. Додайте до колонки з електронною адресою обмеження цілісності, що забороняє
вносити дані, відмінні від формату електронної адреси, використовуючи команду ALTER TABLE
таблиця ADD CONSTRAINT обмеження CHECK (умова). Перевірте роботу обмеження на двох
прикладах UPDATE-запитів із правильними та неправильними значеннями колонки.
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
5. Видаліть зайві дані з колонки з номером мобільного телефону, залишивши тільки номер
телефону в заданому форматі.
*/
SELECT 
    regexp_replace(
	    phone,
		'd{10}','_') 
FROM user_phone;



/*
6. Додайте в колонку з мобільним телефоном обмеження цілісності, що забороняє вносити
дані, відмінні від формату, записаного в завданні 3. Перевірте роботу обмеження на двох
прикладах UPDATE-запитів із правильними та неправильними значеннями колонки.


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
  

