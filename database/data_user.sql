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


 -- insert subject
insert into `subject` value (1, "Toán") 
							,(2, "Lý") 
                            ,(3, "IT") ;

                          
 -- insert question
insert into question value (1, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (2, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (3, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (4, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (5, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (6, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (7, "Hình lăng trụ tam giác đều có bao nhiêu mặt phẳng đối xứng?",
"A. 3", "B. 1", "D. 4" , "B. 1", 1) 
, (8, " Góc chiết quang của lăng kính bằng A = 60.Chiếu một tia sáng trắng vào mặt bên của lăng kính theo phương vuông gócvới mặt phẳng phân giác của góc chiết quang. Đặt một màn quan sát, sau lăng kính",
"A. 3", "B. 1", "D. 4" , "B. 1", 2) 
, (9, " Góc chiết quang của lăng kính bằng A = 60.Chiếu một tia sáng trắng vào mặt bên của lăng kính theo phương vuông gócvới mặt phẳng phân giác của góc chiết quang. Đặt một màn quan sát, sau lăng kính",
"A. 3", "B. 1", "D. 4" , "B. 1", 2) 
, (10, " Góc chiết quang của lăng kính bằng A = 60.Chiếu một tia sáng trắng vào mặt bên của lăng kính theo phương vuông gócvới mặt phẳng phân giác của góc chiết quang. Đặt một màn quan sát, sau lăng kính",
"A. 3", "B. 1", "D. 4" , "B. 1", 2) 
, (11, " Góc chiết quang của lăng kính bằng A = 60.Chiếu một tia sáng trắng vào mặt bên của lăng kính theo phương vuông gócvới mặt phẳng phân giác của góc chiết quang. Đặt một màn quan sát, sau lăng kính",
"A. 3", "B. 1", "D. 4" , "B. 1", 2) 
, (12, " Góc chiết quang của lăng kính bằng A = 60.Chiếu một tia sáng trắng vào mặt bên của lăng kính theo phương vuông gócvới mặt phẳng phân giác của góc chiết quang. Đặt một màn quan sát, sau lăng kính",
"A. 3", "B. 1", "D. 4" , "B. 1", 2) 
                
					