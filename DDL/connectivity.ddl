-- -----------------------------------------------------------
-- db2 backup database jeddah to /dev/rmt0.1
-- -----------------------------------------------------------
-- db2 backup database jeddah online to /dev/rmt0.1 without prompting
-- -----------------------------------------------------------
-- db2 +c -stf geoinfoDB.ddl
-- -----------------------------------------------------------
-- DROP OLD TABLES
-- -----------------------------------------------------------

-- -----------------------------------------------------------
-- CREATE CONNECTIVITY TABLE
-- -----------------------------------------------------------

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

