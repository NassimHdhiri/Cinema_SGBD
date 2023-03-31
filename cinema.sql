-- 1  CREATE TABLES 
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

CREATE TABLE location (
  date_loc DATE,
  num_exemp NUMBER(10),
  login VARCHAR2(50),
  date_envoi DATE,
  date_retour DATE,
  -- composite primary key
  PRIMARY KEY (date_loc, num_exemp),
  CONSTRAINT fk_location FOREIGN KEY (num_exemp) REFERENCES exemplaire(num_exemp),
  CONSTRAINT fk_client FOREIGN KEY (login) REFERENCES client(login)
);


