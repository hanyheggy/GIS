
-- db2 +c -stf geoinfoDB.ddl

-- -----------------------------------------------------------
-- CREATE NODE TABLE
-- -----------------------------------------------------------

DROP TABLE NODE ;

COMMIT WORK ;

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


INSERT INTO  NODE
	( FEAT_NUM , NODE_NUM  )
VALUES  ( 9757   ,  1  ),
	( 9758   ,  2  ),
	( 9759   ,  3  ),
	( 9760   ,  4  ),
	( 9761   ,  5  ),
	( 9762   ,  6  ),
	( 9763   ,  7  ),
	( 9764   ,  8  ),
	( 9765   ,  9  ),
	( 9766   ,  10 ),
	( 9767   ,  11 ),
	( 9768   ,  12 ),
	( 9769   ,  13 )  ;

COMMIT WORK ;

FEAT_NUM   
-----------














  13 record(s) selected.

