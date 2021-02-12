CREATE DATABASE University

CREATE TABLE Majors
(
	MajorID INT PRIMARY KEY,
	Name VARCHAR(50)
)

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY,
	SudentNumber INT NOT NULL,
	StudentName VARCHAR(50),
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
	PaymentID INT PRIMARY KEY,
	PaymentDate Date,
	PaymentAmount DECIMAL(8,2),
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL
)

CREATE TABLE Subjects
(
	SubjectID INT PRIMARY KEY,
	SubjectName VARCHAR(50) NOT NULL
)

CREATE TABLE Agenda
(
	StudentID INT NOT NULL,
	SubjectID INT NOT NULL,
	PRIMARY KEY (StudentID, SubjectID),
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
)