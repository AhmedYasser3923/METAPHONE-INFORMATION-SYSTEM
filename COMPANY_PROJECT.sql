CREATE DATABASE COMPANY_PROJ;
USE COMPANY_PROJ;

CREATE TABLE EMPLOYEE(
EMP_ID INT IDENTITY(1,1) PRIMARY KEY,
EMP_FNAME NVARCHAR(30) ,
EMP_LNAME NVARCHAR(30),
EMP_GENDER CHAR(1) ,
Emp_EMAIL NVARCHAR(300) ,
EMP_BDATE DATE ,
EMP_SALARY INT ,
DEPT_CODE INT 
);

CREATE TABLE EMP_PHONE(
EMP_PHONE NVARCHAR(20) NOT NULL,
EMP_CODE INT NOT NULL
);

CREATE TABLE DEPENDENT_EMP(
DEPN_NAME NVARCHAR(150) NOT NULL,
EMP_ID INT NOT NULL,
B_DATE DATE,
RELATIONSHIP NVARCHAR(350),
GENDER CHAR(1)
);

CREATE TABLE DEPARTMENT (
DEPT_CODE INT IDENTITY(1,1) PRIMARY KEY,
DEPT_NAME NVARCHAR(100),
MANAGER_CODE INT,
DEP_START_DATE DATE,
DEP_DESCRIPT NVARCHAR(700),
);

CREATE TABLE SUPPLIERS (
SUPP_ID INT IDENTITY (1,1) PRIMARY KEY,
SUPP_NAME NVARCHAR(50),
MGR_CODE INT,
SUPP_EMAIL NVARCHAR(255),
SUPP_COUNTRY NVARCHAR(50),
SUPP_CITY NVARCHAR(50)
);

CREATE TABLE SUPP_PHONE(
SUPP_PHONE NVARCHAR(20) NOT NULL,
SUPP_ID INT NOT NULL
);

CREATE TABLE CUSTOMER(
CUST_ID INT IDENTITY(1,1) PRIMARY KEY,
CUST_NAME NVARCHAR(70),
CUST_EMAIL NVARCHAR(255),
CUST_ADDRESS NVARCHAR(255)
);

CREATE TABLE CUST_PHONE(
CUST_PHONE NVARCHAR(20) NOT NULL,
CUST_CODE INT NOT NULL
);

CREATE TABLE ORDERR(
ORDE_ID INT IDENTITY(1,1) PRIMARY KEY,
ORDE_DATE DATE,
CUST_ID INT,
DELIVERY_ID INT
);

CREATE TABLE ORDER_DETAILS(
ORDER_DETAILS_CODE INT IDENTITY NOT NULL,
ORDER_ID INT NOT NULL,
PROD_ID INT NOT NULL,
QUANTITY INT 
);

CREATE TABLE PRODUCTS(
PROD_ID INT IDENTITY(1,1) PRIMARY KEY ,
PROD_NAME NVARCHAR(100),
PROD_PRICE INT,
PROD_QUANT INT,
SUPP_ID INT,
PROD_CATEGORY NVARCHAR(80)
);

--ALTER TABLE DEPENDENT
ALTER TABLE DEPENDENT_EMP
ADD CONSTRAINT PK1 PRIMARY KEY (DEPN_NAME , EMP_ID);

ALTER TABLE DEPENDENT_EMP
ADD CONSTRAINT FK1 FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);

ALTER TABLE DEPENDENT_EMP
ADD CONSTRAINT CK1 CHECK (Gender='M' or Gender='F');

--ALTER TABLE EMPLOYEE

ALTER TABLE EMPLOYEE
ADD EMP_STATUS NVARCHAR(255) NOT NULL;

ALTER TABLE EMPLOYEE
ADD CONSTRAINT CK2 CHECK (EMP_GENDER='M' or EMP_GENDER='F');

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK2 FOREIGN KEY (DEPT_CODE) REFERENCES DEPARTMENT(DEPT_CODE);

--ALTER TABLE EMP_PHONE
ALTER TABLE EMP_PHONE
ADD CONSTRAINT UN1 UNIQUE (EMP_PHONE);

ALTER TABLE EMP_PHONE
ADD CONSTRAINT PK2 PRIMARY KEY (EMP_PHONE , EMP_CODE);

ALTER TABLE EMP_PHONE
ADD CONSTRAINT FK3 FOREIGN KEY (EMP_CODE) REFERENCES EMPLOYEE(EMP_ID);

--ALTER TABLE DEPARTMENT
ALTER TABLE DEPARTMENT
ADD CONSTRAINT FK4 FOREIGN KEY (MANAGER_CODE) REFERENCES EMPLOYEE(EMP_ID);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT UN2 UNIQUE (DEPT_NAME);

--ALTER TABLE SUPPLIERS
ALTER TABLE SUPPLIERS
ADD CONSTRAINT FK5 FOREIGN KEY (MGR_CODE) REFERENCES EMPLOYEE(EMP_ID);

--ALTER TABLE SUPP_PHONE
ALTER TABLE SUPP_PHONE
ADD CONSTRAINT UN3 UNIQUE (SUPP_PHONE);

ALTER TABLE SUPP_PHONE
ADD CONSTRAINT PK3 PRIMARY KEY (SUPP_PHONE , SUPP_ID);

ALTER TABLE SUPP_PHONE
ADD CONSTRAINT FK6 FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIERS(SUPP_ID);

--ALTER TABLE CUST_PHONE 
ALTER TABLE CUST_PHONE
ADD CONSTRAINT UN4 UNIQUE (CUST_PHONE);

ALTER TABLE CUST_PHONE
ADD CONSTRAINT PK4 PRIMARY KEY (CUST_PHONE , CUST_CODE);

ALTER TABLE CUST_PHONE
ADD CONSTRAINT FK7 FOREIGN KEY (CUST_CODE) REFERENCES CUSTOMER(CUST_ID);

--ALTER TABLE ORDER
ALTER TABLE ORDERR
ADD CONSTRAINT FK8 FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID);

ALTER TABLE ORDERR
ADD CONSTRAINT FK9 FOREIGN KEY (DELIVERY_ID) REFERENCES EMPLOYEE(EMP_ID);

--ALTER TABLE ORDER_DETAILS
ALTER TABLE ORDER_DETAILS
ADD CONSTRAINT PK5 PRIMARY KEY (ORDER_DETAILS_CODE, ORDER_ID ,PROD_ID );

ALTER TABLE ORDER_DETAILS
ADD CONSTRAINT FK11 FOREIGN KEY (ORDER_ID) REFERENCES ORDERR(ORDE_ID);

ALTER TABLE ORDER_DETAILS
ADD CONSTRAINT FK12 FOREIGN KEY (PROD_ID) REFERENCES PRODUCTS(PROD_ID);
--ALTER TABLE PRODUCTS
ALTER TABLE PRODUCTS
ADD CONSTRAINT FK10 FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIERS(SUPP_ID);

ALTER TABLE PRODUCTS
ADD PROD_DESCRIPT NVARCHAR(100);

insert into EMPLOYEE (EMP_FNAME ,EMP_LNAME ,EMP_GENDER,Emp_EMAIL ,EMP_BDATE  ,EMP_SALARY , EMP_STATUS  )
values ('ahmed' , 'yasser' , 'm' , 'ahmed@gmail.com' , '10/6/2003' , 50000 ,'fulltime' ),
       ( 'ahmed' , 'meneem' , 'm' , 'ahmedmenem@gmail.com' , '8/8/2000' , 20000 ,'fulltime'),
	   ( 'mohamed' , 'gamal' , 'm' , 'mohamedgamal@gmail.com' , '12/5/1995' , 20000  ,'fulltime'),
	   ( 'mohamed' , 'alaa' , 'm' , 'alaamohamed@gmail.com' , '12/25/2001' , 60000 ,'fulltime'),
	   ( 'osama' , 'beshir' , 'm' , 'osamabisher@gmail.com' , '11/29/1991' , 53000,'parttime'),
	   ( 'abdalah ' , 'galal' , 'm' , 'abdala_galal@gmail.com' , '7/8/1999' , 9256,'parttime'),
	   ( 'hamdy' , 'elbrens' , 'm' , 'hamdyelbrens@gmail.com' , '9/15/1990' , 56153,'fulltime'),
	   ( 'malak' , 'mohamed' , 'f' , 'malakmohamed@gmail.com' , '4/15/1997' , 20000,'fulltime'),
	   ( 'esraa' , 'shafeeq' , 'f' , 'esraa-sh@hotmail.com' , '3/5/1998' , 10654 ,'parttime'),
	   ( 'zeina' , 'alaa' , 'f' , 'ze-alaa@gmail.com' , '8/8/2000' , 15485,'fulltime'),
	     ( 'yassmin' , 'gaafar' , 'f' , 'yass-gaf@gmail.com' , '11/21/1988' , 25000 ,'parttime'),
		   ( 'salma' , 'abdelrahman' , 'f' , 'ahmedmenem@gmail.com' , '5/15/2002' , 8754 ,'parttime');

insert into EMPLOYEE(EMP_FNAME ,EMP_LNAME ,EMP_GENDER,Emp_EMAIL ,EMP_BDATE  ,EMP_SALARY , EMP_STATUS  )
 values ( 'ziad' , 'khaled' , 'm' , 'ziadkh-z@gmail.com' , '7/18/2004' , 50000 ,'fulltime'),
	    ( 'shahd' , 'tamer' , 'f' , 'shahdtamer@gmail.com' , '9/19/2000' , 9000 ,'fulltime'),
		( 'ehab' , 'amr' , 'm' , 'ehabamr@gmail.com' , '2/28/1991' , 35000 ,'fulltime'),
		( 'sahar' , 'ahmed' , 'm' , 'ahmed-sahar@gmail.com' , '8/3/2005' , 5465,'fulltime');


insert into EMPLOYEE(EMP_FNAME ,EMP_LNAME ,EMP_GENDER,Emp_EMAIL  ,EMP_SALARY , EMP_STATUS          , DEPT_CODE  )
 values ( 'salah' , 'abdalah' , 'm' ,    'sasaabdalah@gmail.com' ,   2000,'fulltime Dileviry employees'  , 1),
	    ( 'ahmed' , 'ezz' , 'm' ,  'ezzahmed@gmail.com' ,            2000,'fulltime Dileviry employees'           , 1),
		( 'karim' ,    'fahmy' , 'm' ,     'kimofahmy@gmail.com' ,   2000,'fulltime Dileviry employees'  , 1) ,
		( 'karim' , 'abdelaziz' , 'm' , 'kimozizo@gmail.com' ,       2000,'fulltime Dileviry employees'      , 1),
		( 'hend' , 'sabry' , 'f' , 'hanodasabry@gmail.com' ,         2000,'fulltime Dileviry employees'        , 1),
		( 'mostafa' , 'khater' , 'm' , 'tefakhater@gmail.com' ,      2000,'fulltime Dileviry employees'     , 1),
		( 'ahmed' , 'meky' , 'm' , 'ahmedmekkkyyy@gmail.com' ,       2000,'fulltime Dileviry employees'      , 1),
		( 'johny' , 'elkbeer' , 'm' , 'johhnyelkbeer@gmail.com' ,    2000,'fulltime Dileviry employees'   , 1),
		( 'ahmed' , 'halawa' , 'm' , 'halawa@gmail.com' ,            2000,'fulltime Dileviry employees'           , 1),
		( 'hisham' , 'maged' , 'm' , 'hisham@gmail.com' ,            2000,'fulltime Dileviry employees'           , 1);
	

	--set department code

UPDATE Employee SET dept_code=1 WHERE EMP_ID=10;	
UPDATE Employee SET dept_code=12 WHERE EMP_ID=4;
UPDATE Employee SET dept_code=13 WHERE EMP_ID=8;
UPDATE Employee SET dept_code=13 WHERE EMP_ID= 9;
UPDATE Employee SET dept_code=14 WHERE EMP_ID=2;
UPDATE Employee SET dept_code=14 WHERE EMP_ID=6;
UPDATE Employee SET dept_code=15 WHERE EMP_ID=7;
UPDATE Employee SET dept_code=15 WHERE EMP_ID= 14;
UPDATE Employee SET dept_code=16 WHERE EMP_ID=13;
UPDATE Employee SET dept_code=16 WHERE EMP_ID=16;
UPDATE Employee SET dept_code=17 WHERE EMP_ID=12;
UPDATE Employee SET dept_code=18 WHERE EMP_ID= 3;
UPDATE Employee SET dept_code=19 WHERE EMP_ID=1;
UPDATE Employee SET dept_code=19 WHERE EMP_ID=11;
UPDATE Employee SET dept_code=20 WHERE EMP_ID=15;
UPDATE Employee SET dept_code=21 WHERE EMP_ID=5;

--UPDATE BIRTHDATE 
UPDATE EMPLOYEE SET EMP_BDATE ='4/18/2004' WHERE EMP_ID = 17; 
UPDATE EMPLOYEE SET EMP_BDATE ='2/10/2006' WHERE EMP_ID = 18; 
UPDATE EMPLOYEE SET EMP_BDATE ='3/1/2007' WHERE EMP_ID = 19; 
UPDATE EMPLOYEE SET EMP_BDATE ='7/25/2002' WHERE EMP_ID = 20; 
UPDATE EMPLOYEE SET EMP_BDATE ='8/31/2005' WHERE EMP_ID = 21; 
UPDATE EMPLOYEE SET EMP_BDATE ='9/18/2003' WHERE EMP_ID = 22; 
UPDATE EMPLOYEE SET EMP_BDATE ='1/14/2004' WHERE EMP_ID = 23; 
UPDATE EMPLOYEE SET EMP_BDATE ='6/22/2004' WHERE EMP_ID = 24; 
UPDATE EMPLOYEE SET EMP_BDATE ='1/5/2001' WHERE EMP_ID = 25; 
UPDATE EMPLOYEE SET EMP_BDATE ='6/7/2002' WHERE EMP_ID = 26; 


insert into DEPARTMENT (DEPT_NAME ,MANAGER_CODE ,DEP_START_DATE,DEP_DESCRIPT )
values ('dilevry staff'  , 10 , '2020' , 'staff of employees diliver orders to customers'); 

insert into DEPARTMENT (DEPT_NAME ,MANAGER_CODE ,DEP_START_DATE,DEP_DESCRIPT )
values ('Top Management' , 4 , '2020' , 'This department develops and executes overall business strategies. It is responsible for the entire organization. General management deals with determining overall business strategies, planning, monitoring execution of the plans, decision making, and guiding the workforce, and maintaining punctuality and disciplinary issues.	'),
       ( 'Marketing Department' , 8 , '2020' , 'It includes understanding the environment, staying tuned with the economic developments, knowing customer needs, and strengths and weaknesses of peer competitors.' ),
       ( 'Operations Department' , 2 , '2020' , 'The Operations Department combines two or more tourism components (among attractions, transportation, intermediaries, destination, accommodation, and activities) to create a package and sell it to the consumer.' ),
       ( 'Finance Department' , 7 , '2021' , 'The Finance Department is responsible for acquiring and utilizing money for financing the activities of the tourism business. The finance people assess short term and long term capital requirements.' ),
	   ( 'Sales Department' , 13 , '2020' , 'This department is solely responsible for selling the relevant tourism products to the consumers. The sales person in the tourism business is the first link between the tourism business itself and the consumer. The staff must have deep knowledge of the product and strong communication skills to convince the consumers. The sales person also promotes the destination.' ),
	   ( 'Human Resource Department' , 12 , '2022' , 'This department is responsible for recruiting skilled, and experienced manpower according to the positions at vacancies of different departments. It is also responsible for conducting orientation programs and trainings for new staff, recognizing the best facets of staff and motivating them to achieve organization objectives.' ),
	   ( 'Purchase Department' , 3 , '2021' , 'By following a standard procedure of procurement, this department ensures the enterprise has appropriate and timely supply of all the required goods and services. The purchasing department procures the goods and services to be consumed by other departments in the business organization.' ),
	   
	   ( 'IT DEPARTMENT' , 1 , '2020' , 'It uses the latest tech to keep communication lines running smoothly and protect critical data. They primarily deal with all business technical aspects, such as computer setup and management, employee email distribution, and server management. They are also responsible ffor the devices entering the companys network.' ),
	   ( 'logistics department' , 15 , '2022' , 'Logistics is a discipline focused on maintaining, receiving, and delivering goods on time. Logistics professionals typically work in warehouses, but also may work at airports, hospitals, and other facilities that require precise coordination.' ),
	   ( 'administrator department' , 5, '2020' , 'An Administrator provides office support to either an individual or team and is vital for the smooth-running of a business. Their duties may include fielding telephone calls, receiving and directing visitors, word processing, creating spreadsheets and presentations, and filing.' );




insert into EMP_PHONE (EMP_PHONE , EMP_CODE)
values (01221035068 , 5),
        (01250540369 , 11),
		(01220305684, 10),
		(01200345204 , 8),
		(01136584120 , 9),
		(01042569745 ,7 ),
		(01275315689 , 3),
		(01274523684 , 4),
		(01265248723 , 2),
		(0124852346 ,6 ),
		(01265324789 , 13),
		(01278561489 , 12),
		 (0125054039 , 11),
		(0122730564, 10),
		(01208345214 , 8),
		(0113984120 , 9),
		(0104455645 ,7 ),
		(01223315689 , 3),
		(01512523684 , 4),
		(01036248723 , 2),
		(0157152346 ,6 ),
		(0109324789 , 13),
		(0117851089 , 12)
		,
		(01091035068 , 1),
        (012505369 , 26),
		(01220305484, 25),
		(012003204 , 24),
		(0153584120 , 21),
		(01042469745 ,21 ),
		(01295315689 , 10),
		(01244523684 , 25),
		(01154987289 , 14),
		(0125052346 ,9 ),
		(01265324013 , 18),
		(01078561489 , 23),
		 (0125054045 , 12),
		(0121330564, 18),
		(01208205214 , 19),
		(0153984120 , 20),
		(011555645 ,21 ),
		(01226115689 , 22),
		(0125203684 , 23),
		(0153748723 , 24),
		(0127152346 ,25 ),
		(0105324789 , 26),
		(0121451089 , 7)
		;
	
	insert into DEPENDENT_EMP ( DEPN_NAME ,EMP_ID ,B_DATE ,RELATIONSHIP ,GENDER )
values ('hessuin' , 11, '2021-06-29' , 'son' , 'm'),
       ('aly' , 11 , '2022-03-26' , 'son' , 'm'),
	  
	  ('ahmad' , 11 , '2008-07-18' , 'son' , 'm'),
	   ('soha' , 11 , '2011-06-15' , 'daughter' , 'f'),
	  
	  ('perly' , 8 , '2002-12-17' , 'daughter' , 'f'),
	   ('hamza' ,8, '2007-07-30' , ' son' , 'm'),
	  
	  ('omar' , 7, '2020-03-14' , 'son' , 'm'),
	   
	  ('yassin' , 6 , '2016-12-24' , 'son' , 'm'),
	   ('yassmin' , 6 , '2014-05-14' , 'daughter' , 'f'),
	  
	  ('mariem' , 4, '2015-09-28' , ' daughter' , 'f'),
	   ('habiba' ,4, '2018-11-07' , 'daughter' , 'f'),
	   
	   ('gayla' , 3 , '2019-03-14' , 'daughter' , 'f'),
	   ('yara' , 3 , '2020-12-30' , 'daughter' , 'f'),
	   
	   ('aaser' , 5, '2023-04-14' , 'son' , 'm'),
	   ('adel' , 5 , '2021-08-03' , 'son' , 'm'),
	   
	   ('adham' , 2 , '2023-05-21' , ' son' , 'm'),
	   ('yousef' , 2 , '2022-03-14' , 'son' , 'm'),
	   
	   ('amgad' , 2 , '2006-03-14' , 'son' , 'm'),
	   ('salah' , 2 , '2011-03-14' , 'son' , 'm'),
	   ('yara' , 1 , '1995-10-8' , 'wife' , 'f'),	   
	   ('maya' , 4 , '2001-07-16' , 'wife' , 'f'),
	   ('habiba' , 13 , '2000-05-6' , 'wife' , 'f');




INSERT INTO SUPPLIERS(SUPP_NAME ,MGR_CODE ,SUPP_EMAIL ,SUPP_COUNTRY,SUPP_CITY ) 
VALUES ('amina khaleel',4,'aminakheleel@outlook.com'		  , 'America', ' Los Angeles'),
       ('yousef el sayd',4,'yousefsayed@outlook.com'		  , 'china', 'Macau'),
	   ('lotfy abdelrahman',4,'lofty abdelrahman@outlook.com' , 'America', 'Las vegas'),
	   ('khaled hamdy',4,'khaledh@outlook.com'				  , 'America', 'Albuquerque'),
	   ('ehab fikry',4,'ahbfik@outlook.com'                   , 'china', ' Macau'),
	   ('amr abdelaziz',4,'amr_abdelazziz@outlook.com'        , 'America', ' New York'),
	   ('mokhtar raslan',4,'mokhtarraslan@outlook.com'        , 'Germany', 'Munich'),
	   ('ahmed mahmod',4,'ahmedmahmood@outlook.com'           , 'America', 'chicago'),
	   ('ahmed aly',4,'ahmedaly@outlook.com'                  , 'Japan', ' Tokyo');

insert into SUPP_PHONE (SUPP_PHONE ,SUPP_ID )
VALUES  ('062486454560' , 1),
        ('664874554560' , 2),
        ('014864554560' , 3),
        ('164864554560' , 4),
        ('764866554560' , 5),
        ('364864453560' , 6),
        ('164984554560' , 7),
        ('564254554560' , 8),
        ('964664554560' , 9);

insert into CUSTOMER (CUST_NAME  ,CUST_EMAIL  ,CUST_ADDRESS )
values ('mohab inrahim ' , 'mohab@yahoo.com '  , 'new cairo 5 52'),
		('mohsen abdalah ' , 'mohsen@yahoo.com '  , 'new cairo 1452'),
		('ziad foaad ' , 'ziad@yahoo.com '  , 'nasr city street 452'),
		('johny el kbeer' , 'johny@yahoo.com '  , 'helwan city'),
		('inbrahim aly ' , 'ibrahim@yahoo.com '  , 'banyswef '),
		('joe ramy ' , 'joe@yahoo.com '  , 'el doki street 9'),
		('ebtsam saeed' , 'ebtsam@yahoo.com '  , 'new cairo 3'),
		('saeed el raees' , 'saeed@yahoo.com '  , 'mountain view 3'),
		('ramez gallal ' , 'ramez@yahoo.com '  , 'zahraa el maadi 4'),
		('ramy sabry ' , 'ramy@yahoo.com '  , 'mokkatam street 9'),
		('sherif ahmed ' , 'sherif@yahoo.com '  , 'madinty');

insert into CUST_PHONE (CUST_PHONE ,CUST_CODE )
VALUES ('11003215489' , 1),
       ('11003215454' , 2),
	   ('11123215486' , 3),
	   ('13563215488' , 4),
	   ('11003215483' , 5),
	   ('11403215489' , 6),
	   ('11004215487' , 7),
	   ('11004525483' , 8),
	   ('11012315481' , 9),
	   ('11032115486' , 10),
	   ('11045615484' , 11);

insert into PRODUCTS (PROD_NAME ,PROD_PRICE ,PROD_DESCRIPT ,SUPP_ID ,PROD_CATEGORY )
values('iphone 8 plus' ,  12000 ,'phone' , 1 , 'mobile phone'),
      ('iphone 7 plus' ,  9000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 6 plus' ,  6500,' phone' , 1 , 'mobile phone'),
	  ('iphone 8' ,		  9350 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 7'	   ,  8000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 6'	   ,  5000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 11'     ,  17000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 12'     ,  20000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 12mini' ,  25000 ,'phone' , 1 , 'mobile phone'),
  ('iphone 12 pro max' ,  30000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 12 pro' , 35000 ,'phone' , 1 , 'mobile phone'),
  ('iphone 11 pro max' ,  40000 ,'phone' , 1 , 'mobile phone'),
	  ('iphone 13    ' ,  45000 ,'phone' , 1 , 'mobile phone'),
	  ('air pods pro' ,  4000 ,'blutooth headphones' , 2 , 'headphones'),
	  ('iphone black charging cable' ,  560 ,'chargung cable' , 3, 'mobile accesories'),
	  ('iphone blue charging cable' ,  500,'chargung cable' , 3, 'mobile accesories'),
	  ('iphone rainbow light charging cable' ,  550,'chargung cable' , 3, 'mobile accesories'),
	  ('iphone red charging cable' ,  555 ,'chargung cable' , 3, 'mobile accesories'),
	  ('flash memory 16GB' ,  100,'memory storage' , 4 ,   'COMPUTER ACCESORIES'),
	  ('flash memory 8GB' ,  85 ,'memory storage' , 5 ,    'COMPUTER ACCESORIES'),
	  ('flash memory 4GB' ,  50 ,'memory storage' , 6 ,    'COMPUTER ACCESORIES'),
	  ('flash memory 32GB' ,  150 ,'memory storage' , 7 ,  'COMPUTER ACCESORIES'),
	  ('flash memory 64GB' ,  200 ,'memory storage' , 8 ,  'COMPUTER ACCESORIES'),
	  ('flash memory 128GB' ,  300 ,'memory storage' , 9 , 'COMPUTER ACCESORIES'),
	  ('flash memory 256GB' ,  450,'memory storage' , 2 , 'COMPUTER ACCESORIES'),
	  ('flash memory 1T' ,  700 ,'memory storage' , 2 ,   'COMPUTER ACCESORIES'),
	  ('flash memory 1.5T' ,  800 ,'memory storage' , 2 , 'COMPUTER ACCESORIES');
	  	  
UPDATE PRODUCTS SET PROD_QUANT = 150 WHERE PROD_ID = 1; 	  
UPDATE PRODUCTS SET PROD_QUANT = 250 WHERE PROD_ID = 2; 	  
UPDATE PRODUCTS SET PROD_QUANT = 370 WHERE PROD_ID = 3; 
UPDATE PRODUCTS SET PROD_QUANT = 50 WHERE PROD_ID = 4; 
UPDATE PRODUCTS SET PROD_QUANT = 400 WHERE PROD_ID = 5; 
UPDATE PRODUCTS SET PROD_QUANT = 270 WHERE PROD_ID = 6; 
UPDATE PRODUCTS SET PROD_QUANT = 350 WHERE PROD_ID = 7; 	  
UPDATE PRODUCTS SET PROD_QUANT = 500 WHERE PROD_ID = 8; 	  
UPDATE PRODUCTS SET PROD_QUANT = 750 WHERE PROD_ID = 9; 
UPDATE PRODUCTS SET PROD_QUANT = 850 WHERE PROD_ID = 10; 
UPDATE PRODUCTS SET PROD_QUANT = 950 WHERE PROD_ID = 11; 
UPDATE PRODUCTS SET PROD_QUANT = 700 WHERE PROD_ID = 12;
UPDATE PRODUCTS SET PROD_QUANT = 600 WHERE PROD_ID = 13; 	  
UPDATE PRODUCTS SET PROD_QUANT = 1000 WHERE PROD_ID = 14; 	  
UPDATE PRODUCTS SET PROD_QUANT = 2050 WHERE PROD_ID = 15; 
UPDATE PRODUCTS SET PROD_QUANT = 3000 WHERE PROD_ID = 16; 
UPDATE PRODUCTS SET PROD_QUANT = 1500 WHERE PROD_ID = 17; 
UPDATE PRODUCTS SET PROD_QUANT = 4500 WHERE PROD_ID = 18; 
UPDATE PRODUCTS SET PROD_QUANT = 5500 WHERE PROD_ID = 19; 
UPDATE PRODUCTS SET PROD_QUANT = 650 WHERE PROD_ID = 20; 
UPDATE PRODUCTS SET PROD_QUANT = 1050 WHERE PROD_ID = 21;
UPDATE PRODUCTS SET PROD_QUANT = 2050 WHERE PROD_ID = 22; 	  
UPDATE PRODUCTS SET PROD_QUANT = 2050 WHERE PROD_ID = 23; 	  
UPDATE PRODUCTS SET PROD_QUANT = 3000 WHERE PROD_ID = 24; 
UPDATE PRODUCTS SET PROD_QUANT = 4050 WHERE PROD_ID = 25; 
UPDATE PRODUCTS SET PROD_QUANT = 5034 WHERE PROD_ID = 26; 
UPDATE PRODUCTS SET PROD_QUANT = 6500 WHERE PROD_ID = 27; 

INSERT INTO ORDERR
VALUES('10/5/2023', 1 , 17),
('10/6/2023', 1 , 18),
('10/5/2023', 2 , 19),
('10/5/2023', 3 , 20),
('10/5/2023', 4 , 21),
('10/5/2023', 5 , 22),
('10/5/2023', 6 , 23),
('10/5/2023', 7 , 24),
('10/5/2023', 8 , 25),
('10/5/2023', 9 , 26),
('11/5/2023', 10 , 17),
('12/5/2023', 11 , 18);

INSERT INTO ORDER_DETAILS
VALUES ( 1 , 1, 1),
( 1 , 14, 1),
( 1 , 18, 1),
( 1 , 23, 1),
( 2 , 9, 1),
( 2 , 14, 1),
( 2 , 23, 5),
( 3 , 10, 1),
( 4 , 9, 2),
( 4 , 13, 1),
( 5 , 5, 3),
( 6 , 27, 5),
( 7 , 24, 1),
( 8 , 23, 5),
( 8 , 10, 1),
( 9 , 9, 2),
( 9 , 13, 1),
( 10 , 5, 3),
( 10 , 27, 5),
( 10 , 24, 1),
( 11 , 9, 2),
( 12 , 13, 1),
( 12 , 5, 3),
( 12 , 27, 5);

--• Second page (Simple Select)
SELECT * FROM EMPLOYEE
WHERE EMP_SALARY BETWEEN 10000 AND 40000
ORDER BY EMP_FNAME ASC;

SELECT * FROM PRODUCTS
WHERE PROD_QUANT >= 200
ORDER BY PROD_PRICE ASC;

SELECT * FROM SUPPLIERS
WHERE SUPP_COUNTRY = 'America'
ORDER BY SUPP_CITY DESC;

--• Third page (aggregate functions): 
SELECT EMP_SALARY, MIN(EMP_SALARY) AS 'Min Salary' , EMP_FNAME + ' ' +EMP_LNAME
AS 'NAME'
FROM EMPLOYEE
GROUP BY EMP_SALARY , EMP_FNAME , EMP_LNAME
HAVING MIN(EMP_SALARY) = (SELECT MIN(EMP_SALARY) FROM EMPLOYEE)
ORDER BY 'Min Salary' ASC;

select  PROD_CATEGORY,max(prod_price) AS PRICE , PROD_NAME from PRODUCTS
 group by PROD_CATEGORY , PROD_NAME
 having PROD_NAME LIKE'I%'
 order by PROD_CATEGORY DESC ;

SELECT DATEDIFF(YY, B_DATE , GETDATE()) AS AGE , DEPN_NAME , RELATIONSHIP , GENDER   
FROM DEPENDENT_EMP
GROUP BY  B_DATE ,DEPN_NAME , RELATIONSHIP , GENDER
HAVING  GENDER ='m'
ORDER BY AGE ASC;

--• Fourth page (SUB QUERY)
SELECT *
FROM Products
WHERE PROD_ID IN
(SELECT PROD_ID
FROM ORDER_DETAILS
WHERE Quantity <10 );

SELECT * FROM ORDERR
WHERE DELIVERY_ID IN (SELECT EMP_ID FROM EMPLOYEE
WHERE EMP_FNAME LIKE '%M');

SELECT * FROM EMPLOYEE 
WHERE DEPT_CODE IN (SELECT DEPT_CODE FROM DEPARTMENT
WHERE DEPT_NAME = 'IT DEPARTMENT');

--• Fifth page (Joins)
SELECT EMPLOYEE.EMP_FNAME + ' '+ EMPLOYEE.EMP_LNAME AS 'Employee NAME' , DEPENDENT_EMP.*
FROM DEPENDENT_EMP
INNER JOIN EMPLOYEE ON EMPLOYEE.EMP_ID = DEPENDENT_EMP.EMP_ID;

SELECT CUST_NAME,CUST_ADDRESS , ORDERR.ORDE_DATE
FROM CUSTOMER
 left OUTER JOIN ORDERR ON CUSTOMER.CUST_ID = ORDERR.CUST_ID;

 select CUST_NAME, CUST_PHONE AS PHONE_NUM from CUSTOMER
right join CUST_PHONE on customer.CUST_ID = CUST_PHONE.CUST_CODE
WHERE CUST_PHONE LIKE '%4';

SELECT * FROM DEPARTMENT;
SELECT * FROM EMP_PHONE;
select * FROM DEPENDENT_EMP;
SELECT * FROM SUPPLIERS; 
SELECT * FROM SUPP_PHONE;
SELECT * FROM CUSTOMER;
SELECT * FROM CUST_PHONE;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERR;
SELECT * FROM ORDER_DETAILS;