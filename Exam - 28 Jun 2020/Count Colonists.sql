SELECT count(*)
FROM colonists c
JOIN TravelCards t on c.Id = t.ColonistId
JOIN Journeys j ON t.JourneyId = j.Id
WHERE j.Purpose = 'Technical'