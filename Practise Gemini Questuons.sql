-- Gemini Practise Questions
-- Ecommerce Platform Table Design

drop database if exists Retail_Store_DB;
create database Retail_Store_DB;
use Retail_Store_DB;

create table Merchants(
Merchant_Id int auto_increment primary key,
Business_name varchar(120) not null,
GSTIN char(15) unique not null,
Official_Email varchar(255) not null,
Contact_Number char(10) not null unique check(Contact_Number REGEXP '^[0-9]{10}$'),
Merchant_Type enum("Individual","Proprietorship","Partnership","Private Limited") default "Proprietorship",
Annual_Turnover decimal(12,2),
State varchar(50) default "Delhi",
Pincode char(6) check(length(Pincode) = 6),
Verification_Status enum("Pending","Verified","Suspended") default "Pending",
Onboarding_Date date default(current_date()),
Created_at  datetime default(current_timestamp()),
Updated_at timestamp default(current_timestamp()),
Operational_Notes varchar(2000)
);

select * from Merchants;

create table products(
Product_Id int auto_increment primary key,
Merchant_Id int not null,
SKU_Code varchar(30) not null,
Base_Price decimal(10,2) not null check(Base_Price > 0),
Discount_Percentage decimal(5,2) default 0.00 check(Discount_Percentage between 0.00 and 100.00),
Final_Price decimal(10,2) generated always as (Base_Price -(Base_Price * Discount_Percentage / 100)) stored,
Stock_Quantity int check(Stock_Quantity>=0) default 0,
Is_Active boolean default true,
foreign key (Merchant_Id) references Merchants(Merchant_Id) on delete cascade on update cascade
);

select * from products;

create table order_items(
Order_Id int not null,
Item_Number int not null,
Product_Id int not null,
Quality int check(Quality>0),
Unite_Price decimal(10,2) not null check(Unite_Price > 0),
primary key(Order_ID,Item_Number),
foreign key(Product_Id) references products(Product_Id) on delete cascade on update cascade
);

select * from order_items;

alter table Merchants add constraint chk_gstin_verified check(Verification_Status != "Verifird" or GSTIN is not null);
alter table Merchants modify column Business_Name varchar(150) not null, add constraint uq_merchant_business_name unique(Business_Name);
alter table merchant_bank_accounts add constraint fk_bank_merchant foreign key(Merchant_Id) references Merchants(Merchant_Id) on delete set null on update cascade;

 