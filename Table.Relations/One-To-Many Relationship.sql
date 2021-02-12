CREATE TABLE Models
(
	ModelID INT PRIMARY KEY,
	Name VARCHAR(30),
	ManufacturerID INT NOT NULL
)

CREATE TABLE Manufacturers
(
	ManufacturerID INT PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	EstablishedOn DATE
)

INSERT INTO Manufacturers VALUES
(1, 'BMW', '1916-03-07'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '1966-05-01')

INSERT INTO Models VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3)

ALTER TABLE Models
ADD FOREIGN KEY (ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
