CREATE PROC usp_EmployeesBySalaryLevel (@Level VARCHAR(20))
AS
BEGIN
	SELECT FirstName, LastName
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @Level 
END
	


