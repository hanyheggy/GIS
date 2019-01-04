-- -----------------------------------------------------------
-- db2 backup database jeddah to /dev/rmt0.1
-- -----------------------------------------------------------
-- db2 backup database jeddah online to /dev/rmt0.1 without prompting
-- -----------------------------------------------------------
-- db2 +c -stf geoinfoDB.ddl
-- -----------------------------------------------------------
-- DROP OLD TABLES


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
       STRING         VARCHAR(40)   NOT NULL ,

       FOREIGN KEY   (FEAT_NUM)
       REFERENCES     FEATURES
       ON DELETE      CASCADE    );

COMMIT WORK ;


CREATE INDEX IX_TEXT   ON TEXT  (FEAT_NUM ASC) ;

COMMIT WORK ;



