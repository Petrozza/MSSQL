SELECT (m.FirstName + ' ' + m.LastName) AS Available
  FROM Mechanics m
	   LEFT JOIN Jobs j ON m.MechanicId = j.MechanicId
 WHERE (SELECT COUNT(JobId) 
		  FROM Jobs
	     WHERE [Status] <> 'Finished' AND m.MechanicId = MechanicId	
	     GROUP BY	MechanicId, Status) 
	   IS NULL
 GROUP BY m.MechanicId, (m.FirstName + ' ' + m.LastName)



