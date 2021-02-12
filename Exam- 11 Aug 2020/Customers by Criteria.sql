SELECT	c.FirstName, c.Age, c.PhoneNumber
FROM	Customers c
JOIN	Countries con ON c.CountryId = con.Id
WHERE	(c.Age >= 21 AND c.FirstName LIKE '%an%')
		OR
		(RIGHT(c.PhoneNumber, 2) = 38 AND con.Name <> 'Greece')
ORDER BY c.FirstName, c.Age DESC