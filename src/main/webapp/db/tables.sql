create table admin(
	admin_id int auto_increment primary key,
	admin_email varchar(100) unique not null,
	admin_pwd varchar(100) not null,
	admin_name varchar(100) not null
);

insert into admin(admin_email, admin_pwd, admin_name) values('admin@gmail.com','admin','Harsh Nemade');

create table customer(
	custid int auto_increment primary key,
	email varchar(100) unique not null,
	password varchar(100) not null,
	name varchar(100) not null,
	address varchar(200) not null,
	phone varchar(20) not null
);

create table supplier(
	suppid int auto_increment primary key,
	email varchar(100) unique not null,
	password varchar(100) not null default 'test',
	name varchar(100) not null,
	address varchar(200) not null,
	phone varchar(20) not null
);

insert into supplier(email, name, address, phone) values
('supplier1@gmail.com','Kate Waters', 'Akurdi Pune 35','9823374978'),
('supplier2@gmail.com','Ekvira Aqua', 'Pimpri Pune 17','7823374978'),
('supplier3@gmail.com','Jagdamba Aqua', 'Akurdi Pune 35','6823374978'),
('supplier4@gmail.com','Crystal Minerals', 'Chinchwad Pune 33','9824474978');


create table product(
	pid int auto_increment primary key,
	pname varchar(100) not null,
	price float,
	qty_in_hand int,
	suppid int references supplier(suppid) on delete cascade
);

insert into product(pname,price,qty_in_hand,suppid) values
('1Ltr Bisleri Mineral Water',20,100,1),
('20Lit Bisleri Minteral Water jar',150,100,1),
('IKSA Still Natural Mineral Water- 500ml (Pack of 24 Bottles)',1035,100,2),
('Bailey With Added Minerals Water 500 ML | Pack Of 24 Bottles',999,50,3);


create table order_master(
	oid int auto_increment primary key,
	odate date not null,
	total float not null,
	status varchar(20) not null,
	card_no varchar(20) not null,
	card_holder varchar(100) not null,
	bank_name varchar(50) not null,
	custid int references customer(custid)
);

create table order_details(
	pid int references product(pid),
	oid int references order_master(oid),
	qty int
);


