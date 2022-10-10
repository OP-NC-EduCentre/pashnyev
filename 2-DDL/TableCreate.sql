
drop table Ord CASCADE CONSTRAINTS;
drop table Usr CASCADE CONSTRAINTS;
drop table Spr CASCADE CONSTRAINTS;
drop table Car CASCADE CONSTRAINTS;

CREATE TABLE Car(
    make VARCHAR(20),
    mode_car VARCHAR(20),
    car_id NUMBER(10)
);
CREATE TABLE Spr( 
    type VARCHAR(20),
    creator VARCHAR(20),
    spare_id NUMBER(10),
    spare_year DATE,
    price NUMBER(8)
);
CREATE TABLE Usr(
    user_id NUMBER(10),
    username VARCHAR(20),
    car_id NUMBER(10)
);
CREATE TABLE Ord(
    order_id NUMBER(10),
    spare_id NUMBER(10),
    user_id NUMBER(10),
    ord_date DATE
);


