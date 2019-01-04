
-- db2 +c -stf geoinfoDB.ddl

-- -----------------------------------------------------------
-- CREATE NODE TABLE
-- -----------------------------------------------------------



CREATE TABLE TEST1
     ( FEAT_NUM       INTEGER     NOT NULL ,
       FEAT_PIC       BLOB(1M)    NOT NULL   );
COMMIT WORK ;


