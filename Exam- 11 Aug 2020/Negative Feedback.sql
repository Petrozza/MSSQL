SELECT ProductId, Rate, Description, CustomerId, c.Age, c.Gender
FROM Feedbacks f
JOIN Customers c ON f.CustomerId = c.Id
WHERE Rate < 5.0 
ORDER BY ProductId DESC, Rate ASC
