SELECT	
    ord.user_id, 
    spr.price
FROM 
    ord,spr;

SELECT 
    c.make, 
	c.mode_car, 
	u.username
FROM car c, usr u
WHERE
    u.user_id = c.user_id(+)
ORDER BY u.user_id;

SELECT 
    c.make, 
	c.mode_car, 
	u.username
FROM car c, usr u
WHERE
    u.user_id(+)= c.user_id
ORDER BY u.user_id;