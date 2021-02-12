
SELECT 
t.Id,
(a.FirstName + ' ' +ISNULL(a.MiddleName + ' ', '')+  a.LastName) AS [Full Name],
c.Name AS [From],
ch.Name AS [To],
	CASE
	WHEN t.CancelDate IS NULL 
	THEN CONVERT(VARCHAR, DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) + ' days'
	ELSE 'Canceled' 
	END
	AS Duration
FROM AccountsTrips at
JOIN Accounts a ON at.AccountId = a.Id
JOIN Cities c ON a.CityId = c.Id
JOIN Trips t ON at.TripId = t.Id
JOIN Rooms r ON t.RoomId = r.Id
JOIN Hotels h ON r.HotelId = h.Id
JOIN Cities ch ON h.CityId = ch.Id
ORDER BY [Full Name], t.Id
