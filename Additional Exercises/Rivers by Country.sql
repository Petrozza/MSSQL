SELECT 
	c.CountryName, 
	con.ContinentName, 
	IIF (COUNT(r.Id) = 0, 0, COUNT(r.Id) )  AS RiversCount,
	ISNULL(SUM(r.[Length]), 0) AS TotalLength
FROM Countries c
JOIN Continents con ON c.ContinentCode = con.ContinentCode
LEFT JOIN CountriesRivers cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers r ON cr.RiverId = r.Id
GROUP BY c.CountryName,con.ContinentName
ORDER BY RiversCount DESC, TotalLength DESC, c.CountryName
