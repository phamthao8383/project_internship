use quiz_web;
-- insert role 
insert into `role` value(1,'admin')
						,(2,'user');

-- insert acount
insert into `account` value	('nhac1', '123123')
							,('hieu1', '123123')
							,('hongson1', '123123')
							,('nhung1', '123123')
							,('danh1', '123123')
							,('van1', '123123')
							,('dung1', '123123')
							,('thao1', '123123')
							,('nhac2', '123123')
							,('hieu2', '123123')
							,('hongson2', '123123')
							,('nhung2', '123123')
							,('danh2', '123123')
							,('van2', '123123')
							,('dung2', '123123')
							,('thao2', '123123');
                        
-- user_role
insert into user_role value ('nhac1', 1)
							,('hieu1', 1)
							,('hongson1', 1)
							,('nhung1', 1)
							,('danh1', 1)
							,('van1', 1)
							,('dung1', 1)
							,('thao1', 1)
							,('nhac2', 2)
							,('hieu2',2)
							,('hongson2',2)
							,('nhung2', 2)
							,('danh2', 2)
							,('van2',2)
							,('dung2', 2)
							,('thao2',2);
                            

-- insert user 
insert into `user` value (1, 'Pham Tan Nhac', 'nhacpham1@gmail.com', '0816569931', 'Huế, Việt Nam', 'ảnh nè', 'nhac1')
						,(2, 'Pham Tan Nhac', 'nhacpham2@gmail.com', '0816569932', 'Huế, Việt Nam', 'ảnh nè', 'nhac2')
                        ,(3, 'Hoang Hieu', 'hoanghieu1@gmail.com', '0816569933', 'Đà Nẵng, Việt Nam', 'ảnh nè', 'hieu1')
                        ,(4, 'Hoang Hieu', 'hoanghieu2@gmail.com', '0816569934', 'Đà Nẵng, Việt Nam', 'ảnh nè', 'hieu2')
                        ,(5, 'Hong Son', 'hongson1@gmail.com', '0816569936', 'Quang Nam, Việt Nam', 'ảnh nè', 'hongson1')
                        ,(6, 'Hong Song', 'hongson2@gmail.com', '0816569935', 'Quang Nam, Việt Nam', 'ảnh nè', 'hongson2')
                        ,(7, 'Hồng Nhung', 'hongnhung1@gmail.com', '0816569936', 'Quảng Nam, Việt Nam', 'ảnh nè', 'nhung1')
                        ,(8, 'Hồng Nhung', 'hongnhung2@gmail.com', '0816569936', 'Quảng Nam, Việt Nam', 'ảnh nè', 'nhung2')
                        ,(9, 'Thành Danh', 'thanhdanh1@gmail.com', '0816569936', 'Quảng Nam, Việt Nam', 'ảnh nè', 'danh1')
                        ,(10, 'Thành Danh', 'thanhdanh2@gmail.com', '0816569936', 'Quảng Nam, Việt Nam', 'ảnh nè', 'danh2')
                        ,(11, 'Mỹ Vân', 'myvan1@gmail.com', '081656999', 'Quảng Nam, Việt Nam', 'ảnh nè', 'van1')
                        ,(12, 'Mỹ Vân', 'myvan2@gmail.com', '0816569988', 'Quảng Nam, Việt Nam', 'ảnh nè', 'van2')
                        ,(13, 'Thu Thảo', 'thuthao1@gmail.com', '081656999', 'Quảng Nam, Việt Nam', 'ảnh nè', 'thao1')
                        ,(14, 'Thu Thảo', 'thuthao2@gmail.com', '0816569988', 'Quảng Nam, Việt Nam', 'ảnh nè', 'thao2')
                        ,(15, 'Tấn Dũng', 'tandung1@gmail.com', '081656999', 'Quảng Nam, Việt Nam', 'ảnh nè', 'dung1')
                        ,(16, 'Tấn Dũng', 'tandung2@gmail.com', '0816569988', 'Quảng Nam, Việt Nam', 'ảnh nè', 'dung2');


 -- insert subject
insert into `subject` value (1, "Toán") 
							,(2, "Lý") 
                            ,(3, "Hóa") 
                            ,(4, "IT");

                          
 -- insert question câu hỏi lý
insert into question value (1, "Lực tương tác giữa hai điện tích điểm đứng yên trong không khí thay đổi như thế nào nếu đặt một tấm nhựa xen vào khoảng giữa hai điện tích?",
"Phương, chiều, độ lớn không đổi", "Phương, chiều không đổi, độ lớn giảm", "Phương thay đổi tùy theo hướng đặt tấm nhựa, chiều, độ lớn không đổi", "Phương, chiều không đổi, độ lớn tăng." ,
 "Phương, chiều không đổi, độ lớn giảm", 2) 
, (2, "Hai điện tích điểm giống nhau có độ lớn 2.10^-6C, đặt trong chân không cách nhau 20cm thì lực tương tác giữa chúng",
"là lực đẩy, có độ lớn 9.10-5N", "là lực hút, có độ lớn 0,9N","là lực hút, có độ lớn 9.10-5N",  "là lực đẩy có độ lớn 0,9N" , "là lực đẩy có độ lớn 0,9N", 2) 
, (3, "Hai điện tích điểm q1=1,5.10^-7C và q2 đặt trong chân không cách nhau 50cm thì lực hút giữa chúng là 1,08.10-3N. Giá trị của điện tích q2 là:",
"2.10-7C", "2.10-3C","-2.10-7C",  "-2.10-3C" ,"-2.10-7C", 2) 
, (4, "Hai điện tích điểm q1=2,5.10-6C và q2=4.10-6C đặt gần nhau trong chân không thì lực đẩy giữa chúng là 1,44N. Khoảng cách giữ hai điện tích là:",
"25cm", "20cm","12cm",  "40cm" , "25cm", 2) 
, (5, "Hai điện tích điểm đặt trong không khí cách nhau một khoảng 30cm có lực tương tác tĩnh giữa chúng là F. Nếu nhúng chúng trong dầu có hằng số điện môi là 2,25, để lực tương tác giữa chúng vẫn là F thì khoảng cách giữa các điện tích là:",
"20cm", "10cm","25cm",  "15cm" , "20cm", 2) 
, (6, "Hai vật nhỏ mang điện tích cách nhau 40cm trong không khí thì đẩy nhau với lực là 0,675 N. Biết rằng tổng điện tích của hai vật là 8.10-6C. Điện tích của mỗi vật lần lượt là:",
"q1 = 7.10-6C; q2 = 10-6C", "q1 = q2 = 4.10-6C","q1 = 2.10-6C ; q2 = 6.10-6C",  "q1 = 3.10-6C ; q2 = 5.10-6C" , "q1 = 2.10-6C ; q2 = 6.10-6C", 2) 
, (7, "Hai điện tích dương q1, q2 có cùng một độ lớn được đặt tại hai điểm A, B, điện tích q0 đặt tại trung điểm của AB thì ta thấy hệ ba điện tích này nằm cân bằng trong chân không. Bỏ qua trọng lượng của ba điện tích. Chọn kết luận đúng.",
"qo là điện tích dương", "qo là điện tích âm","qo có thể là điên tích âm có thể là điện tích dương",  "qo phải bằng 0" , "qo là điện tích âm", 2) 
, (8, " Hai quả cầu nhẹ có cùng khối lượng được treo vào mỗi điểm bằng hai dây chỉ giống nhau. Truyền cho hai quả cầu điện tích cùng dấu q1 và q3 = 3q1, hai quả cầu đẩy nhau. Góc lệch của hai dây treo hai quả cầu so với phương thẳng đứng là α1 và α2. Chọn biểu thức đúng :",
"α1 = 3α2", "3α1 = α2","α1 = α2",  "α1 = 1,5α2" , "α1 = α2", 2) 
, (9, " Quả cầu nhỏ có khối lượng 18g mang điện tích q1 = 4.10-6 C treo ở đầu một sợi dây mảnh dài 20cm. Nếu đặt điện tích q2 tại điểm treo sợi dây thì lực căng của dây giảm đi một nửa. Lấy g = 10m/s2. Điện tích q2 có giá trị bằng :",
"-2.10-6C", "2.10-6C","10-7C",  "-10-7C" , "-10-7C", 2) 
, (10, "Hai điện tích điểm q1 và q2 được giữ cố định tại 2 điểm A và B cách nhau một khoảng a trong điện môi. Điện tich q3 đặt tại điểm C trên đoạn AB cách B một khoảng a/3. Để điện tích q3 cân bằng phải có điều kiện nào sau đây ?",
"q1 = 2q2", "q1 = -4q2","q1 = 4q2",  "q1 = -2q2" , "q1 = 4q2", 2) ;

-- insert đề toán 
insert into question (description,answer1,answer2 ,answer3,answer4,correct_answer,subject_id)
value 	("Khối lớp Một có 245 học sinh, khối lớp Hai có ít hơn khối lớp Một 22 học sinh. Hỏi khối lớp Hai có bao nhiêu học sinh?",
		"223 học sinh","267 học sinh","233 học sinh","232 học sinh", " 233 học sinh", 1), 
		("Tìm x, biết x + 123 = 666", " 789","543","798","534", "543", 1), 
        ("Điền số thích hợp vào chỗ trống: 400 + 500 = …", " 900","800","90","133", "900", 1), 
        ("Tìm x, biết x + 123 = 666", " 789","543","798","534", "543", 1), 
        ("Trong các mệnh đề sau, mệnh đề nào đúng?", " Mọi hình hộp đứng đều có mặt cầu ngoại tiếp.","Mọi hình hộp chữ nhật đều có mặt cầu ngoại tiếp.","Mọi hình hộp có một mặt bên vuông góc với đáy đều có mặt cầu ngoại tiếp."
        ,"Mọi hình hộp đều có mặt cầu ngoại tiếp.", "Mọi hình hộp chữ nhật đều có mặt cầu ngoại tiếp.", 1), 
        ("Cho hàm số y = x – ln(1 + ex). Khẳng định nào sau đây là đúng?", "Hàm số đạt cực đại tại x = 0","Tập xác định của hàm số là D = (0; +∞)","Hàm số đồng biến trên R","Hàm số đạt cực tiểu tại x = 1", "Hàm số đồng biến trên R", 1), 
        ("Cho ΔABC vuông tại A, AB = 6cm, AC = 8cm. Gọi V1 là thể tích khối nón tạo thành khi quay ΔABC quanh cạnh AB và V2 là thể tích khối nón tạo thành khi quay ΔABC  quanh cạnh AC. Tỉ số V1/ V2 bằng", 
        " 4/3","3/4","16/9","64/27", "64/27", 1), 
        ("Gọi x = a và x = b là các điểm cực trị của hàm số y = 2x3 – 3x2 – 18x - 1. Khi đó A = a + b – 2ab bằng:", 
        " -7","5","7","-5", "-5", 1), 
        ("Cho hình chóp S.ABC có đáy là tam giác đều cạnh bằng 6, cạnh bên SA ⊥ (ABC) và SA = 4√6. Diện tích mặt cầu ngoại tiếp hình chóp S.ABC bằng:",
        " 108π","48π","36π","144π", "144π", 1), 
		("Một cửa hàng có 325 kg gạo, buổi sáng cửa hàng nhập thêm về 214 kg gạo, buổi chiều họ xuất đi 420 kg. Cửa hàng còn lại số ki-lô-gam gạo là:", "959 kg","119 kg","129 kg","539 kg", "539 kg", 1) ;
 
-- insert đề hóa 
 insert into question (description,answer1,answer2 ,answer3,answer4,correct_answer,subject_id)
value 	("Cho các chất sau: hoa đào, hoa mai, con người, cây cỏ, quần áo…Hãy cho biết vật nào là nhân tạo?","Hoa đào","Cây cỏ","Quần áo","Tất cả đáp án trên", "Quần áo", 3)
		,("Chọn đáp án đúng nhất","Nước cất là chất tinh khiết.","Chỉ có 1 cách để biết tính chất của chất","Vật thể tự nhiên là do con người tạo ra","Nước mưa là chất tinh khiết", "Nước cất là chất tinh khiết.", 3)
		,("Điền từ còn thiếu vào chỗ trống “Cao su là chất…., có tính chất đàn hồi, chịu được ăn mòi nên được dùng chế tạo lốp xe”","Thấm nước","Không thấm nước","Axit","Muối", "Không thấm nước", 3)
		,("Điền từ thích hợp vào chỗ trống “ Thủy ngân là kim loại nặng có ánh bạc, có dạng ... (1) ở nhiệt độ thường. Thủy ngân thường được sử dụng trong ... (2) ... (3) và các thiết bị khoa học khác.”","(1) rắn (2) nhiệt độ (3) áp kế","(1) lỏng (2) nhiệt kế (3) áp kế","(1) khí (2) nhiệt kế (3) áp suất","3 đáp án trên", "(1) lỏng (2) nhiệt kế (3) áp kế", 3)
		,("Trong các cụm từ được in đậm và đánh số có trong các câu sau, cụm từ nào dùng sai?
“Thủy tinh, đôi khi trong dân gian còn được gọi là kính hay kiếng, là một chất lỏng (1) vô định hình đồng nhất, có gốc silicat, thường được pha trộn thêm các tạp chất để có vật chất (2) theo ý muốn.
Thân mía gồm các vật thể (3): đường (tên hóa học là saccarozơ (4)), nước, xenlulozơ…”","(1), (2), (4)","(1), (2), (3)","(2), (3), (4)","(1), (2), (3), (4)", "(1), (2), (3)", 3)
		,("Chất tinh khiết là chất","Chất lẫn ít tạp chất","Chất không lẫn tạp chất","Chất lẫn nhiều tạp chất","Có tính chất thay đổi", "Chất không lẫn tạp chất", 3)
		,("Chất nào sau đây được coi là tinh khiết","Nước cất","Nước mưa","Nước lọc","Đồ uống có gas", "Nước cất", 1)
		,("Tính chất nào sau đây có thể quan sát được mà không cần đo hay làm thí nghiệm để biết?","Tính tan trong nước","Khối lượng riêng","Màu sắc","Nhiệt độ nóng chảy", "Màu sắc", 3)
		,("Cách hợp lí để tách nước ra khỏi dầu hỏa là","Lọc.","Chiết.","Cô cạn.","Đông đặc.", "Chiết.", 3)
		,("Vật thể tự nhiên là","Con bò","Điện thoại","Ti vi","Bàn là", "Con bò", 3);
 
 
-- insert đề tin 
  insert into question (description,answer1,answer2 ,answer3,answer4,correct_answer,subject_id)
value 	 ("Thông tin có thể giúp cho con người:", "Nắm được quy luật của tự nhiên và do đó trở nên mạnh mẽ hơn.","Hiểu biết về cuộc sống và xã hội xung quanh.",
			"Biết được các tin tức và sự kiện xảy ra trong xã hội.","Tất cả các khẳng định trên đều đúng.", "Tất cả các khẳng định trên đều đúng.", 4),
			("Chúng ta gọi dữ liệu hoặc lệnh được nhập vào máy tính là:", " Dữ liệu được lưu trữ.","Thông tin vào.","Thông tin ra.","Thông tin máy tính.", "Thông tin máy tính.", 4),
            ("Em là sao đỏ của lớp. Theo em, thông tin nào dưới đây không phải là thông tin cần xử lí ( thông tin vào ) để xếp loại các tổ cuối tuần?", " Số lượng điểm 10.","Số các bạn bị ghi tên vì đi muộn.","Số bạn mặc áo xanh.","Số bạn bị cô giáo nhắc nhở.", "Số lượng điểm 10.", 4),
            ("Nghe bản tin dự báo thời tiết “Ngày mai trời có thể mưa”, em sẽ xử lý thông tin và quyết định như thế nào (thông tin ra) ?", " Mặc đồng phục.","Đi học mang theo áo mưa.","Ăn sáng trước khi đến trường.","Hẹn bạn Trang cùng đi học.", "Đi học mang theo áo mưa.", 4),
            ("Tai người bình thường có thể tiếp nhận thông tin nào dưới đây:", " Tiếng chim hót;","Đi học mang theo áo mưa;","Ăn sáng trước khi đến trường;","Hẹn bạn Hương cùng đi học.", "Tiếng chim hót;", 4),
            ("Mắt thường không thể tiếp nhận thông tin nào dưới đây?", " Đàn kiến đang “tấn công” lọ đường quên đậy nắp;","Những con vi trùng gây bệnh lị lẫn trong thức ăn bị ôi thiu;","Rác bẩn vứt ngoài hành lang lớp học;","Bạn Phương quên không đeo khăn quàng đỏ.", "Bạn Phương quên không đeo khăn quàng đỏ.", 4),
            ("Trước khi sang đường theo em, con người cần phải xử lý những thông tin gì?", " Quan sát xem có phương tiện giao thông đang đến gần không;","Nghĩ về bài toán hôm qua trên lớp chưa làm được;","Quan sát xem đèn tín hiệu giao thông đang bật màu gì;","Kiểm tra lại đồ dùng học tập đã có đủ trong cặp sách chưa;", "Nghĩ về bài toán hôm qua trên lớp chưa làm được;", 4),
            ("Em cần nấu một nồi cơm. Hãy xác định những thông tin nào cần xử lý?", " Kiểm tra gạo trong thùng còn không;","Nước cho vào nồi đã đủ chưa;","Bếp nấu đã chuẩn bị sẵn sàng chưa;","Tất cả các thông tin trên.", "Tất cả các thông tin trên.", 4),
            ("Một trong những nhiệm vụ chính của tin học là:", " Nghiên cứu giải các bài toán trên máy tính;","Nghiên cứu chế tạo các máy tính với nhiều tính năng ngày càng ưu việt hơn;","Nghiên cứu việc thực hiện các hoạt động thông tin một cách tự động nhờ sự trợ giúp của máy tính điện tử;","Biểu diễn các thông tin đa dạng trong máy tính.", "Nghiên cứu việc thực hiện các hoạt động thông tin một cách tự động nhờ sự trợ giúp của máy tính điện tử;", 4),
            ("Hoạt động thông tin là:", " Tiếp nhận thông tin;","Xử lí, lưu trữ thông tin;","Truyền (trao đổi) thông tin;","Tất cả các đáp án trên.", "Tất cả các đáp án trên.", 4);
 
 
 -- insert exam
	insert into exam  value 
     (1, 1, "15", "Toán 1")
    ,(2, 2, "15", "Lý 1")
    ,(3, 3, "14", "Hóa 1")
    ,(4, 4, "13", "Tin 1")
    ,(5, 1, "15", "Toán 2")
    ,(6, 2, "15", "Lý 2")
    ,(7, 3, "14" ,"Hóa 2")
    ,(8, 4, "13", "Tin 2");
    
 
-- insert exam_question
	insert into exam_question value   (1 , 11) , (1 ,12) , (1 , 13) , (1 ,14) , (1 , 15)
									, (2 ,1) , (2 , 2) , (2 ,3) , (2, 4) , (2, 5)
                                    , (3 , 21) , (3 ,22) , (3 , 23) , (3 ,24) , (3 , 25)
                                    , (4 , 31) , (4 , 32) , (4 ,33) , (4 , 34) , (4 ,35)
                                    , (5 , 16) , (5 ,17) , (5 , 18) , (5 ,19) , (5 , 20)
									, (6 ,6) , (6 , 7) , (6 ,8) , (6, 9) , (6, 10)
                                    , (7 , 26) , (7 ,27) , (7 , 25) , (7 ,29) , (7 , 30)
                                    , (8 , 36) , (8 , 37) , (8 ,38) , (8 , 39) , (8 ,40);
-- insert assignment 
insert into assignment (user_id, exam_id, starting_time, completion_time, `point`) 
	value 	 (1, 1, '2022-02-02 12:00:00', '2022-02-02 13:00:00', 80)
			,(1, 2, '2022-02-03 12:00:00', '2022-02-03 13:00:00', 75)
            ,(2, 1, '2022-02-04 12:00:00', '2022-02-04 13:00:00', 90)
            ,(2, 2, '2022-02-03 12:00:00', '2022-02-03 13:00:00', 80);
            
            
            insert into assignment (user_id, exam_id, starting_time, completion_time, `point`) 
	value 	 (3, 1, '2022-02-02 12:00:00', '2022-02-02 13:00:00', 100)
			,(3, 2, '2022-02-03 12:00:00', '2022-02-03 13:00:00', 100)
            ,(3, 1, '2022-02-04 12:00:00', '2022-02-04 13:00:00', 100)
            ,(3, 2, '2022-02-03 12:00:00', '2022-02-03 13:00:00', 100);
            
-- insert accumulated_point
insert into accumulated_point (user_id, accumulated_point) 
value ( 1 , 155), 
		(2,170),
		(3, 100),
		(5,	125),
		(7,	200),
		(9,	160),
		(11, 150),
		(13, 180),
		(15, 130);



