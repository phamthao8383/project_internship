use quiz_web;

-- insert role 
insert into `role` value(1,'admin')
						,(2,'user');

-- insert acount
insert into `account` value('nhac1', '123123')
						,('nhac2', '123123')
                        ,('nhac3', '123123')
                        ,('nhac4', '123123')
                        ,('nhac5', '123123')
                        ,('nhac6', '123123');
                        
-- user_role
insert into user_role value ('nhac1', 1)
							,('nhac2', 2)
                            ,('nhac3', 2)
                            ,('nhac4',1)
                            ,('nhac5',1)
                            ,('nhac6',2);
                            

-- insert user 
insert into `user` value (1, 'Pham Tan Nhac', 'nhacpham1@gmail.com', '0816569931', 'Huế, Việt Nam', 'ảnh nè', 'nhac1')
						,(2, 'Pham Tan Nhac', 'nhacpham2@gmail.com', '0816569932', 'Huế, Việt Nam', 'ảnh nè', 'nhac2')
                        ,(3, 'Pham Tan Nhac', 'nhacpham3@gmail.com', '0816569933', 'Huế, Việt Nam', 'ảnh nè', 'nhac3')
                        ,(4, 'Pham Tan Nhac', 'nhacpham4@gmail.com', '0816569934', 'Huế, Việt Nam', 'ảnh nè', 'nhac4')
                        ,(5, 'Pham Tan Nhac', 'nhacpham5@gmail.com', '0816569935', 'Huế, Việt Nam', 'ảnh nè', 'nhac5')
                        ,(6, 'Pham Tan Nhac', 'nhacpham6@gmail.com', '0816569936', 'Huế, Việt Nam', 'ảnh nè', 'nhac6');