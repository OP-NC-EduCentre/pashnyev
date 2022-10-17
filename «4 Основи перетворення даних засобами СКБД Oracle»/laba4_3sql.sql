SELECT usr.username, car.make
FROM usr CROSS JOIN 
car;

SELECT * FROM usr
LEFT JOIN car
ON usr.user_id = car.car_id;
    

