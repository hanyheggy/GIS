-- -----------------------------------------------------------
-- db2 backup database jeddah to /dev/rmt0.1
-- -----------------------------------------------------------
-- db2 backup database jeddah online to /dev/rmt0.1 without prompting
-- -----------------------------------------------------------
-- db2 +c -stf geoinfoDB.ddl
-- -----------------------------------------------------------
-- DROP OLD TABLES
-- -----------------------------------------------------------

--  DROP TABLE DBASE         ;
--  DROP TABLE FEATURES      ;
--  DROP TABLE COORDINATES   ;
--  DROP TABLE TEXT          ;
--  DROP TABLE LAYER         ;
--  DROP TABLE CONNECTIVITY  ;
--  DROP TABLE CONNECTIVITY1 ;

--  DROP TABLE DISTSTN       ;
--  DROP TABLE MVFEEDER      ;
--  DROP TABLE GRID          ;
--  DROP TABLE MVOPENPT      ;
--  DROP TABLE NODE          ;
--  DROP TABLE STREET        ;

--  COMMIT WORK ;

-- -----------------------------------------------------------
-- CREATE DBASE TABLE
-- -----------------------------------------------------------

CREATE TABLE DBASE
     ( DB_NAME        VARCHAR(20) NOT NULL            ,
       X_MIN          INTEGER     NOT NULL DEFAULT  0 ,
       Y_MIN          INTEGER     NOT NULL DEFAULT  0 ,
       X_MAX          INTEGER     NOT NULL DEFAULT  0 ,
       Y_MAX          INTEGER     NOT NULL DEFAULT  0 ,
       LAST_FEAT_NUM  INTEGER     NOT NULL DEFAULT  0 ,

       PRIMARY KEY   (DB_NAME)  );

COMMIT WORK ;

INSERT INTO  DBASE ( DB_NAME )  VALUES ( 'electric' ) ;

COMMIT WORK ;


-- -----------------------------------------------------------
-- CREATE FEATURES TABLE
-- -----------------------------------------------------------

CREATE TABLE FEATURES
     ( FEAT_NUM       INTEGER     NOT NULL                 ,
       FEAT_CODE      VARCHAR(12) NOT NULL                 ,
       TYPE           SMALLINT    NOT NULL                 ,
       LAYER          SMALLINT    NOT NULL                 ,
       NETWORK        SMALLINT    NOT NULL DEFAULT  0      ,
       SCALE_RANGE    CHAR(5)     NOT NULL DEFAULT 'YYYYY' ,
       DISPLAYED      CHAR(1)     NOT NULL DEFAULT 'Y'     ,
       SELECTABLE     CHAR(1)     NOT NULL DEFAULT 'Y'     ,
       HAS_ATTRIB     CHAR(1)     NOT NULL DEFAULT 'Y'     ,
       HAS_TEXT       CHAR(1)     NOT NULL DEFAULT 'N'     ,
       COLOR          SMALLINT    NOT NULL DEFAULT  0      ,
       LINE_TYPE      SMALLINT    NOT NULL DEFAULT  1      ,
       LINE_WIDTH     SMALLINT    NOT NULL DEFAULT  1      ,
       X_MIN          INTEGER     NOT NULL DEFAULT  0      ,
       Y_MIN          INTEGER     NOT NULL DEFAULT  0      ,
       X_MAX          INTEGER     NOT NULL DEFAULT  0      ,
       Y_MAX          INTEGER     NOT NULL DEFAULT  0      ,
       X_BASE         INTEGER     NOT NULL DEFAULT  0      ,
       Y_BASE         INTEGER     NOT NULL DEFAULT  0      ,
       X_END          INTEGER     NOT NULL DEFAULT  0      ,
       Y_END          INTEGER     NOT NULL DEFAULT  0      ,
       XY_COUNT       SMALLINT    NOT NULL DEFAULT  0      ,
       SYMB_NUM       SMALLINT    NOT NULL DEFAULT  0      ,
       SYMB_SIZE      SMALLINT    NOT NULL DEFAULT  0      ,
       SYMB_ANGLE     SMALLINT    NOT NULL DEFAULT  0      ,
       TEXT_COUNT     SMALLINT    NOT NULL DEFAULT  0      ,

       PRIMARY KEY   (FEAT_NUM)  );

COMMIT WORK ;


CREATE INDEX IX_FEAT_CODE  ON FEATURES  (FEAT_CODE) ;
CREATE INDEX IX_FEAT_TYPE  ON FEATURES  (TYPE)      ;
CREATE INDEX IX_FEAT_LAYER ON FEATURES  (LAYER)     ;
CREATE INDEX IX_FEAT_XBASE ON FEATURES  (X_BASE)    ;
CREATE INDEX IX_FEAT_YBASE ON FEATURES  (Y_BASE)    ;
CREATE INDEX IX_FEAT_XEND  ON FEATURES  (X_END)     ;
CREATE INDEX IX_FEAT_YEND  ON FEATURES  (Y_END)     ;

CREATE INDEX IX_FEAT_XMIN  ON FEATURES  (X_MIN)     ;
CREATE INDEX IX_FEAT_YMIN  ON FEATURES  (Y_MIN)     ;
CREATE INDEX IX_FEAT_XMAX  ON FEATURES  (X_MAX)     ;
CREATE INDEX IX_FEAT_YMAX  ON FEATURES  (Y_MAX)     ;


-- CREATE INDEX IX_FEAT ON FEATURES  (X_BASE,Y_BASE,X_END,Y_END) ;

COMMIT WORK ;



-- -----------------------------------------------------------
-- CREATE COORDINATES TABLE
-- -----------------------------------------------------------

CREATE TABLE COORDINATES
     ( FEAT_NUM       INTEGER   NOT NULL             ,
       SEQ            INTEGER   NOT NULL DEFAULT  0  ,
       X_1            INTEGER   NOT NULL DEFAULT  0  ,
       Y_1            INTEGER   NOT NULL DEFAULT  0  ,
       X_2            INTEGER   NOT NULL DEFAULT  0  ,
       Y_2            INTEGER   NOT NULL DEFAULT  0  ,
       X_3            INTEGER   NOT NULL DEFAULT  0  ,
       Y_3            INTEGER   NOT NULL DEFAULT  0  ,
       X_4            INTEGER   NOT NULL DEFAULT  0  ,
       Y_4            INTEGER   NOT NULL DEFAULT  0  ,
       X_5            INTEGER   NOT NULL DEFAULT  0  ,
       Y_5            INTEGER   NOT NULL DEFAULT  0  ,
       X_6            INTEGER   NOT NULL DEFAULT  0  ,
       Y_6            INTEGER   NOT NULL DEFAULT  0  ,
       X_7            INTEGER   NOT NULL DEFAULT  0  ,
       Y_7            INTEGER   NOT NULL DEFAULT  0  ,
       X_8            INTEGER   NOT NULL DEFAULT  0  ,
       Y_8            INTEGER   NOT NULL DEFAULT  0  ,
       X_9            INTEGER   NOT NULL DEFAULT  0  ,
       Y_9            INTEGER   NOT NULL DEFAULT  0  ,
       X_10           INTEGER   NOT NULL DEFAULT  0  ,
       Y_10           INTEGER   NOT NULL DEFAULT  0  ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE    );

COMMIT WORK ;


CREATE INDEX IX_COORD  ON COORDINATES  (FEAT_NUM ASC) ;

COMMIT WORK ;


-- -----------------------------------------------------------
-- CREATE TEXT  TABLE
-- -----------------------------------------------------------

CREATE TABLE TEXT
     ( FEAT_NUM       INTEGER       NOT NULL ,
       X1             INTEGER       NOT NULL ,
       Y1             INTEGER       NOT NULL ,
       SIZE           SMALLINT      NOT NULL ,
       ANGLE          SMALLINT      NOT NULL ,
       JUST           SMALLINT      NOT NULL ,
       FONT           SMALLINT      NOT NULL ,
       STRING         VARCHAR(50)   NOT NULL ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE    );

COMMIT WORK ;


CREATE        INDEX IX_TEXT   ON TEXT  (FEAT_NUM ASC) ;
CREATE UNIQUE INDEX IX_TEXT1  ON TEXT  (FEAT_NUM,X1,Y1,SIZE,STRING) ;

COMMIT WORK ;


--     X2             INTEGER       NOT NULL ,
--     Y2             INTEGER       NOT NULL ,
--     ANGLE          DECIMAL(6,2)  NOT NULL ,

-- -----------------------------------------------------------
-- CREATE LAYER TABLE
-- -----------------------------------------------------------

CREATE TABLE LAYER
     ( LAYER          SMALLINT     NOT NULL ,
       NAME           VARCHAR(20)  NOT NULL ,
       DESCRIPTION    VARCHAR(50)           ,
       DISPLAYED      CHAR(1)      NOT NULL DEFAULT 'Y' );

CREATE UNIQUE INDEX IX_LAYER  ON LAYER (LAYER,NAME) ;

COMMIT WORK ;

INSERT INTO  LAYER
        ( LAYER , NAME               )
VALUES  ( 0     , 'Map_index'        ),
        ( 1     , 'Electric'         ),
        ( 2     , 'Water'            ),
        ( 3     , 'Waste_water'      ),
        ( 4     , 'Gas'              ),
        ( 5     , 'Building'         ),
        ( 6     , 'Boundary'         ),
        ( 7     , 'Contour'          ),
        ( 8     , 'Fenece'           ),
        ( 9     , 'Labels'           ),
        ( 10    , 'Mosque'           ),
        ( 11    , 'Garden'           ),
        ( 12    , 'Paved_road'       ),
        ( 13    , 'Unpaved_road'     ),
        ( 14    , 'Land_boundary'    ),
        ( 15    , 'Local_boundary'   ),
        ( 16    , 'Cultivated_area'  ),
        ( 17    , 'Streame_wadi'     ),
        ( 18    , 'Beach_Single'     ),
        ( 19    , 'Canals'           ),
        ( 20    , 'Lakes'            ),
        ( 21    , 'Car_park'         ),
        ( 22    , 'Breakwater_dams'  ),
        ( 23    , 'Bridge_culvert'   ),
        ( 24    , 'Gravel'           ),
        ( 25    , 'Ruin'             ),
        ( 26    , 'Street_annotation'),
        ( 27    , 'Arabic'           ),
        ( 28    , 'Airport'          ),
        ( 29    , 'School'           ),
        ( 30    , 'Hospital'         ),
        ( 31    , 'Street'           ),
        ( 32    , 'Center_line'      ),
        ( 33    , 'Text'             ),
        ( 34    , 'SLD'              ),
        ( 35    , 'Landbase'         ),
        ( 99    , 'Misclenous'       );

-- -----------------------------------------------------------
-- CREATE CONNECTIVITY TABLE
-- -----------------------------------------------------------

CREATE TABLE CONNECTIVITY1
     ( FEAT_NUM1      INTEGER   NOT NULL ,
       FEAT_NUM2      INTEGER   NOT NULL   );

COMMIT WORK ;


CREATE TABLE CONNECTIVITY
     ( S_NODE         INTEGER   NOT NULL             ,
       ARC            INTEGER   NOT NULL             ,
       E_NODE         INTEGER   NOT NULL             ,
       WEIGHT         INTEGER   NOT NULL   DEFAULT 0 ,
       DIRECTION      INTEGER   NOT NULL   DEFAULT 0 ,
       OTHER          INTEGER   NOT NULL   DEFAULT 0 ,

       FOREIGN KEY    (ARC)
       REFERENCES     FEATURES
       ON DELETE      CASCADE  );

COMMIT WORK ;

CREATE        INDEX IX_CON1 ON CONNECTIVITY (S_NODE) ;
CREATE UNIQUE INDEX IX_CON2 ON CONNECTIVITY (ARC)    ;
CREATE        INDEX IX_CON3 ON CONNECTIVITY (E_NODE) ;

COMMIT WORK ;

-- CREATE UNIQUE INDEX IX_CON  ON CONNECTIVITY (S_NODE,ARC,E_NODE) ;

-- -----------------------------------------------------------
-- CREATE GRID TABLE
-- -----------------------------------------------------------

CREATE TABLE GRID
     ( FEAT_NUM       INTEGER      NOT NULL              ,
       STATUS         VARCHAR(2)   NOT NULL DEFAULT 'IS' ,
       GRID_ID        VARCHAR(12)  NOT NULL DEFAULT ' '  ,
       PRI_VOLT       VARCHAR(8)   NOT NULL DEFAULT ' '  ,
       SEC_VOLT       VARCHAR(8)   NOT NULL DEFAULT ' '  ,
       MVA            VARCHAR(5)   NOT NULL DEFAULT ' '  ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE   );

COMMIT WORK ;


CREATE UNIQUE INDEX IX_GRD  ON GRID  (FEAT_NUM ASC) ;
CREATE        INDEX IX_GRD1 ON GRID  (GRID_ID)      ;

COMMIT WORK ;


-- -----------------------------------------------------------
-- CREATE DISTSTN  TABLE
-- -----------------------------------------------------------

CREATE TABLE DISTSTN
     ( FEAT_NUM       INTEGER      NOT NULL              ,
       STATUS         VARCHAR(2)   NOT NULL DEFAULT 'IS' ,
       SUB_ID         VARCHAR(12)  NOT NULL DEFAULT '  ' ,
       GRID_ID        VARCHAR(12)  NOT NULL DEFAULT '  ' ,
       FEEDER_NUM     VARCHAR(12)  NOT NULL DEFAULT '  ' ,
       TYPE           VARCHAR(12)  NOT NULL DEFAULT '  ' ,
       KVA            SMALLINT     NOT NULL DEFAULT  0   ,
       PRI_VOLT       VARCHAR(8)   NOT NULL DEFAULT '  ' ,
       SEC_VOLT       VARCHAR(8)   NOT NULL DEFAULT '  ' ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE     );

COMMIT WORK ;


CREATE UNIQUE INDEX IX_SUB  ON DISTSTN (FEAT_NUM ASC) ;
CREATE        INDEX IX_SUB1 ON DISTSTN (SUB_ID)       ;

COMMIT WORK ;


-- -----------------------------------------------------------
-- CREATE MVFEEDER TABLE
-- -----------------------------------------------------------

CREATE TABLE MVFEEDER
     ( FEAT_NUM       INTEGER      NOT NULL              ,
       STATUS         VARCHAR(2)   NOT NULL DEFAULT 'IS' ,
       FEEDER_NUM     VARCHAR(12)  NOT NULL DEFAULT ' '  ,
       GRID_ID        VARCHAR(12)  NOT NULL DEFAULT ' '  ,
       UG_OH          VARCHAR(3)   NOT NULL DEFAULT ' '  ,
       PRI_VOLT       VARCHAR(8)   NOT NULL DEFAULT ' '  ,
       LENGTH         INTEGER      NOT NULL DEFAULT  0   ,
       FROM_SUB       VARCHAR(12)  NOT NULL DEFAULT ' '  ,
       LMR1           VARCHAR(1)   NOT NULL DEFAULT ' '  ,
       TO_SUB         VARCHAR(12)  NOT NULL DEFAULT ' '  ,
       LMR2           VARCHAR(1)   NOT NULL DEFAULT ' '  ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE   );

COMMIT WORK ;


CREATE UNIQUE INDEX IX_FDR  ON MVFEEDER  (FEAT_NUM ASC) ;
CREATE        INDEX IX_FDR1 ON MVFEEDER  (FEEDER_NUM)   ;
CREATE        INDEX IX_FDR2 ON MVFEEDER  (FROM_SUB)     ;
CREATE        INDEX IX_FDR3 ON MVFEEDER  (TO_SUB)       ;

COMMIT WORK ;


-- -----------------------------------------------------------
-- CREATE MVOPENPT TABLE
-- -----------------------------------------------------------

CREATE TABLE MVOPENPT
     ( FEAT_NUM       INTEGER      NOT NULL              ,
       STATUS         VARCHAR(2)   NOT NULL DEFAULT 'IS' ,
       NEAR_SUB       VARCHAR(12)  NOT NULL DEFAULT ' '  ,
       FAR_SUB        VARCHAR(12)  NOT NULL DEFAULT ' '  ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE   );

COMMIT WORK ;


CREATE UNIQUE INDEX IX_OP   ON MVOPENPT  (FEAT_NUM ASC) ;
CREATE        INDEX IX_OP1  ON MVOPENPT  (NEAR_SUB)     ;
CREATE        INDEX IX_OP2  ON MVOPENPT  (FAR_SUB)      ;

COMMIT WORK ;




-- -----------------------------------------------------------
-- CREATE STREET TABLE
-- -----------------------------------------------------------

CREATE TABLE STREET
     ( FEAT_NUM       INTEGER     NOT NULL                       ,
       NAME           VARCHAR(50) NOT NULL DEFAULT 'Street Name' ,
       FLOW           VARCHAR(2)  NOT NULL DEFAULT 'A'           ,
       WIDTH          INTEGER     NOT NULL DEFAULT  0            ,
       LENGTH         INTEGER     NOT NULL DEFAULT  0            ,
       WEIGHT         INTEGER     NOT NULL DEFAULT  0            ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE   );

COMMIT WORK ;


CREATE UNIQUE INDEX IX_STR  ON STREET    (FEAT_NUM ASC) ;
CREATE        INDEX IX_STR1 ON STREET    (NAME)         ;

COMMIT WORK ;


-- -----------------------------------------------------------
-- CREATE NODE TABLE
-- -----------------------------------------------------------

CREATE TABLE NODE
     ( FEAT_NUM       INTEGER     NOT NULL  ,
       NODE_NUM       INTEGER     NOT NULL  ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE   );

COMMIT WORK ;


CREATE UNIQUE INDEX IX_NOD  ON NODE    (FEAT_NUM ASC) ;
CREATE        INDEX IX_NOD1 ON NODE    (NODE_NUM)     ;

COMMIT WORK ;


