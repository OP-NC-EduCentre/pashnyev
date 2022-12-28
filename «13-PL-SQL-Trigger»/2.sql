-- 1. Створити тригер для реалізації каскадного видалення рядків зі значеннями PK-
-- колонки, пов'язаних з FK-колонкою. Навести тест-кейс перевірки роботи тригера. //todo

CREATE OR REPLACE TRIGGER CASCAD_DELETING_CAR_AND_USR
    BEFORE DELETE
    ON USR
    FOR EACH ROW
BEGIN
    DELETE
    FROM CAR
    WHERE CAR.user_id = :old.user_id;
END;


-- 2. Створити тригер для реалізації предметно-орієнтованого контролю спроби
-- додавання значення FK-колонки, що не існує у PK-колонці. Навести тест-кейс перевірки
-- роботи тригера.

CREATE OR REPLACE TRIGGER user_insert_check
    BEFORE INSERT
    ON car
    FOR EACH ROW
DECLARE
    v_user_id usr.user_id%TYPE;
BEGIN
    SELECT user_id
    INTO v_user_id
    FROM USR
    WHERE user_id = :new.user_id;
EXCEPTION
    WHEN no_data_found THEN
        RAISE_APPLICATION_ERROR(-20551, 'No user with id=' || :new.user_id );
END;

insert into car (car_id,user_id,make,mode_car) values(1005,100000,'Volfswagen','passat')

/*
Error starting at line : 35 in command -
insert into car (car_id,user_id,make,mode_car) values(1005,100000,'Volfswagen','passat')
Error report -
ORA-20551: Manager with id=100000 NOT exist!!!
ORA-06512: at "PASHNYEV.CLIENT_INSERT_CHECK_MANAGERID_VALID", line 10
ORA-04088: error during execution of trigger 'PASHNYEV.CLIENT_INSERT_CHECK_MANAGERID_VALID'
*/