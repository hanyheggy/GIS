
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
VALUES  (  9744  ,  1  ),
	(  9745  ,  2  ),
	(  9746  ,  3  ),
	(  9747  ,  4  ),
	(  9748  ,  5  ),
	(  9749  ,  6  ),
	(  9750  ,  7  ),
	(  9751  ,  8  ),
	(  9752  ,  9  ),
	(  9753  ,  10 ),
	(  9754  ,  11 ),
	(  9755  ,  12 ),
	(  9756  ,  13 )  ;

COMMIT WORK ;
