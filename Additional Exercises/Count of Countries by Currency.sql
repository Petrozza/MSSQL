SELECT c.CurrencyCode, c.Description, COUNT(con.CountryCode) AS NumberOfCountries
FROM Currencies c
LEFT JOIN Countries con ON c.CurrencyCode = con.CurrencyCode
GROUP BY c.CurrencyCode, c.Description
ORDER BY COUNT(con.CountryCode) DESC, c.Description