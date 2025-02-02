CREATE DATABASE RELATIONSEXERCISE


CREATE TABLE Passports
(
	PassportID INT PRIMARY KEY,
	PassportNumber VARCHAR(50)
)

CREATE TABLE Persons
(
	PersonID INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	Salary DECIMAL(8,2),
	PassportID INT UNIQUE NOT NULL
)

INSERT INTO Passports VALUES
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2')

INSERT INTO Persons VALUES
(1, 'Roberto', 43300.00, 102),
(2, 'Tom',	56100.00, 103),
(3, 'Yana', 60200.00, 101)

ALTER TABLE Persons 
	ADD PRIMARY KEY (PersonID)

ALTER TABLE Persons
ADD FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)