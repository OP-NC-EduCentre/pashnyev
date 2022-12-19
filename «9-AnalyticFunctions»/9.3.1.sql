/*
1. Класифікуйте значення однієї з колонок на 3 категорії залежно від загальної суми
значень у будь-якій числовій колонці. Використати аналітичну функцію NTILE.
*/

SELECT 
	NTILE(3) OVER (ORDER BY car_id) AS car_id_ntile, 
	make, 
	mode_car,
    car_id
FROM car;

/*
1	Kia	Sportage
1	Nissan	Juke
1	Lamborgini	Urus
2	Lamborgini	Aventador
2	Porsh	Carerra
2	Skoda	Octavia
3		
3	Kia	Optima
*/
/*
2. Складіть запит, який поверне списки лідерів (список за убуванням відповідного
значення) у підгрупах, отриманих у першому завданні етапу 1.
*/
WITH 
car_sort_rownum AS (
    SELECT make, mode_car,car_id,
    NTILE(3) OVER (ORDER BY car_id) AS car_id_ntile, 
    ROW_NUMBER() OVER ( ORDER BY car_id desc ) AS r 
        
	FROM car
),ready as(
    SELECT make, mode_car,car_id,car_id_ntile,
    ROW_NUMBER() OVER(
		                 PARTITION BY car_id_ntile 
						 ORDER BY car_id DESC
					 ) AS r 
        
	FROM car_sort_rownum
    )
SELECT *
FROM ready
WHERE r <=1;
 /*
Lamborgini	Urus	32	1	1
Skoda	Octavia	70	2	1
Kia	Optima	132	3	1
 */
/*
3. Модифікуйте рішення попереднього завдання, повернувши по 2 лідери у кожній
підгрупі.
*/

WITH 
car_row_number AS (
    SELECT 
	    make,
		mode_car,
		car_id,user_id, 
        NTILE(3) OVER (ORDER BY car_id) AS car_id_ntile
	FROM car
)
, ready as(
    SELECT make, mode_car,car_id,car_id_ntile,
    ROW_NUMBER() OVER(
		                 PARTITION BY car_id_ntile 
						 ORDER BY car_id DESC
					 ) AS r 
        
	FROM car_row_number
    )
SELECT *
FROM ready
WHERE r <= 2;

/*
4. Складіть запит, який повертає рейтинг будь-якого з перерахованих значень
відповідно до вашої предметноїобласті: товарів/послуг/співробітників/клієнтів тощо.
*/

WITH 
car_test AS (
    SELECT 
	    make, 
		mode_car, 
	    ROW_NUMBER() OVER (
                         ORDER BY car_id ASC 
					 ) AS r 
		FROM car
)
SELECT 
    make, 
	mode_car
FROM car_test
order by r
    /*
Kia	Sportage
Nissan	Juke
Lamborgini	Urus
Lamborgini	Aventador
Porsh	Carerra
Skoda	Octavia
	
Kia	Optima
    */
/*
5. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення. Створіть запит, який
отримає перше значення у кожній підгрупі. Використати аналітичну функцію
FIRST_VALUE.
*/

    SELECT 
	    make,mode_car,
	    FIRST_VALUE(car_id) OVER (
		                     PARTITION BY user_id ORDER BY car_id DESC 
				             rows 
							     between unbounded preceding 
							     and unbounded following
						 ) as max_car_id
	FROM car

/*
Kia	Sportage	1
		100
Nissan	Juke	100
Porsh	Carerra	51
Lamborgini	Aventador	51
Lamborgini	Urus	51
Kia	Optima	132
Skoda	Octavia	70
*/
