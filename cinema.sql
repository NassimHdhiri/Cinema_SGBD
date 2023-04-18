
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
DELETE FROM film;
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
   COMMIT;
END;

 select * from film;

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
  VALUES(2, 101, 'VHS', 'N', 'Scratched Disc', 'Blu-ray Region A');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(3, 102, 'VHS', 'N', 'Tape Jammed', 'VHS PAL');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(4, 103, 'DVD', 'O', NULL, 'DVD Zone 2');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(5, 104, 'VHS', 'N', 'No Audio', 'Blu-ray Region B');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(6, 105, 'VHS', 'N', 'Tape Damaged', 'VHS NTSC');
         
 INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(7, 106, 'DVD', 'O', NULL, 'DVD Zone 3');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(8, 107, 'VHS', 'N', 'No Video', 'Blu-ray Region C');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(9, 108, 'VHS', 'N', 'Tape Missing', 'VHS SECAM');
    
    INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(10, 109, 'DVD', 'O', NULL, 'DVD Zone 4');
  
  INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(11, 110, 'DVD', 'O', NULL, 'DVD Zone 5');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(12, 111, 'VHS', 'N', 'No Audio', 'Blu-ray Region B');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(13, 111, 'VHS', 'N', 'Tape Damaged', 'VHS NTSC');
         
 INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(14, 111, 'DVD', 'O', NULL, 'DVD Zone 6');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(15, 112, 'DVD', 'N', 'No Video', 'Blu-ray Region C');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(16, 112, 'VHS', 'N', 'Tape Missing', 'VHS SECAM');
    
    INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(17, 112, 'DVD', 'O', NULL, 'DVD Zone 7');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(18, 113, 'DVD', 'O', NULL, 'DVD Zone 8');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(19, 113, 'DVD', 'N', 'No Audio', 'Blu-ray Region B');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(20, 113, 'VHS', 'N', 'Tape Damaged', 'VHS NTSC');
         
 INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(21, 114, 'DVD', 'O', NULL, 'DVD Zone 9');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(22, 114, 'VHS', 'N', 'No Video', 'Blu-ray Region C');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(23, 114, 'VHS', 'N', 'Tape Missing', 'VHS SECAM');
    
    INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(24, 115, 'DVD', 'O', NULL, 'DVD Zone 10');
  
  INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(25, 116, 'DVD', 'O', NULL, 'DVD Zone 11');
  
   INSERT INTO exemplaire (num_exemp, num_film, code_support, vo, probleme, detail_support)
  VALUES(26, 116, 'VHS', 'N', 'No Video', 'Blu-ray Region C');

END;

    -- 5 -- TABLE LOCATION
DELETE FROM exemplaire;
select *
from location;
select *
from exemplaire;
select *
from bonus;
delete from bonus;

-- declare sequence of exemp numero


BEGIN 

 INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(1, TO_DATE('10-MAR-20', 'DD-MON-YY'), 'bobsmith', TO_DATE('11-MAR-20', 'DD-MON-YY'), TO_DATE('18-MAR-20', 'DD-MON-YY'));
    
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(2, TO_DATE('07-APR-20', 'DD-MON-YY'), 'sarahjones', TO_DATE('08-APR-20', 'DD-MON-YY'), TO_DATE('14-APR-20', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(3, TO_DATE('13-JUN-20', 'DD-MON-YY'), 'tomwilliams', TO_DATE('14-JUN-20', 'DD-MON-YY'), TO_DATE('18-JUN-20', 'DD-MON-YY'));
     
      INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(4, TO_DATE('27-AUG-20', 'DD-MON-YY'), 'michellelee', TO_DATE('28-AUG-20', 'DD-MON-YY'), TO_DATE('4-AUG-20', 'DD-MON-YY'));
    
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(5, TO_DATE('6-OCT-20', 'DD-MON-YY'), 'davidsmith', TO_DATE('7-JUL-20', 'DD-MON-YY'), TO_DATE('15-JUL-20', 'DD-MON-YY'));
    
    -- 2021
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(6, TO_DATE('8-AUG-21', 'DD-MON-YY'), 'sarahjones', TO_DATE('10-AUG-21', 'DD-MON-YY'), TO_DATE('16-AUG-21', 'DD-MON-YY'));
    
   INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(7, TO_DATE('21-SEP-21', 'DD-MON-YY'), 'davidsmith', TO_DATE('22-SEP-21', 'DD-MON-YY'), TO_DATE('30-SEP-21', 'DD-MON-YY'));
    
       -- 2022
       
       INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(8, TO_DATE('01-JAN-22', 'DD-MON-YY'), 'johndoe', TO_DATE('02-JAN-22', 'DD-MON-YY'), TO_DATE('10-JAN-22', 'DD-MON-YY'));
       
        INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(9, TO_DATE('05-JAN-22', 'DD-MON-YY'), 'bobsmith', TO_DATE('06-JAN-22', 'DD-MON-YY'), TO_DATE('14-JAN-22', 'DD-MON-YY'));
    
    
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(10, TO_DATE('16-FEB-22', 'DD-MON-YY'), 'lisajohnson', TO_DATE('17-FEB-22', 'DD-MON-YY'), TO_DATE('24-FEB-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(11, TO_DATE('17-FEB-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('18-FEB-22', 'DD-MON-YY'), TO_DATE('25-FEB-22', 'DD-MON-YY'));
    
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(12, TO_DATE('05-MAR-22', 'DD-MON-YY'), 'bobsmith', TO_DATE('06-MAR-22', 'DD-MON-YY'), TO_DATE('14-MAR-22', 'DD-MON-YY'));
    
      INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(13, TO_DATE('06-MAR-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('07-MAR-22', 'DD-MON-YY'), TO_DATE('13-MAR-22', 'DD-MON-YY'));
   
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(14, TO_DATE('24-MAR-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('25-MAR-22', 'DD-MON-YY'), TO_DATE('28-MAR-22', 'DD-MON-YY'));
     
        INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(15, TO_DATE('02-APR-22', 'DD-MON-YY'), 'jasonmiller', TO_DATE('18-APR-22', 'DD-MON-YY'), TO_DATE('26-APR-22', 'DD-MON-YY'));
     
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(16, TO_DATE('25-APR-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('26-APR-22', 'DD-MON-YY'), TO_DATE('28-APR-22', 'DD-MON-YY'));
      
 INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(17, TO_DATE('09-MAY-22', 'DD-MON-YY'), 'tomwilliams', TO_DATE('10-MAY-22', 'DD-MON-YY'), TO_DATE('18-MAY-22', 'DD-MON-YY'));
    
 
   INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(18, TO_DATE('13-MAY-22', 'DD-MON-YY'), 'sarahjones', TO_DATE('15-MAY-22', 'DD-MON-YY'), TO_DATE('20-MAY-22', 'DD-MON-YY'));
    
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(19, TO_DATE('15-MAY-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('16-MAY-22', 'DD-MON-YY'), TO_DATE('25-MAY-22', 'DD-MON-YY'));
    
    
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(20, TO_DATE('09-JUN-22', 'DD-MON-YY'), 'bobsmith', TO_DATE('13-JUN-22', 'DD-MON-YY'), TO_DATE('19-JUN-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(21, TO_DATE('11-JUN-22', 'DD-MON-YY'), 'emilywilson', TO_DATE('12-JUN-22', 'DD-MON-YY'), TO_DATE('20-JUN-22', 'DD-MON-YY'));
  
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(22, TO_DATE('23-JUL-22', 'DD-MON-YY'), 'janedoe', TO_DATE('24-JUL-22', 'DD-MON-YY'), TO_DATE('30-JUL-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(23, TO_DATE('08-SEP-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('09-SEP-22', 'DD-MON-YY'), TO_DATE('20-SEP-22', 'DD-MON-YY'));
  
     INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(24, TO_DATE('20-OCT-22', 'DD-MON-YY'), 'michellelee', TO_DATE('21-OCT-22', 'DD-MON-YY'), TO_DATE('28-OCT-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(25, TO_DATE('13-NOV-22', 'DD-MON-YY'), 'davidsmith', TO_DATE('14-NOV-22', 'DD-MON-YY'), TO_DATE('24-NOV-22', 'DD-MON-YY'));
    
    INSERT INTO location (num_exemp, date_loc, login, date_envoi, date_retour)
    VALUES(26, TO_DATE('20-DEC-22', 'DD-MON-YY'), 'sarahjones', TO_DATE('22-DEC-22', 'DD-MON-YY'), TO_DATE('30-DEC-22', 'DD-MON-YY'));
    
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
CREATE TABLE tableBONUS (
    login varchar2(50) PRIMARY KEY,
    v_bonus number(8,2),
    nbrExLoues number(8),
    CONSTRAINT fk_bonus FOREIGN KEY (login) REFERENCES client(login)
);

select * from tablebonus;
DELETE FROM tableBONUS;
-- b -- FILL TABLE BONUS 
DECLARE 
    cpt_exemp NUMBER:=0;
    CURSOR client_cur IS SELECT * FROM client;
    CURSOR location_cur is select * from location;
BEGIN 
    FOR client_record in client_cur LOOP 
            FOR location_record in location_cur LOOP
                    if client_record.login=location_record.login and TO_NUMBER(TO_CHAR(TO_DATE(location_record.date_loc, 'DD-MON-YY'), 'YY'))=22 
                    THEN 
                        cpt_exemp:=cpt_exemp+1;
                    END IF;
                END LOOP;
                
                    -- insert client     
                    insert into tablebonus(login,v_bonus,nbrExLoues)
                    values(client_record.login,NULL,cpt_exemp);
                    
                    -- COMPTEUR NULL
                    cpt_exemp:=0;      
        END LOOP;
END;
-- c -- ACCORD BONUS  
DECLARE
    CURSOR bonus_cur IS SELECT * FROM tablebonus;
    loues NUMBER:=0;
    bonus_pnt Number;
BEGIN 
    FOR bonus_record in bonus_cur LOOP 
    loues:=bonus_record.nbrExLoues;
        case 
        WHEN 0<loues and loues<2 then 
        bonus_pnt:=0.1;
        WHEN  2<=loues and loues<4 then 
        bonus_pnt:=0.2;
        WHEN 4<= loues then 
        bonus_pnt:=0.4;
        ELSE 
        bonus_pnt:=NULL;
    END CASE;
        
        -- change value of v_bonus column
      UPDATE tablebonus
      SET v_bonus = bonus_pnt
      WHERE login = bonus_record.login;
                
    END LOOP;
END;

-- d -- display infos of clients 
SET SERVEROUTPUT ON;
DECLARE 
    CURSOR client_curr IS select * from client;
    bonus_pts tablebonus.v_bonus%type;
BEGIN 
    FOR rowInfoCli in client_curr LOOP
        select v_bonus into bonus_pts
        from tablebonus 
        where login like rowInfoCli.login;
        
        DBMS_OUTPUT.PUT_LINE('NOM : '||rowInfoCli. nom_client || '          PRENOM : '||rowInfoCli.pre_client ||'           Bonus : ' ||bonus_pts);
       
    end LOOP;
END;

-------------------------------- QUESTION 3 --------------------------------
-- a -- 
CREATE OR REPLACE FUNCTION Pourcentage(n1 number,n2 Number) 
return number
is
BEGIN 
    return ROUND((n1/n2)*100,2);
END;

-- b - 
CREATE OR REPLACE FUNCTION nbrExSupport(n NUMBER,str VARCHAR2) 
RETURN NUMBER
IS
    nbr_exemp NUMBER;
BEGIN
   IF(str = 'ANY' or str = 'any') THEN 
        SELECT COUNT(*) INTO nbr_exemp
        FROM exemplaire 
        WHERE num_film = n;
    ELSE 
        SELECT COUNT(*) INTO nbr_exemp
        FROM exemplaire 
        WHERE num_film = n AND code_support LIKE str;
    END IF;
    
    RETURN nbr_exemp;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given inputs.');
        RETURN NULL;
    WHEN OTHERS THEN
        -- SQLERRM is a built-in function in Oracle PL/SQL that returns the error message associated with an error code.
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;

        -- BLOC FOR TEST FUNCTION nbrExSupport
        SET SERVEROUTPUT ON;
        BEGIN 
        DBMS_OUTPUT.PUT_LINE(nbrExSupport(113,'any'));
        END;
        
-- c -- 
CREATE TABLE statistiques(
    numFilm NUMBER PRIMARY KEY,
    nbrEx   NUMBER,
    pctgeDVD NUMBER(9,2),
    pctgeVHS NUMBER(9,2)
);

-- d -- 
select * from statistiques;
select * from exemplaire;

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE remplirSat
is 
    nbr_exemplaire NUMBER;
    nbr_exemplaire_VHS  NUMBER;
    nbr_exemplaire_DVD  NUMBER;
    pctgeVHS    NUMBER(9,2);
    pctgeDVD    NUMBER(9,2);
    CURSOR exemp_curr is select * from exemplaire;
BEGIN 
    -- TRUNCATE TABLE statistiques;
    for row_exemp_curr in exemp_curr loop
    -- get number of exemplaire of each film
        nbr_exemplaire:=nbrExSupport(row_exemp_curr.num_film,'any');
    -- get number of exemplaire VHS 
        nbr_exemplaire_VHS:=nbrExSupport(row_exemp_curr.num_film,'VHS');
    -- get number of exemplaire DVD 
        nbr_exemplaire_DVD:=nbrExSupport(row_exemp_curr.num_film,'DVD');
    -- pourcentage of each support VHS
        pctgeVHS:=Pourcentage(nbr_exemplaire_VHS,nbr_exemplaire);
    -- pourcentage of each support VHS
        pctgeDVD:=Pourcentage(nbr_exemplaire_DVD,nbr_exemplaire);
        
        insert into statistiques(numFilm,nbrEx,pctgeDVD,pctgeVHS)
        values(row_exemp_curr.num_film,nbr_exemplaire,pctgeDVD,pctgeVHS);
        
        commit;
    end loop;
END;

-- FOR test procedure 
-- execute the remplirSattt procedure
EXEC remplirSat;
select * from statistiques;



-------------------------------- QUESTION 4 --------------------------------
-- 1 -- declare specific block 
CREATE OR REPLACE package statistics
is
    function films_no_exemp(num_film NUMBER)return NUMBER;
    function exemp_no_problem(num_exemp NUMBER)return NUMBER;
end;

-- 2 -- declare Body of package
CREATE OR REPLACE package body statistics
is
    -- implement 1st FUNCTION (check)
        function films_no_exemp(num_film NUMBER) return NUMBER
        is
            TYPE my_collection IS TABLE OF NUMBER;
            my_values my_collection := my_collection();
            cpt_nbr number :=0;
            CURSOR myfilms_curr IS SELECT num_film FROM film;
            CURSOR myfilmsE_curr IS SELECT num_film FROM exemplaire;
        BEGIN
          FOR my_record IN myfilmsE_curr LOOP
            my_values.extend;
            my_values(my_values.count) := my_record.num_film;
          END LOOP;
          
          FOR my_record_f IN myfilms_curr LOOP
            IF NOT my_values.MEMBER(my_record_f.num_film) THEN
                cpt_nbr:=cpt_nbr;
            END IF;
          END LOOP;
          
          return cpt_nbr;
        END;
    
    -- implement Second FUNCTION
    function exemp_no_problem(num_exemp NUMBER)return NUMBER
    is 
        nbr_null NUMBER;
        nbr_all NUMBER;
    begin 
        select count(*) into nbr_null from exemplaire where probleme IS NULL;
        select count(*) into nbr_all from exemplaire ;
        
        return Round((nbr_null/nbr_all)*100,2);
    end;
end;

--------------------------------------------------------------------
CREATE OR REPLACE PACKAGE statistics
IS
    TYPE my_collection IS TABLE OF NUMBER;
    FUNCTION films_no_exemp(num_film NUMBER) RETURN NUMBER;
    FUNCTION exemp_no_problem(num_exemp NUMBER) RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY statistics
IS
    -- Implement 1st FUNCTION
    FUNCTION films_no_exemp(num_film NUMBER) RETURN NUMBER
    IS
        TYPE my_collection IS TABLE OF NUMBER;
        my_values my_collection := my_collection();
        cpt_nbr NUMBER := 0;
        CURSOR myfilms_curr IS SELECT num_film FROM film;
        CURSOR myfilmsE_curr IS SELECT num_film FROM exemplaire;
    BEGIN
        FOR my_record IN myfilmsE_curr LOOP
            my_values.extend;
            my_values(my_values.count) := my_record.num_film;
        END LOOP;
        
        -- Initialize the collection before using the MEMBER operator
        IF my_values IS NULL THEN
            my_values := my_collection();
        END IF;
          
        FOR my_record_f IN myfilms_curr LOOP
            IF NOT my_values.MEMBER(my_record_f.num_film) THEN
                cpt_nbr := cpt_nbr + 1;
            END IF;
        END LOOP;
          
        RETURN cpt_nbr;
    END;
    
    -- Implement 2nd FUNCTION
    FUNCTION exemp_no_problem(num_exemp NUMBER) RETURN NUMBER
    IS 
        nbr_null NUMBER;
        nbr_all NUMBER;
    BEGIN 
        SELECT COUNT(*) INTO nbr_null FROM exemplaire WHERE probleme IS NULL;
        SELECT COUNT(*) INTO nbr_all FROM exemplaire ;
        
        IF nbr_all = 0 THEN
            RETURN 0;
        ELSE
            RETURN ROUND((nbr_null/nbr_all)*100,2);
        END IF;
    END;
END;

---------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  result NUMBER;
BEGIN
  result := statistics.exemp_no_problem(2);
  DBMS_OUTPUT.PUT_LINE('Result: ' || result);
END;

select * from exemplaire;


-------------------------------- QUESTION 5 --------------------------------

-- CREATE TABLE 
CREATE TABLE trace(
    numLog NUMBER PRIMARY KEY,
    message VARCHAR2(50)
    );
    
-- Function nbValLOg
CREATE OR REPLACE FUNCTION nbValLog RETURN INTEGER 
AS
    nbval INTEGER;
BEGIN
    SELECT COUNT(*) INTO nbval FROM TRACE; 
    RETURN nbval;
END;
    

    -- Values will be added 
        -- 4 ,trigger 4
        
-------------------------------- QUESTION 6 role --------------------------------
-- Create user 
CREATE USER C##USER IDENTIFIED BY password123 ;
GRANT DELETE,SELECT,UPDATE,INSERT ON location to C##USER;

select user from dual;

-- CREATE PREVENT TRIG
CREATE OR REPLACE TRIGGER trg_prevent_delete
BEFORE DELETE ON location
FOR EACH ROW
DECLARE
    v_username VARCHAR2(100);
BEGIN
    -- Obtenir le nom d'utilisateur de la session en cours
    SELECT USER INTO v_username FROM dual;

    -- Vérifier si l'utilisateur est autorisé
    IF v_username != 'C##USER' THEN
        -- Annuler la suppression
        RAISE_APPLICATION_ERROR(-20001, 'Attention, utilisateur non autorisé !');
    END IF;
END;

-------------------------------- QUESTION 7  --------------------------------
CREATE OR REPLACE TRIGGER location_trigger
BEFORE DELETE OR UPDATE ON location
FOR EACH ROW
DECLARE
   v_old_login VARCHAR2(100);
   v_old_numero_exemplaire NUMBER;
   v_old_date_location DATE;
   v_new_login VARCHAR2(100);
   v_new_numero_exemplaire NUMBER;
   v_new_date_location DATE;
BEGIN
-- a -- 
   -- Refuse la suppression si la date d'envoi de l'exemplaire était renseignée
   IF DELETING AND :OLD.date_envoi IS NOT NULL THEN
      RAISE_APPLICATION_ERROR(-20001, 'La suppression d''une location avec une date d''envoi renseignée est interdite.');
   END IF;

-- b -- 
   -- Refuse la mise à jour ou l'insertion qui aboutit à une location avec une date de retour renseignée et une date d'envoi nulle
   IF UPDATING OR INSERTING THEN
      v_old_login := :OLD.login;
      v_old_numero_exemplaire := :OLD.numero_exemplaire;
      v_old_date_location := :OLD.date_location;
      v_new_login := NVL(:NEW.login, v_old_login);
      v_new_numero_exemplaire := NVL(:NEW.numero_exemplaire, v_old_numero_exemplaire);
      v_new_date_location := NVL(:NEW.date_location, v_old_date_location);

      IF v_new_date_location IS NOT NULL AND :NEW.date_retour IS NOT NULL AND :NEW.date_envoi IS NULL THEN
         RAISE_APPLICATION_ERROR(-20002, 'La mise à jour ou l''insertion d''une location avec une date de retour renseignée et une date d''envoi nulle est interdite.');
      END IF;
   END IF;

   -- Affiche un message avec les détails de l'opération effectuée
   IF UPDATING THEN
      DBMS_OUTPUT.PUT_LINE('Mise à jour de la location - Anciennes valeurs : Login = ' || v_old_login || ', Numero Exemplaire = ' || v_old_numero_exemplaire || ', Date Location = ' || TO_CHAR(v_old_date_location, 'DD-MON-YYYY HH24:MI:SS') || ' - Nouvelles valeurs : Login = ' || v_new_login || ', Numero Exemplaire = ' || v_new_numero_exemplaire || ', Date Location = ' || TO_CHAR(v_new_date_location, 'DD-MON-YYYY HH24:MI:SS'));
   ELSIF INSERTING THEN
      DBMS_OUTPUT.PUT_LINE('Insertion d''une nouvelle location - Login = ' || v_new_login || ', Numero Exemplaire = ' || v_new_numero_exemplaire || ', Date Location = ' || TO_CHAR(v_new_date_location, 'DD-MON-YYYY HH24:MI:SS'));
   END IF;
END;
-------------------------------- QUESTION 8 (check) --------------------------------
-- a -- 
/*
Le déclencheur ne fonctionne pas comme attendu lors 
d'une insertion dans la table location car il utilise 
une instruction de mise à jour (SET nbrExLoues = nbre+1 WHERE login = :NEW.login;) 
sans avoir préalablement initialisé la valeur de la variable nbre. En conséquence, cela 
entraînera une erreur lors de l'exécution du déclencheur. Ce phénomène s'appelle une "exception non gérée".
*/

-- b -- 
CREATE OR REPLACE TRIGGER trigBonus
AFTER INSERT ON LOCATION
FOR EACH ROW
DECLARE
    nbre NUMBER;
BEGIN
    SELECT COUNT(*) INTO nbre FROM LOCATION WHERE login = :NEW.login;
    UPDATE TABLEBONUS SET nbrExLoues = nbre + 1 WHERE login = :NEW.login;
    -- Mettre à jour le bonus selon les règles spécifiées dans la question 2
    -- Exemple :
    IF nbre + 1 > 10 THEN
        UPDATE TABLEBONUS SET bonus = 'HIGH' WHERE login = :NEW.login;
    ELSE
        UPDATE TABLEBONUS SET bonus = 'LOW' WHERE login = :NEW.login;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

----------------------         only for test  --------------------- 
 

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