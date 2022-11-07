-- 2.1. Створити таблицю описів атрибутних типів.
drop table attrtype CASCADE CONSTRAINTS;
CREATE TABLE attrtype
(
    attr_id            NUMBER(20),
    object_type_id     NUMBER(20),
    object_type_id_ref NUMBER(20),
    code               VARCHAR2(20),
    name               VARCHAR2(200)
);

ALTER TABLE attrtype
    ADD CONSTRAINT attrtype_pk
        PRIMARY KEY (attr_id);
ALTER TABLE attrtype
    ADD CONSTRAINT attrtype_object_type_id_fk
        FOREIGN KEY (object_type_id) REFERENCES objtype (object_type_id);
ALTER TABLE attrtype
    ADD CONSTRAINT attrtype_object_type_id_ref_fk
        FOREIGN KEY (object_type_id_ref) REFERENCES objtype (object_type_id);

-- 2.2 Для раніше використаних класів UML-діаграми заповнити описи атрибутних типів.
INSERT INTO attrtype (attr_id, object_type_id, object_type_id_ref, code, name)
    VALUES (1, 1, 3, 'OWN_ID', 'Owner id');
INSERT INTO attrtype (attr_id, object_type_id, object_type_id_ref, code, name)
    VALUES (2, 1, 3, 'ORD_DATE', 'Order date');
INSERT INTO attrtype (attr_id, object_type_id, object_type_id_ref, code, name)
    VALUES (3, 2, 3, 'MOD', 'Model of car');
INSERT INTO attrtype (attr_id, object_type_id, object_type_id_ref, code, name)
    VALUES (4, 3, null, 'USR', 'Username');
INSERT INTO attrtype (attr_id, object_type_id, object_type_id_ref, code, name)
    VALUES (5, 3, null, 'USR_ID', 'Username id');

-- 2.3 Отримати інформацію про атрибутні типи.

SELECT O.CODE,A.ATTR_ID,A.CODE,A.NAME
FROM OBJTYPE O, ATTRTYPE A
WHERE O.OBJECT_TYPE_ID = A.OBJECT_TYPE_ID
ORDER BY A.OBJECT_TYPE_ID,A.ATTR_ID;
/*
ORD	1	OWN_ID	Owner id
ORD	2	ORD_DATE	Order date
CAR	3	MOD	Model of car
USR	4	USR	Username
USR	5	USR_ID	Username id
*/
