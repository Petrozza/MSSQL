SELECT TOP(10) c.Id, c.Name AS Name, c.CountryCode AS Country, COUNT(a.Id) AS Accounts
FROM Cities c
JOIN Accounts a ON c.Id = a.CityId
GROUP BY c.Id, c.Name, c.CountryCode
ORDER BY Accounts DESC
