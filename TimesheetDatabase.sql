/*
CSUMB
CST363 Introduction to Database System
SP-15B
Instructor	: Dr. Wang
Team	:  10 - Clarus Solutions
Members	: Gracie Alderete-Fisher
	  Nigel Devaugh
	  Clarence Mitchell
*/

--
-- Remove Sequences
--

DROP SEQUENCE seq_approval;
DROP SEQUENCE seq_project;
DROP SEQUENCE seq_projectAssignment;
DROP SEQUENCE seq_timesheet;
DROP SEQUENCE seq_employee;
DROP SEQUENCE seq_Department;
DROP SEQUENCE seq_timesheetDetail;

--
-- Remove Tables and Constraints
--
DROP TABLE approval CASCADE CONSTRAINTS;
DROP TABLE project CASCADE CONSTRAINTS;
DROP TABLE projectAssignment CASCADE CONSTRAINTS;
DROP TABLE timesheet CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE timesheetDetail CASCADE CONSTRAINTS;

--
-- Create auto increment sequences
--

CREATE SEQUENCE seq_approval;
CREATE SEQUENCE seq_project;
CREATE SEQUENCE seq_projectAssignment;
CREATE SEQUENCE seq_timesheet;
CREATE SEQUENCE seq_employee;
CREATE SEQUENCE seq_Department;
CREATE SEQUENCE seq_timesheetDetail;

--
-- Create Tables
--

CREATE TABLE approval (
  approvalID     number(10) NOT NULL, 
  timesheetid    number(10), 
  statusreportid number(11), 
  notes          varchar2(255) DEFAULT '', 
  status         number(3) NOT NULL, 
  datecreated    date NOT NULL, 
  PRIMARY KEY (approvalID)) AUTO_INCREMENT = 1;
CREATE TABLE project (
  projecID  number(10) NOT NULL, 
  title     varchar2(255) NOT NULL, 
  startdate date, 
  enddate   date, 
  PRIMARY KEY (projecID)) AUTO_INCREMENT = 1;
CREATE TABLE projectAssignment (
  ProjectAssignID number(10) NOT NULL, 
  employeeid      number(10) NOT NULL, 
  projectid       number(10) NOT NULL, 
  PRIMARY KEY (ProjectAssignID)) AUTO_INCREMENT = 1;
CREATE TABLE timesheet (
  TimesheetID    number(10) NOT NULL, 
  projectid      number(10) NOT NULL, 
  employeeid     number(10) NOT NULL, 
  weekstartdate  date NOT NULL, 
  weekendingdate date NOT NULL, 
  ApproveDate    date NOT NULL, 
  PRIMARY KEY (TimesheetID)) AUTO_INCREMENT = 1;
CREATE TABLE employee (
  employeeID  number(10) NOT NULL, 
  firstname   varchar2(255) NOT NULL, 
  lastname    varchar2(255) NOT NULL, 
  email       varchar2(50) NOT NULL, 
  phonenumber varchar2(15), 
  isactive    number(3) DEFAULT '0' NOT NULL, 
  DeptID      number(10), 
  ApproverID  number(10) NOT NULL, 
  PRIMARY KEY (employeeID)) AUTO_INCREMENT = 1;
CREATE TABLE Department (
  deptID        number(10) NOT NULL, 
  DeptName      varchar2(50) NOT NULL, 
  DeptManagerID number(10) NOT NULL, 
  PRIMARY KEY (deptID));
CREATE TABLE timesheetDetail (
  TimesheetDetailID number(10) NOT NULL, 
  timesheetid       number(10) NOT NULL, 
  projectid         number(10), 
  workday           date NOT NULL, 
  hours             number(10, 0) NOT NULL, 
  PRIMARY KEY (TimesheetDetailID)) AUTO_INCREMENT = 1;
CREATE INDEX index_approval_status 
  ON approval (status);
CREATE UNIQUE INDEX index_project_title_unique 
  ON project (title);
CREATE UNIQUE INDEX userProfile 
  ON employee (email);
CREATE INDEX employee_DeptID 
  ON employee (DeptID);
CREATE INDEX Department_DeptManagerID 
  ON Department (DeptManagerID);
  
--
-- Add Constraints
--
  
ALTER TABLE approval ADD CONSTRAINT fk_approval_timesheet FOREIGN KEY (timesheetid) REFERENCES timesheet (TimesheetID) ON DELETE Cascade;
ALTER TABLE projectAssignment ADD CONSTRAINT fk_projectassignment_employee FOREIGN KEY (employeeid) REFERENCES employee (employeeID) ON DELETE Cascade;
ALTER TABLE projectAssignment ADD CONSTRAINT fk_projectassignment_project FOREIGN KEY (projectid) REFERENCES project (projecID) ON DELETE Cascade;
ALTER TABLE timesheet ADD CONSTRAINT fk_timesheet_project FOREIGN KEY (projectid) REFERENCES project (projecID) ON DELETE Cascade;
ALTER TABLE timesheet ADD CONSTRAINT fk_timesheet_employee FOREIGN KEY (employeeid) REFERENCES employee (employeeID) ON DELETE Cascade;
ALTER TABLE employee ADD CONSTRAINT fk_DeptNumber FOREIGN KEY (DeptID) REFERENCES Department (deptID) ON DELETE Set null;
ALTER TABLE Department ADD CONSTRAINT fk_manager_of_dept FOREIGN KEY (DeptManagerID) REFERENCES employee (employeeID);
ALTER TABLE timesheet ADD CONSTRAINT fk_timesheet_employee2 FOREIGN KEY (employeeid) REFERENCES employee (employeeID) ON DELETE Cascade;
ALTER TABLE timesheetDetail ADD CONSTRAINT fk_timesheetDetail_project FOREIGN KEY (projectid) REFERENCES project (projecID) ON DELETE Set null;
ALTER TABLE timesheetDetail ADD CONSTRAINT fk_timesheetDetail_timesheet FOREIGN KEY (timesheetid) REFERENCES timesheet (TimesheetID) ON DELETE Cascade;
