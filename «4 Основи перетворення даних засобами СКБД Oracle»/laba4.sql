CREATE SEQUENCE test_seq START WITH 4;
CREATE SEQUENCE another_seq start WITH 10;

insert into usr values(test_seq.nextval,'Anton');
insert into car values('BMV','X5',another_seq.nextval,test_seq.CURRVAL);

SELECT test_seq.nextval FROM dual;





SELECT columns
FROM usr
FULL outer JOIN car
ON usr.username = car.mode_car;

SELECT 
	usr.username, 
	spr.creator
	FROM usr
	CROSS JOIN spr;
