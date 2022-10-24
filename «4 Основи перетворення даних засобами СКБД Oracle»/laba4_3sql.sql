
/*
3.1 ��� ����-���� ���� ������� �������� ������� ��������� ����������� �������.
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

/*3.2 ��� ���� �������, ���'������ ����� PK-������� �� FK-�������, �������� �������
��������� ���� ������� ����� �� ����� ������� � ������������� ���-璺������ �������.
��������������� ��������.
*/
SELECT 
    car.user_id, 
	usr.user_id
FROM car JOIN usr ON (car.user_id=usr.user_id)
WHERE 
    usr.username = 'Misha';
    
/*
3.3 ��������� ������ ������������ ��������, ������������ ����������� ���������� ����
���-璺������.
*/

/*
3.4 ��������� ������ �������� 3.2, �������� ����'������� �� ������ �'�������
(���������� ��� ������������), ��� ��������� �������� ����� ������� � PK-��������, �� ���'����
� FK-��������.
*/
SELECT make,mode_car,usr.username FROM car
LEFT JOIN usr
ON car.car_id = car.user_id;
    

