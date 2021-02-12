SELECT ff.CountryName, ff.DistributorName 
FROM
		(SELECT	c.Name AS CountryName, d.Name as DistributorName,
				DENSE_RANK() OVER (PARTITION BY c.Name ORDER BY COUNT(i.Id) DESC) as rank
		FROM Countries as c
		JOIN  Distributors d on c.Id = d.CountryId
		LEFT JOIN Ingredients i on D.Id = i.DistributorId
		GROUP BY  c.Name, d.Name) AS ff
WHERE ff.rank = 1
ORDER BY CountryName, DistributorName
