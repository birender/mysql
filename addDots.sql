/*
	Add 3 Dots after specific number of words
	Example : 
		select AddDots("This is sample String",2);
	Expected Result : This is...
*/


DELIMITER $$
DROP FUNCTION IF EXISTS `AddDots`$$
CREATE FUNCTION `AddDots`(`str` VARCHAR(255) CHARSET utf8, `len` INT) RETURNS varchar(255) CHARSET utf8
    NO SQL
RETURN (case when length(substring_index(str, ' ', len)) = length(str) then str else concat(substring_index(str, ' ', len),'...') end)$$
DELIMITER ;