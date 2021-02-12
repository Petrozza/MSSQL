SELECT TOP (5) t.Country, t.PeanName, t.HighestPeak, t.MountainRange
FROM
(
SELECT c.CountryName AS Country,
		ISNULL(p.PeakName,'(no highest peak)') AS PeanName,
		ISNULL(m.MountainRange, '(no mountain)') AS MountainRange,
		ISNULL(MAX(p.Elevation), 0) AS HighestPeak,
		DENSE_RANK() OVER(PARTITION BY CountryName ORDER BY MAX(p.Elevation) DESC) AS Ranked
FROM Countries c
LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains m ON mc.MountainId = m.Id
LEFT JOIN Peaks p ON m.Id = p.MountainId
GROUP BY c.CountryName,p.PeakName, m.MountainRange
) as t
WHERE Ranked = 1
ORDER BY Country,PeakName