SELECT TOP(50) 
	e.EmployeeID, 
	e.FirstName + ' ' + e.LastName AS EmployeeName,
	emp.FirstName + ' ' + emp.LastName AS ManagerName,
	d.Name AS DepartmentName
FROM Employees AS e
JOIN Employees AS emp ON e.ManagerID = emp.EmployeeID
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
ORDER BY e.EmployeeID