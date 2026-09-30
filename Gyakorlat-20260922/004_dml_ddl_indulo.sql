---------------------------------------------
--INSERT 1  alap insert mező érték megadással
---------------------------------------------
TRUNCATE TABLE vacc;

SELECT * FROM  vacc;

insert into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
values (1, 3, 5, 'A01', to_date('20-01-2016', 'dd-mm-yyyy'), 'Pécs', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
values (2, 3, 5, 'B01', to_date('20-08-2016', 'dd-mm-yyyy'), 'Pécs', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
values (3, 7, 10, 'A01', to_date('11-01-2010', 'dd-mm-yyyy'), 'Budapest', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
values (4, 11, 10, 'B01', to_date('09-09-2009', 'dd-mm-yyyy'), 'Veszprém', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
values (5, 13, 10, 'C01', to_date('29-02-2012', 'dd-mm-yyyy'), 'Mohács', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'));
  
SELECT * FROM vacc;
---------------------------------------
--INSERT 2  create table select alapján
---------------------------------------
create table vacc_bck as select * from vacc;

select * from vacc_bck;

drop table vacc_bck;
-------------------------------------------------------------------
--INSERT 3  tábla létrehozása minta alapján + insert select alapján
-------------------------------------------------------------------
create table vacc_bck as select * from vacc t where 1 = 2;

select * from vacc_bck;

INSERT INTO vacc_bck
  (id
  ,dog_id
  ,doctor_id
  ,type_of_vacc
  ,date_of_vacc
  ,location_of_vacc
  ,created)
  SELECT id
        ,dog_id
        ,doctor_id
        ,type_of_vacc
        ,date_of_vacc
        ,location_of_vacc
        ,created
    FROM vacc;

-------------------------------------------------------
--INSERT 4  több sor insertálása egyszerre értékadással
-------------------------------------------------------
TRUNCATE TABLE vacc;

SELECT * FROM  vacc;

insert ALL
	 into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
		  values (1, 3, 5, 'A01', to_date('20-01-2016', 'dd-mm-yyyy'), 'Pécs', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'))
	 into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
		  values (2, 3, 5, 'B01', to_date('20-08-2016', 'dd-mm-yyyy'), 'Pécs', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'))
	 into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
		  values (3, 7, 10, 'A01', to_date('11-01-2010', 'dd-mm-yyyy'), 'Budapest', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'))
	 into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
		  values (4, 11, 10, 'B01', to_date('09-09-2009', 'dd-mm-yyyy'), 'Veszprém', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'))
	 into VACC (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
		  values (5, 13, 10, 'C01', to_date('29-02-2012', 'dd-mm-yyyy'), 'Mohács', to_date('21-09-2016 15:22:49', 'dd-mm-yyyy hh24:mi:ss'))
SELECT * FROM dual;

SELECT * FROM vacc;

------------------------------
--INSERT 5 insert több táblába
------------------------------
CREATE TABLE VACC_PECS AS SELECT * FROM VACC WHERE 1 = 2;
CREATE TABLE VACC_BUDAPEST AS SELECT * FROM VACC WHERE 1 = 2;
CREATE TABLE VACC_VESZPREM AS SELECT * FROM VACC WHERE 1 = 2;
CREATE TABLE VACC_MASHOL AS SELECT * FROM VACC WHERE 1 = 2;

SELECT * FROM VACC_PECS;
SELECT * FROM VACC_BUDAPEST;
SELECT * FROM VACC_VESZPREM;
SELECT * FROM VACC_MASHOL;

INSERT FIRST
	 WHEN LOCATION_OF_VACC = 'Pécs'
	 THEN INTO VACC_PECS (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	 WHEN LOCATION_OF_VACC = 'Budapest'
	 THEN INTO VACC_BUDAPEST (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	 WHEN LOCATION_OF_VACC = 'Veszprém'
	 THEN INTO VACC_VESZPREM (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	 ELSE INTO VACC_MASHOL (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
SELECT * FROM VACC;
  
SELECT * FROM VACC_PECS;
SELECT * FROM VACC_BUDAPEST;
SELECT * FROM VACC_VESZPREM;
SELECT * FROM VACC_MASHOL;
SELECT * FROM VACC;

------------------------------------------------
--INSERT 6 insert több táblába FIRST
------------------------------------------------
CREATE TABLE VACC_BCK_A AS SELECT * FROM VACC WHERE 1 = 2;
CREATE TABLE VACC_BCK_B AS SELECT * FROM VACC WHERE 1 = 2;

SELECT * FROM VACC_BCK_A;
SELECT * FROM VACC_BCK_B;

SELECT SUBSTR(TYPE_OF_VACC, 1, 1), a.* FROM VACC a;

INSERT FIRST
	 WHEN SUBSTR(TYPE_OF_VACC, 1, 1) <= 'B'
	 THEN INTO VACC_BCK_B (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	 WHEN SUBSTR(TYPE_OF_VACC, 1, 1) <= 'A'
	 THEN INTO VACC_BCK_A (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
SELECT * FROM VACC;
  
SELECT * FROM VACC_BCK_A;
SELECT * FROM VACC_BCK_B;

SELECT SUBSTR(TYPE_OF_VACC, 1, 1), a.* FROM VACC a;

-----------------------------------------------
--INSERT 7 insert több táblába ALL értékadásokkal
-----------------------------------------------
DELETE VACC_BCK_A;
DELETE VACC_BCK_B;

INSERT ALL
	 WHEN SUBSTR(TYPE_OF_VACC, 1, 1) <= 'B'
	 THEN INTO VACC_BCK_B (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	 WHEN SUBSTR(TYPE_OF_VACC, 1, 1) <= 'A'
	 THEN INTO VACC_BCK_A (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
	   VALUES (ID, DOG_ID, DOCTOR_ID, TYPE_OF_VACC, DATE_OF_VACC, LOCATION_OF_VACC, CREATED)
SELECT * FROM VACC;

SELECT * FROM VACC_BCK_A;
SELECT * FROM VACC_BCK_B;

SELECT SUBSTR(TYPE_OF_VACC, 1, 1), a.* FROM VACC a;

---------------------------------------------------
--INSERT 8 insert több táblába ALL selectből
---------------------------------------------------
DELETE VACC_BCK_A;
DELETE VACC_BCK_B;

INSERT ALL
	 WHEN SUBSTR(TYPE_OF_VACC, 1, 1) <= 'B'
	 THEN INTO VACC_BCK_B
	 WHEN SUBSTR(TYPE_OF_VACC, 1, 1) <= 'A'
	 THEN INTO VACC_BCK_A
SELECT * FROM VACC a;

SELECT * FROM VACC_BCK_A;
SELECT * FROM VACC_BCK_B;

--------------------------------------
--INSERT 9 MERGE
--------------------------------------
create table vacc_bck AS SELECT * FROM vacc WHERE 1 = 2;
SELECT * FROM vacc;
SELECT * FROM vacc_bck;

INSERT INTO vacc_bck SELECT * FROM vacc;

DELETE FROM vacc WHERE ID = 5;

SELECT * FROM vacc;
SELECT * FROM vacc_bck;

-- merge
MERGE INTO vacc a
USING vacc_bck b
ON (a.id = b.id)
WHEN NOT MATCHED THEN
  INSERT
    (id
    ,dog_id
    ,doctor_id
    ,type_of_vacc
    ,date_of_vacc
    ,location_of_vacc
    ,created)
  VALUES
    (b.id
    ,b.dog_id
    ,b.doctor_id
    ,b.type_of_vacc
    ,b.date_of_vacc
    ,b.location_of_vacc
    ,b.created);

-------------------------------------
--UPDATE 1 alap
-------------------------------------
SELECT * FROM vacc;

-------------------------------------
--UPDATE 2 módosítás másik tábla alpján
-------------------------------------
UPDATE vacc a SET a.type_of_vacc = 
       (SELECT b.type_of_vacc FROM vacc_bck b WHERE a.id = b.id);

--merge into equivalent
MERGE INTO vacc v
USING vacc_bck vbck
ON (v.id = vbck.id)
WHEN MATCHED THEN
  UPDATE SET v.type_of_vacc = vbck.type_of_vacc || ' merge';

SELECT * FROM vacc;


