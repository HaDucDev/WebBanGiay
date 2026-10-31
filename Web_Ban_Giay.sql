create database Web_Ban_Giay;
use Web_Ban_Giay;
create table Category
(
id char(10) primary key not null,
name nvarchar(50),
code varchar(50)
);
create table Customer
(
id char(10) primary key not null,
first_name nvarchar(50),
last_name nvarchar(50),
date_birth date,
address nvarchar(50),
city nvarchar(50),
country nvarchar(50),
county_code nvarchar(50),
phone char(30) 
);
create table Account 
(
id char(10) primary key not null,
username nvarchar(50),
password nvarchar(50)
);
create table Product
(
id char(10) primary key not null,
name nvarchar(50) unique,
 price int,
 promotion_id nvarchar(50),
 description nvarchar(50),
 catagory_id char(10)
);
create table Promotion
(
id char(10) primary key not null,
code nvarchar(50),
name nvarchar(50),
percent int
);
create table Order_
(
id char(10) primary key not null,
product nvarchar(50),
customer nvarchar(50),
create_date date,
finish_date date
);
create table Type
(
id_product char(10) primary key not null,
branch_name nvarchar(50),
frame_size int,
color nvarchar(50)
);

insert into Category(id ,name ,code )
values('LH1',	'Giày nam',	'giay-nam'),
	  ('LH2',	'Giày nữ',	'giay-nu'),
	  ( 'LH3',	'Giày trẻ em','giay-tre-em');
insert into Customer(id ,first_name ,last_name,address ,city,country,county_code ,phone )
values('KH1',	'Allen',	'Michael',	'5/20/2000',	'Obere Str. 0123',	    'Berlin',	    'Germany',  '30',	'030-3456789'),
      ('KH2',	'Hassall',	'Mark',	    '2/26/2001',	'Avda. Constit 5678',	'México D.F.',	'Mexico',	'252',	'(5) 789-0123'),
      ('KH3',	'Peoples',	'John',	    '2/21/2002',	'Mataderos  7890',	    'México D.F.',	'Mexico',	'251',	'(5) 123-4567'),
      ('KH4',	'Arndt',	'Torsten',	'6/1/2003',	   '7890 Hanover Sq.',	     'London',	    'UK',	    '171',	'(171) 456-7890'),
      ('KH5',	'Higginb',	'Tom',	    '2/5/2004',	   'Berguvsvägen  5678',     'Luleå',	   'Sweden',	'192',	'0921-67 89 01'),
      ('KH6',	'Poland','	Carole',	'6/9/2005',	    'Forsterstr. 7890',	    'Mannheim',	   'Germany',	'162',	'0621-67890'),
      ('KH7',   'Bansal',	'Dushyant',	'8/5/2006',	    '2345, place Kléber',	'Strasbourg',	'France',	'167',	'67.89.01.23'),
      ('KH8',	'Ilyina',	'Julia',	'9/4/2007',	    'C/ Araquil, 0123',	     'Madrid',	    'Spain',	'191',	'(91) 345 67 89'),
      ('KH9',	'Raghav',	'Amritansh','9/4/2008',	 '6789, rue des Bouchers',	'Marseille',	'France',	'123',	'3.45.67.89'),
      ('KH10',	'Bassols',	'Pilar ,',  '9/9/2009',	   '8901 Tsawassen Blvd.',	'Tsawassen',	'Canada',	'604',	'(604) 901-2345');
/*------------------------------------------------------------------------------*/
insert into Account(id ,username ,password )
values('BA01',	'AN',	'123456'),
      ('BA02'	,'BINH',	'43543'),
      ('BA03',	'CHUNG',	'3420535'),
      ('BA04',	'DAN',	'357325'),
      ('BA05',	'EMERSON',	'37535'),
      ('BA06',	'FLOCOTA',	'57363'),
      ('BA07',	'GARA',	'3224'),
      ('BA08',	'HUYEN',	'3753572'),
      ('BA09',	'YURI',	'876925'),
      ('BA10',	'KAIDO',	'523535');
insert into Product(id,name , price ,promotion_id,  description ,catagory_id )
values('SP1','Giày thể thao nam có đệm khí',               14,      'KM1'  ,'',     'LH1'),
      ('SP2','Giày lười nam da bò đế cao su',	           9.8,     'KM2'  ,' ',    'LH1'),
      ('SP3','Giày Da Nam Cao Cấp UDANY',	               34.8,    'KM3'   ,'',    'LH1'),
      ('SP4','Giày sneaker nữ lưới đế 3 màu',	           186	,   'KM2'   ,'',	'LH2'),
      ('SP5','Giày Công Sở Nữ SODOHA',	                   42.4	,   'KM3'   ,'',	'LH2'),
	  ('SP6','Giày Búp Bê Mũi Nhọn Nữ Nhựa',	            7.7	,   'KM2'   ,'',	'LH2'),
      ('SP7','thể Thao Quai Dệt Trẻ Em Bitis',	            42.4,    'KM2'  ,'',	'LH3'),
      ('SP8','Giày Sneaker Bé Trai Bé Gái Cổ Thấp CrownUK',	'16.8',	'KM2'   ,'',	'LH3'),
      ('SP9','Giày Búp Bê Bé Gái Đi Học Đi Chơi Crown Space',16.8,	'KM4'    ,'',	'LH3'),
();
insert into Promotion(id ,code ,name ,percent )
values('KM1','ABC1','HOT1','10%'),
      ('KM2',	'ABC2',	'HOT2',	'20%'),
      ('KM3',	'ABC3',	'HOT3',	'30%'),
      ('KM4',	'ABC4',	'HOT4',	'40%'),
      ('KM5',	'ABC5',	'HOT5',	'50%'),
      ('KM6',	'ABC6',	'HOT6',	'60%'),
      ('KM7',	'ABC7',	'HOT7',	'70%'),
      ('KM8',	'ABC8',	'HOT8',	'80%'),
      ('KM9',	'ABC9',	'HOT9','90%'),
      ('KM10','ABC10','HOT10','100%');
insert into Order_ (id ,product,customer ,create_date ,finish_date )
values('10248',	'SP1',	'Allen', 'Michael',	'5/20/2000',	'5/20/2030'),
      ('10249',	'SP2',	'Hassall', 'Mark'	,'2/26/2001',	'2/26/2030'),
      ('10250',	'SP3',	'Peoples', 'John',	'2/21/2002',	'2/21/2030'),
      ('10251',	'SP4',	'Arndt', 'Torsten', '6/1/2003',	      '6/1/2030'),
      ('10252',	'SP5',	'Higginbotham', 'Tom'	,'2/5/2004',	'2/5/2030'),
      ('10253',	'SP6',	'Poland',   'Carole',	'6/9/2005',	'  6/9/2030'),
      ('10254',	'SP7',	'Bansal', 'Dushyant',	'8/5/2006',	'8/5/2030'),
      ('10255',	'SP8',	'Ilyina', 'Julia',	 '9/4/2007',	 '9/4/2030'),
      ('10256',	'SP9',	'Raghav', 'Amritansh',	'9/4/2008',	'9/4/2030'),
      ('10257',	'SP10',	'Bassols', 'Pilar Colome',	'9/9/2009',	'9/9/2030');
insert into Type(id_product ,branch_name ,frame_size ,color )
values('SP1','VN',	        41,	'Blue'),
      ('SP2','Laos',	    42,	'Black'),
      ('SP3','Cambodia',	43	,'Pink'),
      ('SP4','Colombia',	44	,'Red'),
      ('SP5','Australia',	45,'	White'),
      ('SP6','USA',      	45	,'Black'),
      ('SP7','China',   	46	,'Blue'),
      ('SP8','UK',	        46,'	Red'),
      ('SP9','France',      49,'White'),
     ('SP10','Malaysia',	49	,'Blue');
