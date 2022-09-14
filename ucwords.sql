DELIMITER $$

DROP FUNCTION IF EXISTS `ucwords`$$

CREATE FUNCTION `ucwords`( str VARCHAR(255) ) RETURNS VARCHAR(255) CHARSET utf8
    DETERMINISTIC
BEGIN  
  DECLARE c CHAR(1);  
  DECLARE s VARCHAR(255);  
  DECLARE i INT DEFAULT 1;  
  DECLARE BOOL INT DEFAULT 1;  
  DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';  
  SET s = LCASE( str );  
  WHILE i < LENGTH( str ) DO  
     BEGIN  
       SET c = SUBSTRING( s, i, 1 );  
       IF LOCATE( c, punct ) > 0 THEN  
        SET BOOL = 1;  
      ELSEIF BOOL=1 THEN  
        BEGIN  
          IF c >= 'a' AND c <= 'z' THEN  
             BEGIN  
               SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));  
               SET BOOL = 0;  
             END;  
           ELSEIF c >= '0' AND c <= '9' THEN  
            SET BOOL = 0;  
          END IF;  
        END;  
      END IF;  
      SET i = i+1;  
    END;  
  END WHILE;  
  RETURN s;  
END$$

DELIMITER ;