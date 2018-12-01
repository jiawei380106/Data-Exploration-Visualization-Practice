-- Name: Kaustubh Jagtap
-- Matric No: A0168820B

CREATE DATABASE IF NOT EXISTS enrollments;
USE enrollments;

CREATE TABLE faculty (FacultyName VARCHAR(50), PhoneNo CHAR(10), Dean VARCHAR(100), MainOffice VARCHAR(20), PRIMARY KEY (FacultyName));

CREATE TABLE department (DepartmentID CHAR(10), DepartmentName VARCHAR(100), Head VARCHAR(100), StartDate DATE, MainOffice VARCHAR(20), PhoneNo CHAR(10), FacultyName VARCHAR(50), PRIMARY KEY (DepartmentID), FOREIGN KEY (FacultyName) REFERENCES faculty (FacultyName));

CREATE TABLE course (CourseCode CHAR(10), CourseName VARCHAR(100), Description TEXT, Level TINYINT, CreditHours TINYINT, DepartmentID CHAR(10), PRIMARY KEY (CourseCode), FOREIGN KEY (DepartmentID) REFERENCES department (DepartmentID));

CREATE TABLE instructor (InstructorID CHAR(10), Name VARCHAR(100), Office VARCHAR(20), PhoneNo CHAR(10), Rank VARCHAR(50), DepartmentID CHAR(10), PRIMARY KEY (InstructorID), FOREIGN KEY (DepartmentID) REFERENCES department (DepartmentID));

CREATE TABLE section (SectionID CHAR(10), Year YEAR(4), Semester TINYINT, DaysTimes VARCHAR(30), Classroom CHAR(15), SectionNo TINYINT, CourseCode CHAR(10), InstructorID CHAR(10), PRIMARY KEY (SectionID), FOREIGN KEY (CourseCode) REFERENCES course (CourseCode), FOREIGN KEY (InstructorID) REFERENCES instructor (InstructorID));

CREATE TABLE student (StudentID CHAR(10), FirstName VARCHAR(30), MiddleName VARCHAR(30), LastName VARCHAR(30), DOB DATE, Address VARCHAR(255), MajorCode CHAR(10), PhoneNo CHAR (10), DepartmentID CHAR(10), PRIMARY KEY (StudentID), FOREIGN KEY (DepartmentID) REFERENCES department (DepartmentID));

CREATE TABLE attends (StudentID CHAR(10), SectionID CHAR(10), Grade CHAR(2), PRIMARY KEY (StudentID, SectionID), FOREIGN KEY (StudentID) REFERENCES student (StudentID), FOREIGN KEY (SectionID) REFERENCES section (SectionID));