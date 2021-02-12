SELECT c.Id, c.FirstName + ' ' + c.LastName AS full_name
FROM colonists c
JOIN TravelCards t on c.Id = t.ColonistId
WHERE t.JobDuringJourney = 'Pilot'
ORDER BY c.Id 