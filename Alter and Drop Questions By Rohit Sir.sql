drop database if exists altertable;
create database altertable;
use altertable;

create table my_table(
id int primary key auto_increment,
name varchar(100) not null,
age int not null,
created_at timestamp default(current_timestamp())
);

insert into my_table(id,name,age) values
(1,"Rohit",25),
(2,"Sachin",35),
(3,"Vikas",28);

create table my_table2(
id int primary key auto_increment,
description varchar(255) not null);

insert into my_table2(id,description) values
(1,"item 1"),
(2,"item 2"),
(3,"item 3");

select * from my_table;

alter table my_table rename column name to full_name;
alter table my_table modify column age bigint;
alter table my_table add column email varchar(100);
ALTER TABLE my_table ADD COLUMN middle_name VARCHAR(50) AFTER full_name;
alter table my_table add column emp_rank int first;
alter table my_table modify column created_at datetime;
alter table my_table2 modify column description text;
alter table my_table modify column full_name varchar(100) null;
alter table my_table modify id int not null,drop primary key;   #help
alter table my_table add primary key(id);
alter table my_table drop column middle_name;
alter table my_table rename column email to email_address;  #help
alter table my_table rename column email_address to email;
alter table my_table modify column age int null;
alter table my_table2 add constraint fk_my_table2_id foreign key (id) references my_table(id);
alter table my_table2 drop foreign key fk_my_table2_id;
alter table my_table modify column full_name varchar(200) not null;

alter table my_table drop primary key;
alter table my_table drop column age;
alter table my_table2 drop foreign key fk_my_table2_id;
drop table my_table2;
drop database altertable;
