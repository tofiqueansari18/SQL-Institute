DROP DATABASE IF EXISTS all_functions;
CREATE DATABASE all_functions;
Use all_functions;
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Insert some sample data into the table
INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, DepartmentID)
VALUES
('ajay', 'Kumar尽', '1998-01-15', '2010-06-01', 60000.28, 1),
('ashish', 'Tyagi', '1985-02-20', '2012-09-15', 75000.60, 2),
('sachin', 'Diskshit', '1979-03-10', '2011-04-20', 80000.01, 1),
('richa', 'Mittal', '1990-07-12', '2015-01-05', -70000.90, 3),
('aditi    ', 'Bhardwaz', '1988-11-30', '2013-10-10', 68000.10, 2);

select * from employees;

SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
	birthdate,
    departmentid
FROM Employees; 

select concat_ws('/', '2026','02','03') as a_date;
select trim(   "hello"  );
select ltrim(     "hello");
select rtrim("hello"       );

select *
from employees
where FirstName = "ajay";

select *
from employees
where trim(FirstName) = "aditi";

select upper(FirstName) from employees;
select lower(LastName) as LasrNameLower from employees;
select upper(concat(FirstName, ' ', LastName)) as FirstNameUpper from employees;

select lastname,
	char_length(lastname) as charlength,
    length(LastName) as length
from employees;

select
		firstname,
        substring(firstname,2,3) as firstnamesub
from employees;

select 
		firstname,
		concat(upper(substring(firstname,1,1)),substring(firstname,2))
from employees;

select
		lastname,
        concat(upper(substring(lastname,1,1)),substring(lastname,2))
from employees;

select left('Hello',2);
select right("hello",2);

select firstname,locate('i',firstname)
from employees; 
select locate("world","hello world");
select lpad('5','3','0');
select rpad('hi',5,'*');
select reverse("tofique");
select concat('hi',space(10),'hello');
select strcmp("hello", "hello");
select ascii("A");
select char(65 using utf8mb4);
select format(123456.789,2);
select repeat("HI",5);
select insert("Hello World",7,5,"Mysql");
select replace(lastname,"i","o") as lastnamereplaced from employees;