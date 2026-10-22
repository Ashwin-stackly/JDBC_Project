create database employee_leave_db;
 
use employee_leave_db;
 
create table employees (

    employee_id int primary key auto_increment,

    employee_name varchar(100) not null,

    department varchar(50),

    email varchar(100) unique

);
 
create table leave_balance (

    employee_id int primary key,

    total_leaves int default 12,

    used_leaves int default 0,

    foreign key (employee_id)

        references employees(employee_id)

);
 
 
create table leave_requests (

    request_id int primary key auto_increment,

    employee_id int not null,

    start_date date not null,

    end_date date not null,

    leave_days int not null,

    reason varchar(200),

    status varchar(20) default 'Pending',

    foreign key (employee_id)

        references employees(employee_id)

);
 
select * from employees;

select * from leave_balance;

select * from leave_requests;


create database inventory_db;
 
use inventory_db;
 
create table suppliers (
    supplier_id int primary key auto_increment,
    supplier_name varchar(100) not null,
    phone varchar(15) unique
);
 
create table products (
    product_id int primary key auto_increment,
    product_name varchar(100) not null,
    price decimal(10,2) not null,
    quantity int not null default 0,
    supplier_id int,
    foreign key (supplier_id) references suppliers(supplier_id)
);
 
create table sales (
    sale_id int primary key auto_increment,
    product_id int not null,
    quantity_sold int not null,
    total_amount decimal(10,2) not null,
    sale_date date not null,
    foreign key (product_id) references products(product_id)
);
 
insert into suppliers (supplier_name, phone)
values
('loop suppliers', '9876543230'),
('jar traders', '9876553211');
 
select * from suppliers;
 
select * from products;
 
select *  from sales;
 