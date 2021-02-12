CREATE VIEW v_UserWithCountries 
AS
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.Age, c.Gender, con.[Name] AS CountryName
FROM Customers c
JOIN Countries con ON c.CountryId = con.Id
