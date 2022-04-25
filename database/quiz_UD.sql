DELIMITER //
CREATE PROCEDURE UpdateMember(
	IN in_user_id int,
	IN in_name varchar(45),
    IN in_email varchar(45),
    IN in_phone varchar(45),
    IN in_address varchar(45),
    IN in_username varchar(45),
    IN in_role_id int)
BEGIN

      Update user_role
      set role_id =  in_role_id
      where username = in_username;

      Update `user`
      set `name` = in_name, email = in_email, phone = in_phone, address = in_address
      where user_id = in_user_id;

END//
DELIMITER ;


Delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(in in_user_id int)
BEGIN
	Declare in_username varchar(45);
    SET SQL_SAFE_UPDATES = 0;
    SET in_username = (Select username from `user` where user_id = in_user_id);
    select in_username;
    Delete from assignment where user_id = in_user_id;
    Delete from accumulated_point where user_id = in_user_id;
	Delete from `user` where user_id = in_user_id ;
    Delete from user_role where username = in_username;
    Delete from `account` where username = in_username;
    SET SQL_SAFE_UPDATES = 1;
END//
Delimiter ;