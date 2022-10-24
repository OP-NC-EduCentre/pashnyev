
/*
3.1 Для будь-яких двох таблиць створити команду отримання декартового добутку.
*/
SELECT usr.username, car.make
FROM usr CROSS JOIN 
car;
/*
Alban	Kia
George	Kia
Misha	Kia
Ivan	Kia
Anton	Kia
Anatolii	Kia
Ruslan	Kia
Alban	Nissan
George	Nissan
Misha	Nissan
Ivan	Nissan
Anton	Nissan
Anatolii	Nissan
Ruslan	Nissan
Alban	Lambo
George	Lambo
Misha	Lambo
Ivan	Lambo
Anton	Lambo
Anatolii	Lambo
Ruslan	Lambo
Alban	Lambo
George	Lambo
Misha	Lambo
Ivan	Lambo
Anton	Lambo
Anatolii	Lambo
Ruslan	Lambo
Alban	Porsh
George	Porsh
Misha	Porsh
Ivan	Porsh
Anton	Porsh
Anatolii	Porsh
Ruslan	Porsh
*/

/*3.2 Для двох таблиць, пов'язаних через PK-колонку та FK-колонку, створити команду
отримання двох колонок першої та другої таблиць з використанням екві-з’єднання таблиць.
Використовувати префікси.
*/
SELECT 
    car.user_id, 
	usr.user_id
FROM car JOIN usr ON (car.user_id=usr.user_id)
WHERE 
    usr.username = 'Misha';
    
/*
3.3 Повторити рішення попереднього завдання, застосувавши автоматичне визначення умов
екві-з’єднання.
*/

/*
3.4 Повторити рішення завдання 3.2, замінивши еквіз'єднання на зовнішнє з'єднання
(лівостороннє або правостороннє), яке дозволить побачити рядки таблиці з PK-колонкою, не пов'язані
з FK-колонкою.
*/
SELECT make,mode_car,usr.username FROM car
LEFT JOIN usr
ON car.car_id = car.user_id;
    

