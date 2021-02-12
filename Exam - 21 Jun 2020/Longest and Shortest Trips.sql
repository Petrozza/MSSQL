
SELECT a.Id AS AccountId, 
		(a.FirstName + ' ' + LastName) AS FullName,
		MAX(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS LongestTrip,
		MIN(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS ShortestTrip
FROM Accounts a
		 		 
JOIN AccountsTrips at ON a.Id = at.AccountId
JOIN Trips t ON at.TripId = t.Id

WHERE a.MiddleName IS NULL AND t.CancelDate IS NULL
GROUP BY a.Id, (a.FirstName + ' ' + LastName)
ORDER BY LongestTrip DESC, ShortestTrip
