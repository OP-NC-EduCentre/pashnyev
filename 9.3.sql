/*
1. ������������ �������� ���� � ������� �� 3 ������� ������� �� �������� ����
������� � ����-��� ������� �������. ����������� ��������� ������� NTILE.
*/

SELECT 
	NTILE(3) OVER (ORDER BY car_id) AS car_id_ntile, 
	make, 
	mode_car 
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
2. ������� �����, ���� ������� ������ ����� (������ �� ��������� ����������
��������) � ��������, ��������� � ������� ������� ����� 1. 
*/
WITH 
car_sort_rownum AS (
    SELECT make, mode_car,car_id,
    NTILE(3) OVER (ORDER BY car_id) AS car_id_ntile, 
    ROW_NUMBER() OVER ( ORDER BY car_id desc ) AS r 
        
	FROM car
)
 select max(car_id) from car_sort_rownum group by car_id_ntile
 /*
 32
70
132
 */
/*
3. ����������� ������ ������������ ��������, ���������� �� 2 ����� � �����
������.
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
4. ������� �����, ���� ������� ������� ����-����� � ������������� �������
�������� �� ���� ��������� ������: ������/������/�����������/�볺��� ����.
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
WHERE 
    r <= 3;
    /*
    Kia	Sportage
Nissan	Juke
Lamborgini	Urus
    */
/*
5. ���� � ������� ������� ������� ������ ��������, �� ������������, ���
�������� ������, ���� ������� ������� ���� ������ ��������. ������� �����, ����
������ ����� �������� � ����� ������. ����������� ��������� �������
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