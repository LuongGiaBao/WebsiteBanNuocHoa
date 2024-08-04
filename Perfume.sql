CREATE DATABASE Perfume
USE Perfume

-- TẠO BẢNG
create table admin (
	id int IDENTITY(1,1) PRIMARY KEY,
	username nvarchar(50) UNIQUE not null,
	password nvarchar(50) not null,
	name nvarchar(50) not null
)

insert into admin values ('admin', '123456', N'Nguyễn Lâm')

create table users (
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50) not null,
	email nvarchar(50) UNIQUE not null,
	phone nvarchar(20) not null,
	username nvarchar(50) UNIQUE not null,
	password nvarchar(50) not null,
	created date not null
)


create table catalog
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50) not null,
	parent_id int null
)


Create table product (
	id int IDENTITY(1,1) PRIMARY KEY,
	catalog_id int not null foreign key references catalog(id) on delete cascade,
	name nvarchar(50) not null,
	price nvarchar(20) not null,
	status int not null,
	description nvarchar(4000) not null,
	content nvarchar(4000) not null,
	discount int,
	image_link nvarchar(4000) not null,
	created date not null,  
)


create table review 
(
	id int IDENTITY(1,1) primary key,
	product_id int not null foreign key references product(id) on delete cascade,
	name nvarchar(50) not null,
	email nvarchar(50) not null,
	content nvarchar(4000) not null,
	created date ,
)


create table transactions
(
	id int IDENTITY(1,1) primary key,
	user_session nvarchar(50) not null,
	user_name nvarchar(50) not null,
	user_mail nvarchar(50) not null,
	user_phone nvarchar(20) not null,
	address nvarchar(300) not null,
	message nvarchar(4000) not null,
	amount nvarchar(20) not null,
	payment nvarchar(30) not null,
	status nvarchar(30),
	created date not null
);


create table ordered
(
	id int IDENTITY(1,1) primary key,
	product_id int not null foreign key references product(id) on delete cascade,
	transaction_id int not null foreign key references transactions(id) on delete cascade,
	qty int not null,	
);


create table boardnew
(
	id int IDENTITY(1,1) primary key,
	title nvarchar(200) not null,
	content nvarchar(4000) not null,
	image_link nvarchar(4000) not null,
	author nvarchar(50) not null,
	created date not null,
);



INSERT INTO catalog(name,parent_id) 
	VALUES (N'Nước hoa nam',null);
INSERT INTO catalog(name,parent_id) 
	VALUES (N'Nước hoa nữ',null);
INSERT INTO catalog(name,parent_id) 
	VALUES (N'Nước hoa unisex',null);
INSERT INTO catalog(name,parent_id) 
	VALUES (N'Body Mist ',null);
INSERT INTO catalog(name,parent_id) 
	VALUES (N'Sản Phẩm Mới',null);
INSERT INTO catalog(name,parent_id) 
	VALUES (N'Sản Phẩm Bán Chạy',null)
INSERT INTO catalog(name,parent_id) 
	VALUES (N'Sản Phẩm Giảm Giá',null);


insert into product values (1,N'JEAN PAUL LE BEAU LE PARFUM','3.450.000','1',N'Jean Paul Gaultier',N'Độ lưu hương:Lâu - 6 đến 8 tiếng. Giới tính: Nam. Nhóm hương: Hương gỗ Phương Đông. Nồng độ: EDP (Eau de parfum). Phong cách: Mạnh mẽ, Tinh tế, Trẻ trung.  Dung tích:125 ml.',0,'Jean_Paul_Le_Beau_Le_Parfum.jpg','2023-09-27')
insert into product values (1,N'JEAN PAUL GAULTIER LE BEAU EDT','2.900.000','1',N'Jean Paul Gaultier',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nam. Nhóm hương: Hương gỗ thơm. Nồng độ: EDT(Eau de toilette). Phong cách: Lịch lãm, Mạnh mẽ, Nam tính. Dung tích: 125 ml, 7 ml.',0,'Jean_Paul_Gaultier_Le_Beau_EDT.jpg','2023-09-27')
insert into product values (1,N'JEAN PAUL LE BEAU LE MALE ON BOARD EDT','3.250.000','1',N'Jean Paul Gaultier',N'Độ lưu hương: Tạm ổn - 3 đến 6 tiếng. Giới tính: Nam. Nhóm hương: Hương dương xỉ phương đông. Nồng độ: EDT (Eau de toilette). Phong cách: Nam tính, Năng động, Trẻ trung. Dung tích: 125 ml.',0,'Jean_Paul_Le_Beau_Le_Male_On_Board_EDT.jpg','2023-09-27')
insert into product values (1,N'JEAN PAUL GAULTIER ULTRA MALE INTENSE EDT','2.900.000','1',N'Jean Paul Gaultier',N'Độ lưu hương: Rất lâu - 8 đến 12 tiếng. Giới tính: Nam. Nhóm hương: Hương gỗ thơm. Nồng độ: EDT(Eau de toilette). Phong cách: Lịch lãm, Mạnh mẽ, Nam tính. Dung tích: 125 ml.',0,'Jean_Paul_Gaultier_Ultra_Male_Intense_EDT.jpg','2023-09-27')
insert into product values (1,N'JEAN PAUL GAULTIER SCANDAL POUR HOMME EDT','3.200.000','1',N'Jean Paul Gaultier',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nam. Nhóm hương: Hương gỗ thơm. Nồng độ: EDT(Eau de toilette). Phong cách: Nam tính, Quyến rũ, Táo bạo. Dung tích: 100 ml.',0,'Jean_Paul_Gaultier_Scandal_Pour_Homme_EDT.jpg','2023-09-27')
Insert into product values (1,N'JO MALONE STAR MAGNOLIA EAU DE COLOGNE','2.950.000','1',N'Jo Malone',N'Độ lưu hương: Tạm ổn - 4 đến 6 tiếng. Giới tính: Nam. Nhóm hương: Hương cỏ xanh tự nhiên. Nồng độ: Cologne. Phong cách: Lôi cuốn, nhẹ nhàng, tinh tế. Dung tích: 100 ml.',0,'Jo_Malone_Star_Magnolia_Eau_De_Cologne.jpg','2023-09-27')
Insert into product values (1,N'BURBERRY HERO EDT','2.800.000','1',N'Burberry',N'Độ lưu hương: Tạm ổn - 4 đến 6 tiếng. Giới tính: Nam. Nhóm hương: Hương gỗ thơm. Nồng độ: EDT(Eau de toilette). Phong cách: Cuốn hút, Mạnh mẽ, Nam tính, Phóng khoáng. Dung tích: 100 ml.',0,'Burberry_Hero_EDT.jpg','2023-09-27')
Insert into product values (1,N'GIORGIO ARMANI ACQUA DI GIO PARFUM','3.250.000','1',N'Giorgio Armani',N'Độ lưu hương: Rất lâu - 8 đến 12 tiếng. Giới tính: Nam. Nhóm hương: Hương gỗ biến. Nồng độ: Parfum. Phong cách: Cuốn hút, Lịch lãm, Mạnh mẽ, Nam tính. Dung tích: 100 ml.',0,'Giorgio_Armani_Acqua_Di_Gio_Parfum.jpg','2023-09-27')
insert into product values (2,N'JEAN PAUL GAULTIER SCANDAL GOLD','2.780.000','1',N'Jean Paul Gaultier',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nữ. Nhóm hương: Hương Síp. Nồng độ: EDT(Eau de parfum). Phong cách: Gợi cảm, Nữ tính, Sang trọng. Dung tích: 80 ml.',0,'Jean_Paul_Gaultier_Scandal_Gold.jpg','2023-09-27')
insert into product values (2,N'GIORGIO ARMANI MY WAY FLORAL EDP','2.780.000','1',N'Giorgio Armani',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nữ. Nhóm hương: Hương hoa cỏ Phương Đông. Nồng độ: EDP(Eau de parfum). Phong cách: Gợi cảm, Nữ tính, Sang trọng. Dung tích: 90 ml.',0,'Giorgio_Armani_Ny_Way_Floral_EDP.jpg','2023-09-27')
insert into product values (2,N'MFK A LA ROSE EDP','5.960.000','1',N'Maison Francis Kukdjian',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Nữ. Nhóm hương: Hương hoa cỏ. Nồng độ: EDP(Eau de parfum). Phong cách: Dịu dàng, Sang trọng, Tươi mát. Dung tích: 70 ml.',0,'MFK_A_La_Rose_EDP.jpg','2023-09-27')
insert into product values (2,N'VALENTINO DONNA BORN IN ROMA YELLOW DREAM','2.730.000','1',N'Valentino',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Nữ. Nhóm hương: Hương hoa cỏ. Nồng độ: EDT(Eau de parfum). Phong cách: Hiện đại, Ngọt ngào, quyến rũ. Dung tích: 50 ml.',0,'Valentino_Donna_Born_In_Roma_Yellow_Dream.jpg','2023-09-27')
insert into product values (2,N'HERMES TWILLY EAU GINGER EDP','2.840.000','1',N'Hermes',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Nữ. Nhóm hương: Hương gỗ xạ hương. Nồng độ: EDT(Eau de parfum). Phong cách: Năng động, Trẻ trung, Tươi mát. Dung tích: 80 ml.',0,'Hermes_Twilly_Eau_Ginger_EDP.jpg','2023-09-27')
insert into product values (2,N'VERSACE DYLAN TURQUOISE POUR FEMME EDT','2.900.000','1',N'Versace',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Nữ. Nhóm hương: Hương cỏ, trái cây. Nồng độ: EDT(Eau de toilette). Phong cách: Nữ tính, Thanh lịch, Tinh tế. Dung tích: 80 ml.',0,'Versace_Dylan_Turquoise_Pour_Feeme_EDT.jpg','2023-09-27')
insert into product values (2,N'LANCOME LA NUIT TRESOR A LA FOLIE EDP','2.730.000','1',N'Versace',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Nữ. Nhóm hương: Hương hổ phách, vanilla. Nồng độ: EDP(Eau de parfum). Phong cách: Nữ tính, Cuốn hút, Quyến rũ. Dung tích: 75 ml.',0,'Lancome_La_Nuit_Tresor_A_La_Folie_EDP.jpg','2023-09-27')
insert into product values (2,N'SALVATORE FERRAGAMO SIGNORINA ELEGANZA EDP','1.850.000','1',N'Salvatore Ferragamo',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Nữ. Nhóm hương: Hương hoa cỏ Síp. Nồng độ: EDP(Eau de parfum). Phong cách: Gợi cảm, Cuốn hút, Quyến rũ. Dung tích: 75 ml.',0,'Salvatore_Ferragamo_Signorina_Eleganz_EDP.jpg','2023-09-27')
insert into product values (3,N'JLOUIS VUITTON CITY OF STARS','8.750.000','1',N'Louis Vuitton',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Unisex. Nhóm hương: Hương hoa cỏ, trái cây. Phong cách: Tinh tế, Trẻ trung, Tươi mát. Dung tích: 100 ml.',0,'Louis_Vuitton_City_Of_Stars.jpg','2023-09-27')
insert into product values (3,N'BYREDO MOJAVE GHOST EDP','5.240.000','1',N'Byredo',N'Độ lưu hương: Lâu- 6 đến 8 tiếng. Giới tính: Unisex. Nhóm hương: Hương hổ phách. Nồng độ: EDP(Eau de parfum). Phong cách: Sang trọng, Trẻ trung, Tươi mới. Dung tích: 100 ml.',0,'Byredo_Mojave_Ghost_EDP.jpg','2023-09-27')
insert into product values (3,N'ATTAR COLLECTION MUSK KASHMIR EDP','2.250.000','1',N'Attar Collection',N'Độ lưu hương: Lâu- 6 đến 8 tiếng. Giới tính: Unisex. Nhóm hương: Hương hoa cỏ - xạ hương. Nồng độ: EDP(Eau de parfum). Phong cách: Hiện đại, Nhẹ nhàng, Thanh Lịch. Dung tích: 100 ml.',0,'Attar_Collection_Musk_Kashmir_EDP.jpg','2023-09-27')
insert into product values (3,N'TOM FORD FOUGERE DARGENT EDP','3.250.000','1',N'Tom Ford',N'Độ lưu hương: Lâu- 6 đến 8 tiếng. Giới tính: Unisex. Nhóm hương: Hương dương xỉ phương Đông. Nồng độ: EDP(Eau de parfum). Phong cách: Sang trọng, Thu hút, Tinh tế. Dung tích: 70 ml.',0,'Tom_Ford_Fougere_Dargent_EDP.jpg','2023-09-27')
insert into product values (3,N'HERMÈS L’OMBRE DES MERVEILLES','2.450.000','1',N'Tom Ford',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Unisex. Nhóm hương: Hương gỗ phách. Nồng độ: EDP(Eau de parfum). Phong cách: Bí ẩn, Đẳng cấp, Phóng khoáng. Dung tích: 50 ml.',0,'Hermes_L’ombre_Des_Merveilles.jpg','2023-09-27')
insert into product values (3,N'CREED SILVER MOUNTAIN WATER','6.300.000','1',N'Creed',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Unisex. Nhóm hương: Hương cam chanh. Nồng độ: EDP(Eau de parfum). Phong cách: Thanh lịch, Đẳng cấp, Tinh tế. Dung tích: 100 ml.',0,'Creed_Silver_Mountain_Water.jpg','2023-09-27')
insert into product values (3,N'KILIAN VODKA ON THE ROCKS','5.560.000','1',N'Khác',N'Độ lưu hương: Tạm ổn- 4 đến 6 tiếng. Giới tính: Unisex. Nhóm hương: Hương cam chanh. Nồng độ: EDP(Eau de parfum). Phong cách: Cá , Đẳng cấp, Cuốn hút Dung tích: 50 ml.',0,'Kilian_Vodka_On_The_Rocks.jpg','2023-09-27')
insert into product values (3,N'LATTAFA BADEE AL OUD AMETHYST EDP','1.350.000','1',N'Lattafa',N'Độ lưu hương: Lâu- 6 đến 8 tiếng. Giới tính: Unisex. Nhóm hương: Hương gỗ phương Đông. Nồng độ: EDP(Eau de parfum). Phong cách: Ấm áp, Lôi cuốn, Ngọt ngào. Dung tích: 100 ml.',0,'Lattafa_Badee_Al_Oud_Amethyst_EDP.jpg','2023-09-27')
insert into product values (4,N'Xịt Thơm Body Victoria Secret - Pure SeducTion','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Pure_SeducTion.jpg','2023-09-27')
insert into product values (4,N'Xịt Thơm Body Victoria Secret - Veltet Petals','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Veltet_Petals.jpg','2023-09-27')
insert into product values (4,N'Xịt Thơm Body Victoria Secret - Pastel Sugar Sky','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Pastel_Sugar_Sky.jpg','2023-09-27')
insert into product values (4,N'Xịt Thơm Body Victoria Secret - Love Spell','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Love_Spell.jpg','2023-09-27')
insert into product values (4,N'Xịt Thơm Body Victoria Secret - Berry Santal','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Berry_Santal.jpg','2023-09-27')
insert into product values (4,N'Xịt Thơm Body Victoria Secret - Aqua Kiss','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Aqua_Kiss.jpg','2023-09-27')
insert into product values (5,N'Xịt Thơm Body Victoria Secret - Bare Vanilla','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Bare_Vanilla.jpg','2023-09-27')
insert into product values (5,N'Xịt Thơm Body Victoria Secret - Love Spell Golden','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Love_Spell_.jpg','2023-09-27')
insert into product values (5,N'Xịt Thơm Body Victoria Secret - Warm Horizon','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Warm_Horizon.jpg','2023-09-27')
insert into product values (5,N'Xịt Thơm Body Victoria Secret - Merlot Pear','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Merlot_Pear.jpg','2023-09-27')
insert into product values (5,N'Xịt Thơm Body Victoria Secret - Flower Sorbet','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Flower_Sorbet.jpg','2023-09-27')
insert into product values (6,N'Xịt Thơm Body Victoria Secret - Palm Lagoon','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Palm_Lagoon.jpg','2023-09-27')
insert into product values (6,N'Xịt Thơm Body Victoria Secret - Love Spell Heat','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Love_Spell_Heat.jpg','2023-09-27')
insert into product values (6,N'Xịt Thơm Body Victoria Secret - Floral Bloom','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Floral_Bloom.jpg','2023-09-27')
insert into product values (6,N'Xịt Thơm Body Victoria Secret - Royal Forest','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Royal_Forest.jpg','2023-09-27')
insert into product values (6,N'Xịt Thơm Body Victoria Secret - Passion Flower','295.000','1',N'Victoria Secret',N'Lưu hương: 2 tiếng, Xuất xứ: Mỹ',0,'Body_Mist_Passion_Flower.jpg','2023-09-27')
insert into product values (7,N'VICTORIA’S SECRET BOMBSHELL NIGHTS EDP','3.780.000','1',N'Victoria Secret',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nữ. Nhóm hương: Hương hoa cỏ Phương Đông. Nồng độ: EDP(Eau de parfum). Phong cách: Gợi cảm, Lôi cuốn, Quyến rũ. Dung tích: 100 ml.',10,'Victoria_Secret_Bombshell_Nights_EDP.jpg','2023-09-27')
insert into product values (7,N'LE LABO BERGAMOTE 22 EDP','5.990.000','1',N'Le Labo',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nữ. Nhóm hương: Hương gỗ thơm. Nồng độ: EDP(Eau de parfum). Phong cách: Cuốn hút, Mát mẻ, Sang trọng. Dung tích: 90 ml.',10,'Le_Labo_Bergamote_22_EDP.jpg','2023-09-27')
insert into product values (7,N'DSQUARED2 GREEN WOOD EDT','7.790.000','1',N'Dsquared2',N'Độ lưu hương: Rất lâu - 8 đến 12 tiếng. Giới tính: Nam. Nhóm hương: Hương thơm thảo mộc. Nồng độ: EDP(Eau de parfum). Phong cách: Cuốn hút, Mạnh mẽ, Nam tính, Say . Dung tích: 100 ml.',10,'Dsquared2_Green_Wood_EDT.jpg','2023-09-27')
insert into product values (7,N'YSL LIBRE L ABSOLU PLATINE','4.780.000','1',N'Yves Saint Laurent',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nữ. Nhóm hương: Hương hoa cỏ Phương Đông. Nồng độ: EDP(Eau de parfum). Phong cách: Gợi cảm, Ngọt ngào, Sang trọng. Dung tích: 90 ml.',10,'YSL_Libre_L_Absolu_Platine.jpg','2023-09-27')
insert into product values (7,N'VALENTINO UOMO EDITION NOIRE EDT','2.870.000','1',N'Valentino',N'Độ lưu hương: Lâu - 6 đến 8 tiếng. Giới tính: Nữ. Nhóm hương: Hương hổ phách. Nồng độ: EDP(Eau de parfum). Phong cách: Cổ điển, Thanh lịch. Dung tích: 100 ml.',10,'Valentino_Uomo_Edition_Noire.jpg','2023-09-27')

Insert into boardnew(title, content, image_link, author, created) values (N'Nước hoa hương rũ nhất ', N'Nước hoa vẫn luôn là người bạn đồng hành thân thiết của chúng ta từ hàng thế kỷ qua. Để lựa chọn được những mùi hương nước hoa nữ phù hợp và thu hút được ánh nhìn của phái mạnh, cùng tham khảo qua 5 mùi hương tinh tế này nhé! <br> <br>1.Dior Diorissimo: Từ những năm 1950, nhà Dior đã cho ra đời dòng nước hoa cổ điển này, với hương chủ đạo là hoa linh lan (lily of the valley). Đây là sản phẩm kết hợp giữa Dior và nhà thiết kế người Pháp Edmond Roudnitska từ năm 1956.Mùi hương của loại nước hoa này được ví như hương thơm của một buổi sáng trong trẻo, ngọt ngào. Khả năng lưu hương trong khoảng 3 giờ đến 6 giờ. Lan tỏa trong nước hoa Dior nữ này là sự bùng nổ của những nốt hương tinh tế và say lòng những người yêu cái đẹp. <br> <br>2.Chanel No5 EDP: Với sự hấp dẫn vốn có của hoa hồng, thương hiệu Chanel đã cho ra đời sản phẩm Chanel No5 EDP và được xem là một biểu tượng thành công trong lĩnh vực nước hoa. Đây chính là loại nước hoa nổi tiếng nhất kinh đô thời trang Paris.Với độ lưu hương từ 7 giờ đến 12 giờ, nó đã vượt xa khỏi phạm vi một mùi hương nước hoa đơn thuần từ sự kết hợp độc đáo giữa hoa hồng, hoa nhài, vani. Loại nước hoa này toát lên mùi hương quyến rũ và đậm đà, như chính bản chất của loài hoa hồng chủ đạo. <br> <br>3. Tom Ford Orchid Soleil EDPVanilla: nổi tiếng với hương thơm thuần khiết ngọt ngào, được công nhận là một trong những mùi hương quyến rũ nhất hành tinh. Nhà Tom Ford đã cho ra đời dòng nước hoa Tom Ford Orchid Soleil EDP với mùi hương mê hoặc và rực rỡ nhưng không kém phần ngọt ngào, được ví von là mùi hương khép lại mùa hè. Hương thơm Orchid Soleil là sự nắm bắt những ánh nắng rực rỡ, chói chang nhất của vùng phương đông khắc nghiệt. Khả năng lưu hương của nước hoa này có thể lên đến 12 giờ và độ tỏa hương rất xa nên được rất nhiều khách hàng ưa thích sử dụng. Thêm một điểm cộng là thiết kế sang trọng và bắt mắt làm biểu trưng cho sự sành điệu và năng động.<br> <br>4. Creed Original Vetiver: Vetiver có lẽ còn khá xa lạ đối với nhiều người, nhưng nếu bạn là người am hiểu và mùi hương, chắc hẳn bạn sẽ nhận biết được khi ngửi qua. Creed Original Vetiver tỏa ra một màu xanh ngọc vừa mộng mị lại vừa cuốn hút đến lạ thường, với sự hòa quyện giữa vị tươi mát mà nhẹ nhàng, sảng khoái. Dưới cái tên “Original Vetiver” – Nhà Creed đã thành công trong việc tạo ra hương thơm nguyên gốc từ Cỏ hương bài đưa vào trong chai nước hoa của mình vào năm 2004. Khả năng lưu hương của nước hoa này từ 7 giờ đến 12 giờ.<br> <br>5.  Narciso Rodriguez for Her Eau de Parfum: Narciso Rodriguez for Her Eau de Parfum, ra mắt vào năm 2006 và luôn nằm trong top đầu danh sách những chai nước hoa bán chạy nhất của nhà Narciso cho đến tận bây giờ. Mùi hương này được yêu thích từ phái đẹp đến phái mạnh trên toàn thế giới vì sự quyến rũ của Xạ hương, khơi gợi sự gần gũi và ngọt ngào.Cả chai nước hoa hài hòa bằng màu hồng nhã nhặn, ngọt ngào. Cùng với tông mùi dịu dàng, dễ chịu bên trong, khả năng lưu hương lâu và tỏa hương vừa phải. Mùi hương này là lựa chọn tốt cho một buổi hẹn hò lãng mạn. <br> <br>', 'Blog1.jpg', N'Bảo Lương', '2023-01-03');
Insert into boardnew(title, content, image_link, author, created) values (N'Nước hoa thu hút mọi ánh nhìn ', N'Nước hoa vẫn luôn là người bạn đồng hành thân thiết của chúng ta từ hàng thế kỷ qua. Để lựa chọn được những mùi hương nước hoa nữ phù hợp và thu hút được ánh nhìn của phái mạnh, cùng tham khảo qua 5 mùi hương tinh tế này nhé! <br> <br>1.Dior Diorissimo: Từ những năm 1950, nhà Dior đã cho ra đời dòng nước hoa cổ điển này, với hương chủ đạo là hoa linh lan (lily of the valley). Đây là sản phẩm kết hợp giữa Dior và nhà thiết kế người Pháp Edmond Roudnitska từ năm 1956.Mùi hương của loại nước hoa này được ví như hương thơm của một buổi sáng trong trẻo, ngọt ngào. Khả năng lưu hương trong khoảng 3 giờ đến 6 giờ. Lan tỏa trong nước hoa Dior nữ này là sự bùng nổ của những nốt hương tinh tế và say lòng những người yêu cái đẹp. <br> <br>2.Chanel No5 EDP: Với sự hấp dẫn vốn có của hoa hồng, thương hiệu Chanel đã cho ra đời sản phẩm Chanel No5 EDP và được xem là một biểu tượng thành công trong lĩnh vực nước hoa. Đây chính là loại nước hoa nổi tiếng nhất kinh đô thời trang Paris.Với độ lưu hương từ 7 giờ đến 12 giờ, nó đã vượt xa khỏi phạm vi một mùi hương nước hoa đơn thuần từ sự kết hợp độc đáo giữa hoa hồng, hoa nhài, vani. Loại nước hoa này toát lên mùi hương quyến rũ và đậm đà, như chính bản chất của loài hoa hồng chủ đạo. <br> <br>3. Tom Ford Orchid Soleil EDPVanilla: nổi tiếng với hương thơm thuần khiết ngọt ngào, được công nhận là một trong những mùi hương quyến rũ nhất hành tinh. Nhà Tom Ford đã cho ra đời dòng nước hoa Tom Ford Orchid Soleil EDP với mùi hương mê hoặc và rực rỡ nhưng không kém phần ngọt ngào, được ví von là mùi hương khép lại mùa hè. Hương thơm Orchid Soleil là sự nắm bắt những ánh nắng rực rỡ, chói chang nhất của vùng phương đông khắc nghiệt. Khả năng lưu hương của nước hoa này có thể lên đến 12 giờ và độ tỏa hương rất xa nên được rất nhiều khách hàng ưa thích sử dụng. Thêm một điểm cộng là thiết kế sang trọng và bắt mắt làm biểu trưng cho sự sành điệu và năng động.<br> <br>4. Creed Original Vetiver: Vetiver có lẽ còn khá xa lạ đối với nhiều người, nhưng nếu bạn là người am hiểu và mùi hương, chắc hẳn bạn sẽ nhận biết được khi ngửi qua. Creed Original Vetiver tỏa ra một màu xanh ngọc vừa mộng mị lại vừa cuốn hút đến lạ thường, với sự hòa quyện giữa vị tươi mát mà nhẹ nhàng, sảng khoái. Dưới cái tên “Original Vetiver” – Nhà Creed đã thành công trong việc tạo ra hương thơm nguyên gốc từ Cỏ hương bài đưa vào trong chai nước hoa của mình vào năm 2004. Khả năng lưu hương của nước hoa này từ 7 giờ đến 12 giờ.<br> <br>5.  Narciso Rodriguez for Her Eau de Parfum: Narciso Rodriguez for Her Eau de Parfum, ra mắt vào năm 2006 và luôn nằm trong top đầu danh sách những chai nước hoa bán chạy nhất của nhà Narciso cho đến tận bây giờ. Mùi hương này được yêu thích từ phái đẹp đến phái mạnh trên toàn thế giới vì sự quyến rũ của Xạ hương, khơi gợi sự gần gũi và ngọt ngào.Cả chai nước hoa hài hòa bằng màu hồng nhã nhặn, ngọt ngào. Cùng với tông mùi dịu dàng, dễ chịu bên trong, khả năng lưu hương lâu và tỏa hương vừa phải. Mùi hương này là lựa chọn tốt cho một buổi hẹn hò lãng mạn. <br> <br>', 'Blog2.jpg', N'Hiếu Phạm', '2023-01-03');
Insert into boardnew(title, content, image_link, author, created) values (N'Các dòng nước hoa quý phái ', N'Nước hoa vẫn luôn là người bạn đồng hành thân thiết của chúng ta từ hàng thế kỷ qua. Để lựa chọn được những mùi hương nước hoa nữ phù hợp và thu hút được ánh nhìn của phái mạnh, cùng tham khảo qua 5 mùi hương tinh tế này nhé! <br> <br>1.Dior Diorissimo: Từ những năm 1950, nhà Dior đã cho ra đời dòng nước hoa cổ điển này, với hương chủ đạo là hoa linh lan (lily of the valley). Đây là sản phẩm kết hợp giữa Dior và nhà thiết kế người Pháp Edmond Roudnitska từ năm 1956.Mùi hương của loại nước hoa này được ví như hương thơm của một buổi sáng trong trẻo, ngọt ngào. Khả năng lưu hương trong khoảng 3 giờ đến 6 giờ. Lan tỏa trong nước hoa Dior nữ này là sự bùng nổ của những nốt hương tinh tế và say lòng những người yêu cái đẹp. <br> <br>2.Chanel No5 EDP: Với sự hấp dẫn vốn có của hoa hồng, thương hiệu Chanel đã cho ra đời sản phẩm Chanel No5 EDP và được xem là một biểu tượng thành công trong lĩnh vực nước hoa. Đây chính là loại nước hoa nổi tiếng nhất kinh đô thời trang Paris.Với độ lưu hương từ 7 giờ đến 12 giờ, nó đã vượt xa khỏi phạm vi một mùi hương nước hoa đơn thuần từ sự kết hợp độc đáo giữa hoa hồng, hoa nhài, vani. Loại nước hoa này toát lên mùi hương quyến rũ và đậm đà, như chính bản chất của loài hoa hồng chủ đạo. <br> <br>3. Tom Ford Orchid Soleil EDPVanilla: nổi tiếng với hương thơm thuần khiết ngọt ngào, được công nhận là một trong những mùi hương quyến rũ nhất hành tinh. Nhà Tom Ford đã cho ra đời dòng nước hoa Tom Ford Orchid Soleil EDP với mùi hương mê hoặc và rực rỡ nhưng không kém phần ngọt ngào, được ví von là mùi hương khép lại mùa hè. Hương thơm Orchid Soleil là sự nắm bắt những ánh nắng rực rỡ, chói chang nhất của vùng phương đông khắc nghiệt. Khả năng lưu hương của nước hoa này có thể lên đến 12 giờ và độ tỏa hương rất xa nên được rất nhiều khách hàng ưa thích sử dụng. Thêm một điểm cộng là thiết kế sang trọng và bắt mắt làm biểu trưng cho sự sành điệu và năng động.<br> <br>4. Creed Original Vetiver: Vetiver có lẽ còn khá xa lạ đối với nhiều người, nhưng nếu bạn là người am hiểu và mùi hương, chắc hẳn bạn sẽ nhận biết được khi ngửi qua. Creed Original Vetiver tỏa ra một màu xanh ngọc vừa mộng mị lại vừa cuốn hút đến lạ thường, với sự hòa quyện giữa vị tươi mát mà nhẹ nhàng, sảng khoái. Dưới cái tên “Original Vetiver” – Nhà Creed đã thành công trong việc tạo ra hương thơm nguyên gốc từ Cỏ hương bài đưa vào trong chai nước hoa của mình vào năm 2004. Khả năng lưu hương của nước hoa này từ 7 giờ đến 12 giờ.<br> <br>5.  Narciso Rodriguez for Her Eau de Parfum: Narciso Rodriguez for Her Eau de Parfum, ra mắt vào năm 2006 và luôn nằm trong top đầu danh sách những chai nước hoa bán chạy nhất của nhà Narciso cho đến tận bây giờ. Mùi hương này được yêu thích từ phái đẹp đến phái mạnh trên toàn thế giới vì sự quyến rũ của Xạ hương, khơi gợi sự gần gũi và ngọt ngào.Cả chai nước hoa hài hòa bằng màu hồng nhã nhặn, ngọt ngào. Cùng với tông mùi dịu dàng, dễ chịu bên trong, khả năng lưu hương lâu và tỏa hương vừa phải. Mùi hương này là lựa chọn tốt cho một buổi hẹn hò lãng mạn. <br> <br>', 'Blog3.jpg', N'MewLy', '2023-01-03');
Insert into boardnew(title, content, image_link, author, created) values (N'Trở nên thanh lịch hơn nhờ vào nước hoa ', N'Nước hoa vẫn luôn là người bạn đồng hành thân thiết của chúng ta từ hàng thế kỷ qua. Để lựa chọn được những mùi hương nước hoa nữ phù hợp và thu hút được ánh nhìn của phái mạnh, cùng tham khảo qua 5 mùi hương tinh tế này nhé! <br> <br>1.Dior Diorissimo: Từ những năm 1950, nhà Dior đã cho ra đời dòng nước hoa cổ điển này, với hương chủ đạo là hoa linh lan (lily of the valley). Đây là sản phẩm kết hợp giữa Dior và nhà thiết kế người Pháp Edmond Roudnitska từ năm 1956.Mùi hương của loại nước hoa này được ví như hương thơm của một buổi sáng trong trẻo, ngọt ngào. Khả năng lưu hương trong khoảng 3 giờ đến 6 giờ. Lan tỏa trong nước hoa Dior nữ này là sự bùng nổ của những nốt hương tinh tế và say lòng những người yêu cái đẹp. <br> <br>2.Chanel No5 EDP: Với sự hấp dẫn vốn có của hoa hồng, thương hiệu Chanel đã cho ra đời sản phẩm Chanel No5 EDP và được xem là một biểu tượng thành công trong lĩnh vực nước hoa. Đây chính là loại nước hoa nổi tiếng nhất kinh đô thời trang Paris.Với độ lưu hương từ 7 giờ đến 12 giờ, nó đã vượt xa khỏi phạm vi một mùi hương nước hoa đơn thuần từ sự kết hợp độc đáo giữa hoa hồng, hoa nhài, vani. Loại nước hoa này toát lên mùi hương quyến rũ và đậm đà, như chính bản chất của loài hoa hồng chủ đạo. <br> <br>3. Tom Ford Orchid Soleil EDPVanilla: nổi tiếng với hương thơm thuần khiết ngọt ngào, được công nhận là một trong những mùi hương quyến rũ nhất hành tinh. Nhà Tom Ford đã cho ra đời dòng nước hoa Tom Ford Orchid Soleil EDP với mùi hương mê hoặc và rực rỡ nhưng không kém phần ngọt ngào, được ví von là mùi hương khép lại mùa hè. Hương thơm Orchid Soleil là sự nắm bắt những ánh nắng rực rỡ, chói chang nhất của vùng phương đông khắc nghiệt. Khả năng lưu hương của nước hoa này có thể lên đến 12 giờ và độ tỏa hương rất xa nên được rất nhiều khách hàng ưa thích sử dụng. Thêm một điểm cộng là thiết kế sang trọng và bắt mắt làm biểu trưng cho sự sành điệu và năng động.<br> <br>4. Creed Original Vetiver: Vetiver có lẽ còn khá xa lạ đối với nhiều người, nhưng nếu bạn là người am hiểu và mùi hương, chắc hẳn bạn sẽ nhận biết được khi ngửi qua. Creed Original Vetiver tỏa ra một màu xanh ngọc vừa mộng mị lại vừa cuốn hút đến lạ thường, với sự hòa quyện giữa vị tươi mát mà nhẹ nhàng, sảng khoái. Dưới cái tên “Original Vetiver” – Nhà Creed đã thành công trong việc tạo ra hương thơm nguyên gốc từ Cỏ hương bài đưa vào trong chai nước hoa của mình vào năm 2004. Khả năng lưu hương của nước hoa này từ 7 giờ đến 12 giờ.<br> <br>5.  Narciso Rodriguez for Her Eau de Parfum: Narciso Rodriguez for Her Eau de Parfum, ra mắt vào năm 2006 và luôn nằm trong top đầu danh sách những chai nước hoa bán chạy nhất của nhà Narciso cho đến tận bây giờ. Mùi hương này được yêu thích từ phái đẹp đến phái mạnh trên toàn thế giới vì sự quyến rũ của Xạ hương, khơi gợi sự gần gũi và ngọt ngào.Cả chai nước hoa hài hòa bằng màu hồng nhã nhặn, ngọt ngào. Cùng với tông mùi dịu dàng, dễ chịu bên trong, khả năng lưu hương lâu và tỏa hương vừa phải. Mùi hương này là lựa chọn tốt cho một buổi hẹn hò lãng mạn. <br> <br>', 'Blog4.jpg', N'Hoàng Cao', '2023-01-03');


INSERT INTO review(product_id,name,email,content,created) 
	VALUES (3,'Kim Vy','kimvy@gmail.com',N'Rất thơm!','2023-10-16');
INSERT INTO review(product_id,name,email,content,created) 
	VALUES (4,'Lan Trinh','lantrinh@gmail.com',N'Sản phẩm chất lượng','2023-10-16');
INSERT INTO review(product_id,name,email,content,created) 
	VALUES (5,'Sĩ Thanh','sithanh@gmail.com',N'Rất tốt','2023-10-16');