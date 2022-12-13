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
	SUM(user_id) OVER (
		         ORDER BY user_id
			 ) sum_user_id
FROM car; 
/*
Kia	Sportage	1	1
		2	5
Nissan	Juke	2	5
Porsh	Carerra	25	80
Lamborgini	Urus	25	80
Lamborgini	Aventador	25	80
Kia	Optima	26	106
Skoda	Octavia		106
*/


/*
3. ��������� �������� ��������, ��������� ������������� ������� � �����
������ ������.
*/
SELECT 
    make, 
	mode_car, 
	user_id, 
	SUM(user_id) OVER (
	             PARTITION BY make
		         ORDER BY user_id
			 ) sum_user_id
FROM car; 

/*
Kia	Sportage	1	1
Kia	Optima	26	27
Lamborgini	Urus	25	50
Lamborgini	Aventador	25	50
Nissan	Juke	2	2
Porsh	Carerra	25	25
Skoda	Octavia		
		2	2
*/