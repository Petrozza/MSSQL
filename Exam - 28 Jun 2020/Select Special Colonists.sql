SELECT *
FROM
(SELECT t.JobDuringJourney, c.firstname + ' ' + c.lastname AS FullName,
	DENSE_RANK() OVER (PARTITION BY t.JobDuringJourney ORDER BY c.birthdate) AS JobRank
FROM Colonists c
JOIN TravelCards t ON c.Id = t.ColonistId) AS result
WHERE JobRank = 2