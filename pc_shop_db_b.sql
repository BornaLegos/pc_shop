drop database if exists pc_shop;
create database pc_shop character set utf8 collate utf8_general_ci;
use pc_shop;

create table company(
id int not null primary key auto_increment,
name varchar(50) not null,
oib char(11)
);

create table location(
id int not null primary key auto_increment,
adress varchar(50) not null,
company_id int not null,
foreign key (company_id) REFERENCES company (id)
);

create table employee(
id int not null primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
oib char(11),
location_id int not null,
foreign key (location_id) REFERENCES location (id)
);

create table category(
id int not null primary key auto_increment,
name varchar(50) not null
);

create table product(
id int not null primary key auto_increment,
name varchar(50) not null,
quantity int not null,
price decimal(18,2),
category_id int not null,
foreign key (category_id) REFERENCES category (id)
);

create table bill(
id int not null primary key auto_increment,
employee_id int not null,
location_id int not null,
company_id int not null,
datetime_sold datetime,
foreign key (employee_id) REFERENCES employee (id),
foreign key (location_id) REFERENCES location (id),
foreign key (company_id) REFERENCES company (id)
);

create table sold_product(
id int not null primary key auto_increment,
bill_id int not null,
product_id int not null,
quantity int not null,
price decimal(18,2),
foreign key (bill_id) REFERENCES bill(id),
foreign key (product_id) REFERENCES product(id)
);

#INSERT
insert into company (id,name,oib) values
(null,'One Two d.o.o.',12345678901);

insert into location (id,adress,company_id) values
(null,'Sesame Street 1',1),
(null,'Sesame Street 2',1);

insert into employee (id,first_name,last_name,oib,location_id) values
(null,'John','Doe',23456789012,2),
(null,'Jane','Doe',34567890123,1);

insert into category (id,name) values
(null,'Laptops'),
(null,'Computer Peripherals');

insert into product (id,name,quantity,price,category_id) values
(null,'Keyboard Z200',20,150.00,2),
(null,'Mouse X300',30,300.00,2),
(null,'Monitor S5000',10,1500.00,2),
(null,'Headphones S5000',50,200.00,2),
(null,'Laptop Q7200',5,4500.00,1);

insert into bill (id,employee_id,location_id,company_id,datetime_sold) values
(null,1,2,1,'2018-11-24 16:24:30'),
(null,2,1,1,'2018-11-24 18:20:40');

insert into sold_product (id,bill_id,product_id,quantity,price) values
(null,1,1,2,300.00),
(null,1,4,1,200.00),
(null,2,2,1,300.00),
(null,2,3,1,1500.00),
(null,2,5,1,4500.00);
