set echo on

spool C:\Users\ndevaughn\Desktop\main.txt

alter table Employee drop CONSTRAINT fk_EmpDepartment;
alter table Employee drop CONSTRAINT fk_EmpOffice; 
alter table Timesheet drop CONSTRAINT fk_TimesheetEmployee; 
alter table TimesheetDetail drop CONSTRAINT fk_timesheet; 
alter table TimesheetDetail drop CONSTRAINT fk_DetailEmployee; 
alter table Department drop CONSTRAINT fk_deptManager; 
alter table Office drop CONSTRAINT fk_officeManager; 

drop table TimesheetDetail;
drop table Timesheet;
drop table Employee;
drop table Department;
drop table Office;

create table Employee
(
	employeeId char(4) PRIMARY KEY,
	firstname varchar2(30), 
	lastname varchar2(30),
	email varchar2(40),
	phone varchar2(15),
	departmentId char(4),   
	officeId char(4)
);      

create table Timesheet
(
	timesheetId char(4) PRIMARY KEY, 
	timesheetEndDate date,
	employeeId char(4)
);      

create table TimesheetDetail
(
	detailId char(4) PRIMARY KEY, 
	workday date,
	hours date,
	timesheetId char(4),      
	employeeId char(4)
);      

create table Department
(
	deptId char(4) PRIMARY KEY,
	deptName varchar2(40),
	deptManagerId char(4)
);         

create table Office
(
	officeId char(4) PRIMARY KEY,
	officeLocation varchar2(100),
	officeManagerId char(4)
);        

alter table Employee add CONSTRAINT fk_EmpDepartment FOREIGN KEY (departmentId) REFERENCES Department(departmentId);
alter table Employee add CONSTRAINT fk_EmpOffice FOREIGN KEY (officeId) REFERENCES Office(officeId);
alter table Timesheet add CONSTRAINT fk_TimesheetEmployee FOREIGN KEY (employeeId) REFERENCES Employee(employeeId);
alter table TimesheetDetail add CONSTRAINT fk_timesheet FOREIGN KEY (timesheetId) REFERENCES Timesheet(timesheetId);
alter table TimesheetDetail add CONSTRAINT fk_DetailEmployee FOREIGN KEY (employeeId) REFERENCES Employee(employeeId);
alter table Department add CONSTRAINT fk_deptManager FOREIGN KEY (deptManagerId) REFERENCES Employee(employeeId);
alter table Office add CONSTRAINT fk_officeManager FOREIGN KEY (officeManagerId) REFERENCES Employee(employeeId);
