/*
1. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення.
Створіть запит, який отримає накопичувальні підсумки другої колонки від початку
вікна до поточного рядка.
*/

SELECT 
    mode_car, 
	make, 
	user_id, 
	car_id, 
	SUM(car_id) OVER ( 
	             ORDER BY car_id
				 ROWS BETWEEN UNBOUNDED PRECEDING 
				 AND CURRENT ROW
			 ) AS sum_car_id 
FROM car; 

/*
Sportage	Kia	1	1	1
Juke	Nissan	2	2	3
Urus	Lamborgini	25	32	35
Aventador	Lamborgini	25	50	85
Carerra	Porsh	25	51	136
Octavia	Skoda		70	206
		2	100	306
Optima	Kia	26	132	438
*/

/*
2. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення.
Створіть запит, який отримає накопичувальні підсумки другої колонки
попереднього та поточного рядка (ковзаюче вікно розміром 2 рядки).
*/

SELECT
	user_id,
	make,
	mode_car, 
    car_id,
	ROUND(sum(car_id) OVER(
					   ORDER BY user_id
					   ROWS 
					       BETWEEN 1 PRECEDING 
					       AND CURRENT ROW 
				   )
	) AS sum_car_id
FROM car;

/*
1	Kia	Sportage	1	1
2			100	101
2	Nissan	Juke	2	102
25	Porsh	Carerra	51	53
25	Lamborgini	Urus	32	83
25	Lamborgini	Aventador	50	82
26	Kia	Optima	132	182
	Skoda	Octavia	70	202
*/
/*
3. Одна з колонок таблиці повинна містити значення, що повторюються, для
виділення підгруп, інша колонка повинна мати числові значення.
Створіть запит, який отримає:
 накопичувальні підсумки другої колонки від початку вікна до поточного
рядка для кожного вікна цілком
 накопичувальний результат порядково (для демонстрації відмінностей
роботи типу RANG від ROWS).

*/
SELECT
	user_id,
	make,
	mode_car, 
    car_id,
	sum(car_id) OVER(
                       PARTITION BY make
					   ORDER BY make
					   ROWS UNBOUNDED PRECEDING
				   )
	 AS rows_between,
     sum(car_id) OVER(
                        PARTITION BY make
					    ORDER BY make
                        RANGE UNBOUNDED PRECEDING
				   )
	 AS range_beetwen
FROM car;

/*
1	Kia	Sportage	1	1
2	Nissan	Juke	2	3
25	Lamborgini	Urus	32	35
25	Lamborgini	Aventador	50	85
25	Porsh	Carerra	51	136
	Skoda	Octavia	70	206
2			100	306
26	Kia	Optima	132	438
*/