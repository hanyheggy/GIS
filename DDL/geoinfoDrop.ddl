-- -----------------------------------------------------------
-- db2 +c -stf geoinfoDB.ddl
-- -----------------------------------------------------------
-- DROP OLD TABLES
-- -----------------------------------------------------------

    DROP TABLE GRID          ;
    COMMIT WORK ;

    DROP TABLE MVOPENPT      ;
    COMMIT WORK ;


    DROP TABLE DBASE         ;
    COMMIT WORK ;
    DROP TABLE FEATURES      ;
     COMMIT WORK ;
    DROP TABLE COORDINATES   ;
       COMMIT WORK ;
    DROP TABLE TEXT          ;
      COMMIT WORK ;
    DROP TABLE LAYER         ;
     COMMIT WORK ;
    DROP TABLE CONNECTIVITY  ;
     COMMIT WORK ;
    DROP TABLE CONNECTIVITY1 ;
       COMMIT WORK ;

    DROP TABLE DISTSTN       ;
       COMMIT WORK ;
    DROP TABLE MVFEEDER      ;
     COMMIT WORK ;                                       :
    DROP TABLE STREET        ;
       COMMIT WORK ;


