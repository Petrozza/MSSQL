SELECT emp.EmployeeID, emp.FirstName, emp.ManagerID, mgr.FirstName
FROM Employees AS emp
JOIN Employees AS mgr ON emp.ManagerID = mgr.EmployeeID
WHERE emp.ManagerID IN(3, 7)
ORDER BY emp.EmployeeID