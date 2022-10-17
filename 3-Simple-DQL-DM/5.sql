select username from usr;
select make,mode_car from car;
UPDATE car
   SET user_id =100
 WHERE car_id=1;
 UPDATE car
   SET user_id =1
 WHERE car_id=1;
 
 DELETE
FROM
    usr
WHERE
    username='Misha';

 DELETE
FROM
    usr
WHERE
    username='Andrey';
    
     UPDATE usr
   SET user_id =1
 WHERE username='Misha';
 
 
   UPDATE usr
   SET user_id =50
 WHERE username='Misha';