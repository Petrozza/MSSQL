CREATE PROC usp_GetEmployeesFromTown (@Town VARCHAR(30))
AS
BEGIN
	SELECT e.FirstName AS [First Name], e.LastName AS [Last Name]
	FROM Employees e
	JOIN Addresses a ON e.AddressID = a.AddressID
	JOIN Towns t ON a.TownID = t.TownID
	WHERE t.Name = @Town
END

EXEC usp_GetEmployeesFromTown 'Sofia'