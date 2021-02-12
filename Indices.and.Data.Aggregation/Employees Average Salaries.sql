SELECT * INTO ShittyTable
FROM Employees
WHERE Salary > 30000

DELETE 
FROM ShittyTable
WHERE ManagerID = 42

UPDATE ShittyTable
SET Salary = Salary + 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM ShittyTable
GROUP BY DepartmentID
