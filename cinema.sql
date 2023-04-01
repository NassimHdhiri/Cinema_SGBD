-- I --   CREATE TABLES 
CREATE TABLE individu (
  num_indiv NUMBER PRIMARY KEY,
  nom_indiv VARCHAR2(50),
  pre_indiv VARCHAR2(50)
);

CREATE TABLE film (
  num_film NUMBER(10) PRIMARY KEY,
  titre_f VARCHAR2(25),
  realisateur NUMBER(25),
  CONSTRAINT fk_indiv FOREIGN KEY (realisateur) REFERENCES individu(num_indiv)
);

CREATE TABLE exemplaire (
  num_exemp NUMBER(10) PRIMARY KEY,
  num_film NUMBER(10),
  code_support NUMBER,
  vo VARCHAR2(10),
  probleme VARCHAR2(50),
  detail_support VARCHAR2(100),
  CONSTRAINT fk_film FOREIGN KEY (num_film) REFERENCES film(num_film)
);

CREATE TABLE client (
  login VARCHAR2(50) PRIMARY KEY,
  nom_client VARCHAR2(50),
  pre_client VARCHAR2(50),
  mdp VARCHAR2(50),
  adr VARCHAR2(100)
);
-- table location
CREATE TABLE location (
  num_exemp NUMBER(10),
  date_loc DATE,
  login VARCHAR2(50),
  date_envoi DATE,
  date_retour DATE,
  -- composite primary key
  PRIMARY KEY (date_loc, num_exemp),
  CONSTRAINT fk_location FOREIGN KEY (num_exemp) REFERENCES exemplaire(num_exemp),
  CONSTRAINT fk_client FOREIGN KEY (login) REFERENCES client(login)
);

-- II - FILL TABLES 

    -- 1 - INDIVIDU TABLE 
-- declare sequence of indvidu number
CREATE SEQUENCE individu_seq START WITH 1 INCREMENT BY 1;

-- implement table individu
DECLARE
   v_num_indiv NUMBER;
BEGIN
   FOR i IN 1..10 LOOP
      SELECT individu_seq.NEXTVAL INTO v_num_indiv FROM DUAL;
      INSERT INTO individu (num_indiv, nom_indiv, pre_indiv)
      VALUES (v_num_indiv, 
              CASE i
                WHEN 1 THEN 'Ridley'
                WHEN 2 THEN 'Steven'
                WHEN 3 THEN 'James'
                WHEN 4 THEN 'Frank'
                WHEN 5 THEN 'Christopher'
                WHEN 6 THEN 'Robert'
                WHEN 7 THEN 'Quentin'
                WHEN 8 THEN 'Francis Ford'
                WHEN 9 THEN 'Jonathan'
                WHEN 10 THEN 'Steven'
              END,
              CASE i
                WHEN 1 THEN 'Scott'
                WHEN 2 THEN 'Spielberg'
                WHEN 3 THEN 'Cameron'
                WHEN 4 THEN 'Darabont'
                WHEN 5 THEN 'Nolan'
                WHEN 6 THEN 'Zemeckis'
                WHEN 7 THEN 'Tarantino'
                WHEN 8 THEN 'Coppola'
                WHEN 9 THEN 'Demme'
                WHEN 10 THEN 'Spielberg'
              END);
   END LOOP;
   COMMIT;
END;

 -- 2 - INDIVIDU TABLE 
     -- 1 - INDIVIDU TABLE 
-- declare sequence of indvidu number
CREATE SEQUENCE film_seq START WITH 100 INCREMENT BY 1;

-- implement table individu
DECLARE
   v_num_film NUMBER;
BEGIN
   FOR i IN 1..10 LOOP
      SELECT film_seq.NEXTVAL INTO v_num_film FROM DUAL;
      INSERT INTO film (num_film, titre_f, realisateur)
      VALUES (v_num_film, 
              CASE i
                WHEN 1 THEN 'Blade Runner '
                WHEN 2 THEN 'Jaws '
                WHEN 3 THEN 'Titanic '
                WHEN 4 THEN 'The Shawshank Redemption '
                WHEN 5 THEN 'The Dark Knight '
                WHEN 6 THEN 'Forrest Gump '
                WHEN 7 THEN 'Pulp Fiction '
                WHEN 8 THEN 'The Godfather '
                WHEN 9 THEN 'The Silence of the Lambs '
                WHEN 10 THEN 'Schindler''s List '
              END,
                i
              );
   END LOOP;
   COMMIT;
END;

 INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'Jurassic Park',10);
 
 INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'Mob City',4);
 
  INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'Bridge of Spies',10);
 
 INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'Alita',3);
 
  INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'Ready Player One',10);
 
 INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'The Walk',6);
 
 INSERT INTO film (num_film, titre_f, realisateur)
 VALUES (film_seq.nextval,'The Blob',4);

    -- 3 -- TABLE CLIENT 
BEGIN 
INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('johndoe', 'John', 'Doe', 'abc123', '123 Main St, Anytown USA');

INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('janedoe', 'Jane', 'Doe', 'def456', '456 Elm St, Anytown USA');

INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('bobsmith', 'Bob', 'Smith', 'ghi789', '789 Oak St, Anytown USA');
  
  INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('sarahjones', 'Sarah', 'Jones', 'jkl012', '12 Maple St, Anytown USA');
  
  INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('tomwilliams', 'Tom', 'Williams', 'mno345', '345 Pine St, Anytown USA');
  
  INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('emilywilson', 'Emily', 'Wilson', 'pqr678', '678 Cedar St, Anytown USA');
  
  INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('davidsmith', 'David', 'Smith', 'stu901', '901 Walnut St, Anytown USA');

INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('lisajohnson', 'Lisa', 'Johnson', 'vwx234', '234 Cherry St, Anytown USA');
  
  INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('jasonmiller', 'Jason', 'Miller', 'yza567', '567 Birch St, Anytown USA');
  
  INSERT INTO client (login, nom_client, pre_client, mdp, adr)
VALUES ('michellelee', 'Michelle', 'Lee', 'bcd890', '890 Spruce St, Anytown USA');

END;



    -- 4 -- TABLE EXEMPLAIRE 
BEGIN
  INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES (1, 100, 'DVD', 'O', NULL, 'DVD Zone 1');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(2, 101, 'Blu-ray', 'N', 'Scratched Disc', 'Blu-ray Region A');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(3, 102, 'VHS', 'N', 'Tape Jammed', 'VHS PAL');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(4, 103, 'DVD', 'O', NULL, 'DVD Zone 2');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(5, 104, 'Blu-ray', 'N', 'No Audio', 'Blu-ray Region B');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(6, 105, 'VHS', 'N', 'Tape Damaged', 'VHS NTSC');
         
 INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(7, 106, 'DVD', 'O', NULL, 'DVD Zone 3');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(8, 107, 'Blu-ray', 'N', 'No Video', 'Blu-ray Region C');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(9, 108, 'VHS', 'N', 'Tape Missing', 'VHS SECAM');
    
    INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(10, 109, 'DVD', 'O', NULL, 'DVD Zone 4');
END;

    -- 5 -- TABLE LOCATION
BEGIN 
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(1, TO_DATE('01-JAN-22', 'DD-MON-YY'), 'johndoe', TO_DATE('02-JAN-22', 'DD-MON-YY'), TO_DATE('10-JAN-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(2, TO_DATE('03-FEB-22', 'DD-MON-YY'), 'janedoe', TO_DATE('04-FEB-22', 'DD-MON-YY'), TO_DATE('12-FEB-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(3, TO_DATE('05-MAR-22', 'DD-MON-YY'), 'bobsmith', TO_DATE('06-MAR-22', 'DD-MON-YY'), TO_DATE('14-MAR-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(4, TO_DATE('07-APR-22', 'DD-MON-YY'), 'sarahjones', TO_DATE('08-APR-22', 'DD-MON-YY'), TO_DATE('16-APR-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(5, TO_DATE('09-MAY-22', 'DD-MON-YY'), 'tomwilliams', TO_DATE('10-MAY-22', 'DD-MON-YY'), TO_DATE('18-MAY-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(6, TO_DATE('11-JUN-22', 'DD-MON-YY'), 'emilywilson', TO_DATE('12-JUN-22', 'DD-MON-YY'), TO_DATE('20-JUN-22', 'DD-MON-YY'));
  
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(7, TO_DATE('13-JUL-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('14-JUL-22', 'DD-MON-YY'), TO_DATE('22-JUL-22', 'DD-MON-YY'));
  
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(8, TO_DATE('15-AUG-22', 'DD-MON-YY'), 'lisajohnson', TO_DATE('16-AUG-22', 'DD-MON-YY'), TO_DATE('24-AUG-22', 'DD-MON-YY'));
  
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(9, TO_DATE('17-SEP-22', 'DD-MON-YY'), 'jasonmiller', TO_DATE('18-SEP-22', 'DD-MON-YY'), TO_DATE('26-SEP-22', 'DD-MON-YY'));
  
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(10, TO_DATE('19-OCT-22', 'DD-MON-YY'), 'michellelee', TO_DATE('20-OCT-22', 'DD-MON-YY'), TO_DATE('28-OCT-22', 'DD-MON-YY'));

END;

-------------------------------- QUESTION 1 --------------------------------

-- function return nbr 
CREATE OR REPLACE FUNCTION nbreFilms(id_indiv NUMBER)
return NUMBER 
is 
nb_film NUMBER:=0;
BEGIN 
    select count(*) into nb_film
    from film 
    where realisateur=id_indiv;
    
    return nb_film;
END;

SET SERVEROUTPUT ON;
DECLARE 
    id_indiv NUMBER;
    nb_film NUMBER;
BEGIN 
    nb_film:=nbreFilms(&id_indiv);
    DBMS_OUTPUT.PUT_LINE('he shot ' ||nb_film ||' films');
END;

-------------------------------- QUESTION 2 --------------------------------
-- A  -- CREATE TABLE BONUS 
CREATE TABLE BONUS (
    login varchar2(50) PRIMARY KEY,
    v_bonus number(8,2),
    nbrExLoues number(8),
    CONSTRAINT fk_bonus FOREIGN KEY (login) REFERENCES client(login)
);

-- b -- FILL TABLE BONUS 
DECLARE 
    v_login varchar2;
    nbr_Exemp NUMBER;
    loc_year NUMBER;
    cpt_exemp NUMBER:=0;
    CURSOR client_cur IS SELECT * FROM client;
    CURSOR exemplaire_cur is select * from exemplaire;
    client_rec client%ROWTYPE;
BEGIN 
    FOR client_record in client_cur
        LOOP 
            FOR exemplaire_record in exemplaire_cur 
                LOOP
                    if client_record.login=exemplaire_record.login and 
                        TO_NUMBER(TO_CHAR(TO_DATE(exemplaire_record.login, 'DD-MON-YY'), 'YY'))=22 
                    THEN 
                        cpt_exemp:=cpt_exemp+1;
                    END IF;
                END LOOP;
                
            -- insert client     
            insert into bonus(login,bonus,nbrExLoues)
            values(client_record.login,NULL,cpt_exemp);
            
            -- COMPTEUR NULL
            cpt_exemp:=0;      
        END LOOP;
END;

-- c -- add bonus 

-- d -- Display clients

--------------------------------   TEST     --------------------------------
select * 
from film;
select * 
from individu;
select * 
from exemplaire;
select * 
from location;
select * 
from client;
/*