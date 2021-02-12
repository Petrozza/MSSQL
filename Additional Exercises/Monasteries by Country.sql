CREATE TABLE Monasteries 
(
	Id INT PRIMARY KEY IDENTITY, 
	[Name] NVARCHAR(100), 
	CountryCode VARCHAR(2)
)

INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')
----------------------------not for Judge-----------------------
ALTER TABLE Countries
ADD IsDeleted BIT DEFAULT 0;

UPDATE Countries
SET IsDeleted = 0

-------------------------END not for Judge----------------------
UPDATE	Countries
SET		IsDeleted = 1

WHERE	CountryCode IN
		(SELECT c.CountryCode FROM Countries c 
		JOIN CountriesRivers cr ON c.CountryCode = cr.CountryCode
		GROUP BY c.CountryCode
		HAVING COUNT(cr.RiverId) > 3)



SELECT m.Name AS Monastery, c.CountryName AS Country
FROM Monasteries m
JOIN Countries c ON m.CountryCode = c.CountryCode
WHERE c.IsDeleted = 0
ORDER BY m.Name
