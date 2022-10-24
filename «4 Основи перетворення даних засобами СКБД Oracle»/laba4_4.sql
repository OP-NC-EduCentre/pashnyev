
/*
4.1 Повторити рішення завдання 3.1
*/
SELECT 
    c.make, 
	c.mode_car, 
	u.username
FROM car c, usr u
WHERE
    u.user_id = c.user_id(+)
ORDER BY u.user_id;

/*4.2 Повторити рішення завдання 3.2*/

SELECT	
    car.user_id, 
	usr.user_id
FROM 
    usr, 
    car
WHERE
    car.user_id = usr.user_id;

    
/*4.3 Повторити рішення завдання 3.4*/
SELECT spr.type_spr, usr.username
	FROM spr , usr
	WHERE spr.price >1000;
