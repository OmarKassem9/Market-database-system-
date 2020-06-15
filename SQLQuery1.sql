create table Customer
(
	Customer_Id int primary key NOT NULL,
	First_name nvarchar(200) NOT NULL,
	Last_name nvarchar(200) NOT NULL,
	Phone nvarchar(20) NULL,
	Gender char check (Gender in ('M','F')) NOT NULL,
);

create table Employee
(
	Employee_ID int primary key NOT NULL,
	First_name nvarchar(200) NOT NULL,
	Last_name nvarchar(200) NOT NULL,
	Hire_date date default getdate() NULL,
	Gender  char check (Gender in ('M','F')) NOT NULL,
	Contract_Type nvarchar(20) check(Contract_Type in('fixed','hourly')) NOT NULL,
);

create table Employee_fixed
(
	Employee_ID int primary key references Employee(Employee_Id) NOT NULL ,
	Monthly_Salary decimal(6, 2) check (Monthly_Salary between 700 and 2000) NOT NULL,
);

create table Employee_hourly
(
	Employee_ID int primary key references Employee(Employee_Id),
	Working_hours decimal(5, 2) check(Working_hours>0),
	Hour_Salary decimal(5, 2) check(Hour_Salary>0)
);

create table Product_categories
(
	Category_ID int primary key NOT NULL,
	Category_Name nvarchar(200) unique NOT NULL,

);

create table Product
(
	Product_ID int primary key NOT NULL,
	Product_Name nvarchar(300) unique NOT NULL,
	Market_Price decimal(5, 2) check(Market_Price>=0) ,
	Category_ID int references Product_categories(Category_Id)
);


create table Sales
(
	Sale_ID int primary key not null,
	Sale_date date default getdate(),
	Total_price decimal(6, 2) ,
	Customer_ID int NOT NULL references Customer(Customer_Id),
	Employee_ID int NOT NULL references Employee(Employee_Id),
	Product_ID int references Product(Product_Id),
	Quantity decimal(6, 2) ,
	Unit_Price decimal(6, 2),
	check (Quantity > 0),
	check (Unit_Price >= 0)
);

