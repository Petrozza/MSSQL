SELECT DISTINCT s.Name , s.Manufacturer
FROM Colonists c
JOIN TravelCards t on c.Id = t.ColonistId
JOIN Journeys j ON t.JourneyId = j.Id
JOIN Spaceships s ON j.SpaceshipId = s.Id
WHERE t.JobDuringJourney = 'Pilot' And datediff (YEAR, c.BirthDate, '2019-01-01') < 30 
ORDER BY s.Name