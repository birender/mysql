CREATE DEFINER=``@`` PROCEDURE `tft`(IN `usrID` INT(11), IN `s_id` VARCHAR(50), IN `cnt_id` VARCHAR(50))
    READS SQL DATA
BEGIN
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE l_ecost decimal(10,2);
  DECLARE l_price decimal(10,2);
  DECLARE l_smsc varchar(150);
  DECLARE l_sender varchar(150);
  DECLARE l_type INTEGER; 
   #Cursor declaration
      DEClARE curName
        CURSOR FOR
             SELECT cost, price, smsc, new_sender_id, type FROM routing where user_id=usrID AND country = cnt_id AND sender_id = s_id AND is_enabled = 1;
             
             
               #declare NOT FOUND handler
               DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
               
    #Open cursor
               OPEN curName;
    #fetch record
               getName: LOOP
                          FETCH curName INTO l_ecost,l_price,l_smsc,l_sender,l_type;
                              IF finished = 1 
                                 
                              THEN 
                              SELECT cost, price, smsc, new_sender_id, type FROM routing where user_id=usrID AND country = cnt_id AND is_enabled = 1; 
                              LEAVE getName;
                              ELSE
                              	select l_ecost,l_price,l_smsc,l_sender,l_type;
                                 LEAVE getName;
                              END IF;
                              
               END LOOP getName;
               
               CLOSE curName;
               
END