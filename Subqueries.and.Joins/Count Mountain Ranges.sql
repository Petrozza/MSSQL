
SELECT c.CountryCode, COUNT(*)
FROM Countries c
JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
WHERE c.CountryCode IN ('BG', 'US', 'RU')
GROUP BY c.CountryCode
