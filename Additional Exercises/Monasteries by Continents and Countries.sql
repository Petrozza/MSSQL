UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'


INSERT INTO Monasteries VALUES
('Hanga Abbey',
	(SELECT CountryCode
	FROM Countries c
	WHERE CountryName = 'Tanzania')
)

INSERT INTO Monasteries VALUES
('Myin-Tin-Daik',
	(SELECT CountryCode
	FROM Countries c
	WHERE CountryName = 'Myanmar')
)

SELECT con.ContinentName, c.CountryName, COUNT(m.Id) AS MonasteriesCount
FROM Continents con
LEFT JOIN Countries c ON con.ContinentCode = c.ContinentCode
LEFT JOIN Monasteries m ON c.CountryCode = m.CountryCode
WHERE c.IsDeleted = 0
GROUP BY con.ContinentName, c.CountryName
ORDER BY MonasteriesCount DESC, c.CountryName

