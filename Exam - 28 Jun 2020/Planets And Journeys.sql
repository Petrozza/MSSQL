SElECT p.NAME as PlanetName, count(j.Id) as JourneysCount
FROM Planets p
JOIN Spaceports s ON p.Id = s.PlanetId
JOIN  Journeys j ON s.Id = j.DestinationSpaceportId
GROUP BY p.NAME
ORDER BY count(j.Id) DESC, p.NAME 