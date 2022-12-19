/*
���� � ������� ������� ������� ������ ��������, �� ������������, ���
�������� ������, ���� ������� ������� ���� ������ ��������. ������� �����, ����
������ ��������� �������� ����� ������� ������� ����� � ����� ������.
*/
SELECT 
    make, 
	mode_car, 
    user_id,
	AVG(user_id) OVER (PARTITION BY make) avg_user_id 
FROM car;
/*
Kia	Sportage	1	13.5
Kia	Optima	26	13.5
Lamborgini	Urus	25	25
Lamborgini	Aventador	25	25
Nissan	Juke	2	2
Porsh	Carerra	25	25
Skoda	Octavia		
		2	2
*/

/*

���� � ������� ������� ������� ������ ��������, �� ������������, ���
�������� ������, ���� ������� ������� ���� ������ ��������. ������� �����, ����
������ ������������� ������� ����� �������.
����������� ��������� ������� �� ����� AVG, ORDER BY.
*/

SELECT 
    make, 
	mode_car, 
	user_id, 
	AVG(user_id) OVER (
		         ORDER BY user_id
			 ) sum_user_id
FROM car; 
/*
Kia	Sportage	1	1
		2	1.66666666666666666666666666666666666667
Nissan	Juke	2	1.66666666666666666666666666666666666667
Porsh	Carerra	25	13.33333333333333333333333333333333333333
Lamborgini	Urus	25	13.33333333333333333333333333333333333333
Lamborgini	Aventador	25	13.33333333333333333333333333333333333333
Kia	Optima	26	15.14285714285714285714285714285714285714
Skoda	Octavia		15.14285714285714285714285714285714285714
*/


/*
3. ��������� �������� ��������, ��������� ������������� ������� � �����
������ ������.
*/
SELECT 
    make, 
	mode_car, 
	user_id, 
	AVG(user_id) OVER (
	             PARTITION BY user_id
			 ) patrition_by,
    AVG(user_id) OVER (
	             ORDER BY user_id
			 ) order_by
             
FROM car; 

/*
Kia	Sportage	1	1	1
		2	2	1.66666666666666666666666666666666666667
Nissan	Juke	2	2	1.66666666666666666666666666666666666667
Porsh	Carerra	25	25	13.33333333333333333333333333333333333333
Lamborgini	Urus	25	25	13.33333333333333333333333333333333333333
Lamborgini	Aventador	25	25	13.33333333333333333333333333333333333333
Kia	Optima	26	26	15.14285714285714285714285714285714285714
Skoda	Octavia			15.14285714285714285714285714285714285714
*/