/*
1.1 Створити віртуальну таблицю, структура та вміст якої відповідає рішенню завдання
4.2 з лабораторної роботи No3: для однієї з таблиць створити команду отримання значень усіх
колонок (явно перерахувати) за окремими рядками з урахуванням умови, в якій рядкове
значення однієї з колонок має співпадати з якимось константним значенням. Отримати вміст
таблиці.
*/
 CREATE OR REPLACE VIEW CARS
(make,mode_car,car_id)
AS
SELECT make,mode_car,car_id
	FROM car;


select * from CARS where make='Kia';
/*
Kia	Optima
Kia	Sportage
*/



 /* Виконати команду зміни значення колонки створеної віртуальної таблиці на
 значення, яка входить в умову вибірки рядків із рішення попереднього завдання, 
 при цьому новезначення має відрізнятись від поточного.*/
 
 UPDATE CARS SET make = 'Lamborgini'
	WHERE make = 'Lambo';
 /*
 1.3 Створити віртуальну таблицю, структура та вміст якої відповідає рішенню завдання
3.2 з лабораторної роботи No4: для двох таблиць, пов'язаних через PK-колонку та FK-колонку,
створити команду отримання двох колонок першої та другої таблиць з використанням екві-
сполучення таблиць. Отримати вміст таблиці.
 */


 CREATE OR REPLACE VIEW CAR_LIST
(username,mode_car,make)
AS
SELECT 
    usr.username,
    car.mode_car,
    car.make
FROM car JOIN usr ON (car.user_id=usr.user_id)


select * from CAR_LIST where username='Misha';
/*2	2	Misha	Juke
  2 2	Misha	    */
  
 
	
/*
 1.4 Виконати команду додавання нового рядка до однієї з таблиць, що входить до запиту
з попереднього завдання.
*/

insert into CARS values('Skoda','Octavia',70);
    
