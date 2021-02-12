SELECT TOP(10) e1.FirstName, e1.LastName, e1.DepartmentID
FROM Employees AS e1
WHERE e1.Salary > 
(SELECT AVG(e2.Salary)
FROM Employees AS e2
WHERE e1.DepartmentID = e2.DepartmentID)
ORDER BY e1.DepartmentID