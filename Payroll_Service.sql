
---------UC 1 : create a payroll service database--------

CREATE DATABASE Payroll_Services;

SHOW DATABASES;

USE Payroll_Services;

--------UC 2 : create a employee payroll table in the payroll service database----------------

CREATE TABLE Employee_Payroll
(
	ID int primary key identity,
	Name varchar(255),
	Salary int,
	StartDate Date
)

--------UC 3 : create employee payroll data in the payroll service database--------------

INSERT INTO Employee_Payroll(Name,Salary,StartDate) 
VALUES	('Rita',10000,GETDATE()),
		('Ajay',15000,GETDATE()),
		('Vijay',12000,GETDATE()),
		('Sonal',18000,GETDATE()),
		('Ravi',20000,GETDATE()),
		('Shivansh',22000,GETDATE()),
		('Anjali',25000,GETDATE())


--------UC 4 : retrieve all the employee payroll data that is added to payroll service database-----------

SELECT * FROM Employee_Payroll


-------UC 5 : retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database---------------

SELECT Salary FROM Employee_Payroll
WHERE Name = 'Ravi'

SELECT * FROM Employee_Payroll
WHERE StartDate BETWEEN CAST('2018-01-01'AS DATE) AND DATE(NOW())


-------UC 6 : add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender---------

ALTER TABLE Employee_Payroll
add Gender char(1)

UPDATE Employee_Payroll
SET Gender = 'F' WHERE ID in (1,4,7)

UPDATE Employee_Payroll
SET Gender = 'M' WHERE ID in (2,3,5,6)


--------UC 7 : find sum, average, min, max and number of male and female employees---------

-------SUM() Function---------
SELECT Gender, SUM(Salary) as TotalSalary FROM Employee_Payroll GROUP BY Gender

-------AVG() Function--------
SELECT Gender, AVG(Salary) as AvgSalary FROM Employee_Payroll GROUP BY Gender

-------MIN() Function--------
SELECT Gender, MIN(Salary) as MinSalary FROM Employee_Payroll GROUP BY Gender

-------MAX() Function--------
SELECT Gender, MAX(Salary) as MaxSalary FROM Employee_Payroll GROUP BY Gender

-------COUNT() Function--------
SELECT Gender, COUNT(Salary) as CountSalary FROM Employee_Payroll GROUP BY Gender

---------UC8-------------

ALTER TABLE Employee_Payroll ADD PhoneNumber varchar(255)

ALTER TABLE Employee_Payroll ADD Address varchar(255) 

ALTER TABLE Employee_Payroll ADD Department varchar(255) NOT NULL 

------- UC 9 -----------

ALTER TABLE Employee_Payroll ADD Deduction float

ALTER TABLE Employee_Payroll ADD TaxablePay float

ALTER TABLE Employee_Payroll ADD IncomeTax float

ALTER TABLE Employee_Payroll ADD NetPay float

---------- UC 10 ---------  

INSERT INTO Employee_Payroll (Name,Salary,Gender,Department,Deduction,TaxablePay,IncomeTax,NetPay)
VALUES
('Terisa',30000,'F','Marketing',100000,50000,3000,5000)
