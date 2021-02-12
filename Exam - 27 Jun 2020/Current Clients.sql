SELECT 
(c.FirstName + ' ' + c.LastName), 
DATEDIFF(DAY, IssueDate, CONVERT(DATE, '2017-04-24')), 
[Status]
FROM Clients c
JOIN Jobs j ON c.ClientId = j.ClientId
WHERE Status <> 'Finished'