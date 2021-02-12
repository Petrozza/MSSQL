SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, 
	c.PhoneNumber, 
	c.Gender
FROM Feedbacks f
RIGHT JOIN Customers c ON f.CustomerId = c.Id
WHERE f.Id IS NULL 
ORDER BY c.Id