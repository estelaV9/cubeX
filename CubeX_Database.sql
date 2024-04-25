/*REALIZADO POR : ESTELA DE VEGA MARTIN 1ºDAM*/
/**************DISENIO FISICO CUBE_X***********/
DROP DATABASE IF EXISTS CubeX_DB;
CREATE DATABASE CubeX_DB;
USE CubeX_DB;

CREATE USER 'cubeX'@'%' IDENTIFIED BY 'CubeX';
GRANT ALL PRIVILEGES ON cubex_db.* TO 'cubeX';

/*TABLAS*/
DROP TABLE IF EXISTS CUBE_USERS;
CREATE TABLE CUBE_USERS (
    ID_USER INT AUTO_INCREMENT PRIMARY KEY,
    NAME_USER VARCHAR(45) UNIQUE NOT NULL,
    PASSWORD_USER VARCHAR(45) NOT NULL,
    /*EL NIVEL SE ESTABLECE EN 0, YA QUE PARA CALCULARLO NECESITAS EL ID DE TIME 
    PARA CALCULARLO. EL USUARIO AL ENTRAR TENDRA UN NIVEL 0, CUANDO HAYA REALIZADO
    TIEMPOS SE IRAN ACTUALIZANDO EL NIVEL*/
    LEVEL_USER INT DEFAULT 0 NOT NULL, 
    ROLE_USER VARCHAR(6) NOT NULL CHECK (ROLE_USER IN ('MEMBER', 'USER')) DEFAULT 'USER',
    MAIL VARCHAR(100) NOT NULL,
    REGISTRATION_DATE DATE NOT NULL
    
);

INSERT INTO CUBE_USERES (NAME_USER, PASSWORD_USER, MAIL, REGISTRATION_DATE) 
	VALUES ('admin', 'admin', 'admin@admin', '2024-04-25');

DROP TABLE IF EXISTS MEMBERS;
CREATE TABLE MEMBERS ( 
	ID_MEMBER INT PRIMARY KEY,
    ID_USER INT NOT NULL,    
    DISCOUNT INT DEFAULT 0 NOT NULL,
    REGISTRATION_DATE DATE NOT NULL,
    CONSTRAINT fk_member FOREIGN KEY (ID_USER) REFERENCES CUBE_USERS(ID_USER)
        ON DELETE CASCADE
);


DROP TABLE IF EXISTS CUBE_TYPE;
CREATE TABLE CUBE_TYPE (
    ID_TYPE INT PRIMARY KEY,
    NAME_TYPE VARCHAR(55) UNIQUE NOT NULL
);
 
INSERT INTO CUBE_TYPE VALUES (1,'2x2x2');
INSERT INTO CUBE_TYPE VALUES (2,'3x3x3');
INSERT INTO CUBE_TYPE VALUES (3,'4x4x4');
INSERT INTO CUBE_TYPE VALUES (4,'5x5x5');
INSERT INTO CUBE_TYPE VALUES (5,'6x6x6');
INSERT INTO CUBE_TYPE VALUES (6,'7x7x7');
INSERT INTO CUBE_TYPE VALUES (7,'PYRAMINX');
INSERT INTO CUBE_TYPE VALUES (8,'MEGAMINX');
INSERT INTO CUBE_TYPE VALUES (9,'SKEWB');
INSERT INTO CUBE_TYPE VALUES (10,'SQUARE-1');
INSERT INTO CUBE_TYPE VALUES (11,'CLOCK');
INSERT INTO CUBE_TYPE VALUES (12,'3x3x3 MIRROR');
INSERT INTO CUBE_TYPE VALUES (13,'5x5x5 BLIND');
INSERT INTO CUBE_TYPE VALUES (14,'3x3x3 ONE-HANDED');
INSERT INTO CUBE_TYPE VALUES (15,'3x3x3 BLIND');
INSERT INTO CUBE_TYPE VALUES (16,'3x3x3 MULTIBLIND');
INSERT INTO CUBE_TYPE VALUES (17,'4x4x4 BLIND');
INSERT INTO CUBE_TYPE VALUES (18,'PYRAMORPHIX');
INSERT INTO CUBE_TYPE VALUES (19,'MASTERMORPHIX');
INSERT INTO CUBE_TYPE VALUES (20,'3x3x3 FEWEST MOVES CHALLENGE');
COMMIT;


DROP TABLE IF EXISTS METHOD_CUBE;
CREATE TABLE METHOD_CUBE (
    ID_METHOD INT PRIMARY KEY,
    NAME_METHOD VARCHAR(55) UNIQUE NOT NULL
);

INSERT INTO METHOD_CUBE VALUES (1,'ORTEGA METHOD');
INSERT INTO METHOD_CUBE VALUES (2,'CORNERS LAST LAYER');
INSERT INTO METHOD_CUBE VALUES (3,'BEGINNERï¿½S METHOD');
INSERT INTO METHOD_CUBE VALUES (4,'REDUCED FRIDRICH METHOD');
INSERT INTO METHOD_CUBE VALUES (5,'FRIDRICH METHOD');
INSERT INTO METHOD_CUBE VALUES (6,'ROUX METHOD');
INSERT INTO METHOD_CUBE VALUES (7,'ZBOROWSKI-ZOLTE METHOD');
INSERT INTO METHOD_CUBE VALUES (8,'PETRUS METHOD');
INSERT INTO METHOD_CUBE VALUES (9,'WALTERMAN METHOD');
INSERT INTO METHOD_CUBE VALUES (10,'HEISE METHOD');
INSERT INTO METHOD_CUBE VALUES (11,'HOYA METHOD');
INSERT INTO METHOD_CUBE VALUES (12,'ZBOROWSKI-BRUCHEM LAST LAYER METHOD');
INSERT INTO METHOD_CUBE VALUES (13,'YAU METHOD');
INSERT INTO METHOD_CUBE VALUES (14,'INTUITIVE METHOD');
INSERT INTO METHOD_CUBE VALUES (15,'REDUX METHOD');
INSERT INTO METHOD_CUBE VALUES (16,'REDUCTION METHOD');
INSERT INTO METHOD_CUBE VALUES (17,'KEYHOLE METHOD');
INSERT INTO METHOD_CUBE VALUES (18,'LAYER-BY-LAYER METHOD');
INSERT INTO METHOD_CUBE VALUES (19,'RIDO METHOD');
INSERT INTO METHOD_CUBE VALUES (20,'EDGE PERMUTATION METHOD');
INSERT INTO METHOD_CUBE VALUES (21,'VANDENBERGH METHOD');
INSERT INTO METHOD_CUBE VALUES (22,'SHAPE-SHIFTING METHOD');
INSERT INTO METHOD_CUBE VALUES (23,'TOP-DOWN METHOD');
INSERT INTO METHOD_CUBE VALUES (24,'PATTERN METHOD');
INSERT INTO METHOD_CUBE VALUES (25,'OLD POCHMANN METHOD');
INSERT INTO METHOD_CUBE VALUES (26,'M2 METHOD');
INSERT INTO METHOD_CUBE VALUES (27,'CORNERS-FIRST METHOD');
INSERT INTO METHOD_CUBE VALUES (28,'GROUPING TECHNIQUE');
INSERT INTO METHOD_CUBE VALUES (29,'DIVIDE AND CONQUER APPROACH METHOD');
INSERT INTO METHOD_CUBE VALUES (30,'STARTING POSITION STRATEGY METHOD');
INSERT INTO METHOD_CUBE VALUES (31,'ADVANCED METHOD');
INSERT INTO METHOD_CUBE VALUES (32,'ADVANCED REDUCTION METHOD');
INSERT INTO METHOD_CUBE VALUES (33,'CENTERS SOLVING METHOD');
INSERT INTO METHOD_CUBE VALUES (34,'EDGE PAIRING TECHNIQUES');
INSERT INTO METHOD_CUBE VALUES (35,'BACKTRACKING TECHNIQUES');
INSERT INTO METHOD_CUBE VALUES (36,'EXHAUSTIVE SEARCH TECHNIQUES');
INSERT INTO METHOD_CUBE VALUES (37,'ALGORYTHM OPTIMIZATION TECHNIQUES');
INSERT INTO METHOD_CUBE VALUES (38,'MOVE ANALYSIS TECHNIQUES');
INSERT INTO METHOD_CUBE VALUES (39,'OTHER');
COMMIT;


DROP TABLE IF EXISTS TYPE_METHOD_TIENE;
CREATE TABLE TYPE_METHOD_TIENE(
    ID_TYPE INT NOT NULL,
    ID_METHOD INT NOT NULL,
    CONSTRAINT pk_tiene_MeTy PRIMARY KEY (ID_TYPE, ID_METHOD),
    CONSTRAINT fk_type_tiene FOREIGN KEY (ID_TYPE) REFERENCES CUBE_TYPE(ID_TYPE),
    CONSTRAINT fk_method_tiene FOREIGN KEY (ID_METHOD) REFERENCES METHOD_CUBE(ID_METHOD)
);

INSERT INTO TYPE_METHOD_TIENE VALUES (1, 1);
INSERT INTO TYPE_METHOD_TIENE VALUES (1, 2);
INSERT INTO TYPE_METHOD_TIENE VALUES (1, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (1, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (1, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (1, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (1, 18);

INSERT INTO TYPE_METHOD_TIENE VALUES (2, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 6);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 7);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 9);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 10);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 11);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 12);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 15);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 17);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (2, 20);

INSERT INTO TYPE_METHOD_TIENE VALUES (3, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 6);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 10);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 19);
INSERT INTO TYPE_METHOD_TIENE VALUES (3, 24);

INSERT INTO TYPE_METHOD_TIENE VALUES (4, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 6);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 10);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 21);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 22);
INSERT INTO TYPE_METHOD_TIENE VALUES (4, 24);

INSERT INTO TYPE_METHOD_TIENE VALUES (5, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (5, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (5, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (5, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (5, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (5, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (5, 23);

INSERT INTO TYPE_METHOD_TIENE VALUES (6, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (6, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (6, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (6, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (6, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (6, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (6, 23);

INSERT INTO TYPE_METHOD_TIENE VALUES (7, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (7, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (7, 18);

INSERT INTO TYPE_METHOD_TIENE VALUES (8, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (8, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (8, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (8, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (8, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (8, 22);
INSERT INTO TYPE_METHOD_TIENE VALUES (8, 24);

INSERT INTO TYPE_METHOD_TIENE VALUES (9, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (9, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (9, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (9, 24);
INSERT INTO TYPE_METHOD_TIENE VALUES (9, 31);

INSERT INTO TYPE_METHOD_TIENE VALUES (10, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (10, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (10, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (10, 22);
INSERT INTO TYPE_METHOD_TIENE VALUES (10, 24);
INSERT INTO TYPE_METHOD_TIENE VALUES (10, 31);

INSERT INTO TYPE_METHOD_TIENE VALUES (11, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (11, 24);
INSERT INTO TYPE_METHOD_TIENE VALUES (11, 28);
INSERT INTO TYPE_METHOD_TIENE VALUES (11, 29);
INSERT INTO TYPE_METHOD_TIENE VALUES (11, 30);

INSERT INTO TYPE_METHOD_TIENE VALUES (12, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 6);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 7);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 9);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 10);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 11);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 12);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 15);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 17);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (12, 20);

INSERT INTO TYPE_METHOD_TIENE VALUES (13, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (13, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (13, 15);
INSERT INTO TYPE_METHOD_TIENE VALUES (13, 32);
INSERT INTO TYPE_METHOD_TIENE VALUES (13, 33);
INSERT INTO TYPE_METHOD_TIENE VALUES (13, 34);

INSERT INTO TYPE_METHOD_TIENE VALUES (14, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 6);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 7);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 9);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 10);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 11);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 12);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 15);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 17);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (14, 20);

INSERT INTO TYPE_METHOD_TIENE VALUES (15, 3);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 4);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 5);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 6);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 7);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 8);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 9);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 10);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 11);
INSERT INTO TYPE_METHOD_TIENE VALUES (15, 12);

INSERT INTO TYPE_METHOD_TIENE VALUES (16, 15);
INSERT INTO TYPE_METHOD_TIENE VALUES (16, 23);
INSERT INTO TYPE_METHOD_TIENE VALUES (16, 25);
INSERT INTO TYPE_METHOD_TIENE VALUES (16, 26);

INSERT INTO TYPE_METHOD_TIENE VALUES (17, 13);
INSERT INTO TYPE_METHOD_TIENE VALUES (17, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (17, 15);
INSERT INTO TYPE_METHOD_TIENE VALUES (17, 32);
INSERT INTO TYPE_METHOD_TIENE VALUES (17, 33);
INSERT INTO TYPE_METHOD_TIENE VALUES (17, 34);

INSERT INTO TYPE_METHOD_TIENE VALUES (18, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (18, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (18, 24);

INSERT INTO TYPE_METHOD_TIENE VALUES (19, 14);
INSERT INTO TYPE_METHOD_TIENE VALUES (19, 16);
INSERT INTO TYPE_METHOD_TIENE VALUES (19, 18);
INSERT INTO TYPE_METHOD_TIENE VALUES (19, 24);
INSERT INTO TYPE_METHOD_TIENE VALUES (19, 28);

INSERT INTO TYPE_METHOD_TIENE VALUES (20, 28);
INSERT INTO TYPE_METHOD_TIENE VALUES (20, 34);
INSERT INTO TYPE_METHOD_TIENE VALUES (20, 36);
INSERT INTO TYPE_METHOD_TIENE VALUES (20, 37);
INSERT INTO TYPE_METHOD_TIENE VALUES (20, 38);
COMMIT;


DROP TABLE IF EXISTS SESSIONS;
CREATE TABLE SESSIONS (
    ID_SESSION INT PRIMARY KEY,
    ID_USER INT NOT NULL,    
    NAME_SESSION VARCHAR(45) NOT NULL,
    CREATION_DATE DATE NOT NULL,   
    CONSTRAINT fk_user_session FOREIGN KEY (ID_USER) REFERENCES CUBE_USERS(ID_USER),
    -- ESTABLEZCO EL NOMBRE DE LA SESSION SIN EL UNIQUE PARA QUE OTRO USUARIO 
    -- PUEDA TENER EL MISMO NOMBRE DE LA SESION QUE OTRO, PERO QUE UN USUARIO
    -- NO PUEDA TENER UNA SESSION CON EL MISMO NOMBRE
    CONSTRAINT UNIQUE_SESSION_NAME UNIQUE (NAME_SESSION, ID_USER)
);


DROP TABLE IF EXISTS CHAMPIONSHIP;
CREATE TABLE CHAMPIONSHIP (
    ID_CHAMP INT PRIMARY KEY,
    -- USUARIOS QUE HA CREADO LA COMPETENCIA
    ID_USER INT NOT NULL,
    NAME_CHAMP VARCHAR(45) UNIQUE NOT NULL,
    PRICE INT DEFAULT 0 NOT NULL,    
    NUMBER_PART INT NOT NULL CHECK (NUMBER_PART >= 2),
    DESCRIPTION_CHAMP VARCHAR(255) NOT NULL,
    /*SOLO LOS MIEMBROS PUEDAN CREAR COMPETICIONES EXCLUSIVAS PARA MIEMBROS CON PRECIOS*/
    MEMBERS_ONLY BOOLEAN DEFAULT 0 NOT NULL,
    CONSTRAINT fk_user_champ FOREIGN KEY (ID_USER) REFERENCES CUBE_USERS(ID_USER)
);    


DROP TABLE IF EXISTS CUBE_CHAMP_PERTENECE;
CREATE TABLE CUBE_CHAMP_PERTENECE(
    ID_TYPE INT NOT NULL,
    ID_CHAMP INT NOT NULL,    
    WINNER VARCHAR(45),
    CONSTRAINT pk_CubChaPertenece PRIMARY KEY (ID_TYPE, ID_CHAMP),
    CONSTRAINT fk_type_pertenece FOREIGN KEY (ID_TYPE) REFERENCES CUBE_TYPE(ID_TYPE),
    CONSTRAINT fk_champ_pertenece FOREIGN KEY (ID_CHAMP) REFERENCES CHAMPIONSHIP(ID_CHAMP)
);


DROP TABLE IF EXISTS USER_CHAMP_COMPETE;
CREATE TABLE USER_CHAMP_COMPETE(
    ID_USER INT NOT NULL,
    ID_CHAMP INT NOT NULL, 
    CONSTRAINT pk_compete PRIMARY KEY (ID_USER, ID_CHAMP),
    CONSTRAINT fk_user_compete FOREIGN KEY (ID_USER) REFERENCES CUBE_USERS(ID_USER),
    CONSTRAINT fk_champ_compete FOREIGN KEY (ID_CHAMP) REFERENCES CHAMPIONSHIP(ID_CHAMP)
);


DROP TABLE IF EXISTS  COMPETITION;
CREATE TABLE COMPETITION(
    ID_COMPE INT PRIMARY KEY, 
    ID_USER INT NOT NULL,
    CUBER1 VARCHAR(45) NOT NULL, 
    CUBER2 VARCHAR(45) NOT NULL,
    WINNER VARCHAR(45),
    CONSTRAINT ch_NoEqualName CHECK (CUBER1 NOT LIKE CUBER2),
    CONSTRAINT fk_user_compe FOREIGN KEY (ID_USER) REFERENCES CUBE_USERS(ID_USER)
);


DROP TABLE IF EXISTS AVERAGE;
CREATE TABLE AVERAGE (
    ID_AVERAGE INT PRIMARY KEY,
    AVG_MINUTES INT,
    AVG_SECONDS DECIMAL(5, 3),
    PERIOD_AVG INT,
    PB_MINUTES INT,
    PB_SECONDS DECIMAL(5, 3),
    WORST_MINUTES INT,
    WORST_SECONDS DECIMAL(5, 3)
);


DROP TABLE IF EXISTS SCRAMBLE;
CREATE TABLE SCRAMBLE (
    ID_SCRAMBLE INT PRIMARY KEY,
    ID_USER INT NOT NULL,    
    DESCRIPTION_SCRAMBLE VARCHAR(455) UNIQUE NOT NULL,
    MINUTES1 INT NOT NULL,
    SECONDS1 DECIMAL(5, 3) NOT NULL,
    MINUTES2 INT,
    SECONDS2 DECIMAL(5, 3),
    COMMENTS1 VARCHAR(255),
    COMMENTS2 VARCHAR(255),
    REGISTRATION_DATE DATE NOT NULL,
    ID_COMPE INT,
    ID_CHAMP INT,
    ID_AVERAGE INT,
    ID_SESSION INT,
    ID_TYPE INT NOT NULL, 
    -- RESTRICCION PARA QUE LOS MINUTOS EN LAS CATEGORIAS DE 2X2X2 Y 3X3X3 NO 
    -- SUPEREN LOS 10 MINUTOS
    CONSTRAINT chk_minutes1 CHECK (MINUTES1 < 10 OR ID_TYPE NOT IN (1,2)),
    CONSTRAINT chk_minutes2 CHECK (MINUTES2 < 10 OR ID_TYPE NOT IN (1,2)),
    CONSTRAINT fk_user_scramble FOREIGN KEY (ID_USER) REFERENCES CUBE_USERS(ID_USER),
    CONSTRAINT fk_champ_scramble FOREIGN KEY (ID_CHAMP) REFERENCES CHAMPIONSHIP(ID_CHAMP),
    CONSTRAINT fk_average_times FOREIGN KEY (ID_AVERAGE) REFERENCES AVERAGE(ID_AVERAGE),
    CONSTRAINT fk_session_times FOREIGN KEY (ID_SESSION) REFERENCES SESSIONS(ID_SESSION),
    CONSTRAINT fk_type_times FOREIGN KEY (ID_TYPE) REFERENCES CUBE_TYPE(ID_TYPE),
    CONSTRAINT fk_scramble_compe FOREIGN KEY (ID_COMPE) REFERENCES COMPETITION(ID_COMPE)
);
