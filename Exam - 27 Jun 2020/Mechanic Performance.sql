SELECT (m.FirstName + ' ' + m.LastName) AS Mechanic,
AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate))
FROM Mechanics m
JOIN Jobs j ON m.MechanicId = j.MechanicId
GROUP BY m.MechanicId, (m.FirstName + ' ' + m.LastName)
