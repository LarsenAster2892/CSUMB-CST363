/*
************************************************
CSUMB
CST363 Introduction to Database System
SP-15B
Instructor	: Dr. Wang
Team	:  10 - Clarus Solutions
Members	: Gracie Alderete-Fisher
	  Nigel Devaughn
	  Clarence Mitchell
************************************************
*/


cl scr;
--
--
--
set pagesize 1000;
set linesize 120;
set echo on
set verify on
set heading off

spool C:\cst363Oracle\Output\TimesheetCreateDB.txt;


--
-- Remove Sequences
--

DROP SEQUENCE seq_project;
DROP SEQUENCE seq_timesheet;
DROP SEQUENCE seq_employee;
DROP SEQUENCE seq_Department;
DROP SEQUENCE seq_projectAssignment;
--
-- Remove Tables and Constraints
--

DROP TABLE project CASCADE CONSTRAINTS;
DROP TABLE timesheet CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE projectAssignment CASCADE CONSTRAINTS;

--
-- Create auto increment sequences
--


CREATE SEQUENCE seq_project;
CREATE SEQUENCE seq_timesheet;
CREATE SEQUENCE seq_employee;
CREATE SEQUENCE seq_Department;
CREATE SEQUENCE seq_projectAssignment;

--
-- Create Tables
--


CREATE TABLE project (
  projectID   	number(10) NOT NULL, 
  projectName 	varchar2(50) NOT NULL, 
  PRIMARY KEY (projectID));
  
CREATE TABLE timesheet (
  timesheetID    number(10) NOT NULL, 
  employeeid     number(10) NOT NULL, 
  weekstartdate  date NOT NULL, 
  weekendingdate date NOT NULL, 
  hours          number(5, 2) NOT NULL, 
  PRIMARY KEY (timesheetID));
  
CREATE TABLE employee (
  employeeID  number(10) NOT NULL, 
  firstname   varchar2(50) NOT NULL, 
  lastname    varchar2(50) NOT NULL, 
  email       varchar2(50) NOT NULL, 
  phonenumber varchar2(15), 
  DeptID      number(10), 
  PRIMARY KEY (employeeID));
  
CREATE TABLE Department (
  deptID        number(10) NOT NULL, 
  DeptName      varchar2(50) NOT NULL, 
  DeptManagerID number(10) NOT NULL, 
  PRIMARY KEY (deptID));

CREATE TABLE projectAssignment (
  projectAssignID number(10) NOT NULL, 
  employeeid      number(10) NOT NULL, 
  projectid       number(10) NOT NULL, 
  PRIMARY KEY (projectAssignID));
  
CREATE UNIQUE INDEX project 
  ON project (projectName);

CREATE UNIQUE INDEX userProfile 
  ON employee (email);

CREATE INDEX employee_DeptID 
  ON employee (DeptID);

CREATE INDEX Department_DeptManagerID 
  ON Department (DeptManagerID);

--
-- Add Constraints
--
  
ALTER TABLE employee ADD CONSTRAINT fk_DeptNumber FOREIGN KEY (DeptID) REFERENCES Department (deptID) ON DELETE Set null;
ALTER TABLE timesheet ADD CONSTRAINT fk_timesheet_employee FOREIGN KEY (employeeid) REFERENCES employee (employeeID) ON DELETE Cascade;
ALTER TABLE projectAssignment ADD CONSTRAINT fk_projectassignment_employee FOREIGN KEY (employeeid) REFERENCES employee (employeeID) ON DELETE Cascade;
ALTER TABLE projectAssignment ADD CONSTRAINT fk_projectassignment_project FOREIGN KEY (projectid) REFERENCES project (projectID) ON DELETE Cascade;

--
-- Load Demo Data
-- 
@@loadDepartment.sql;
@@loadEmployee.sql;
@@loadProject.sql;
@@loadProjectAssign.sql;
@@loadTimesheet.sql;

--
--  Commit the data
--

COMMIT;
set echo off;
set verify off;

prompt
accept vPause prompt "Press ENTER to continue.."
prompt
--
-- Turn off Spooled output
spool off;
@@Main.sql;