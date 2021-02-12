SELECT (m.FirstName + ' ' + m.LastName) AS Mechanic, j.Status, j.IssueDate
FROM Mechanics m
JOIN Jobs j ON m.MechanicId = j.MechanicId
ORDER BY m.MechanicId, j.IssueDate, j.JobId ASC