
SELECT a.Id, a.Email, c.Name AS City, COUNT(*) AS Trips
FROM Accounts a

JOIN Cities c ON a.CityId = c.Id
JOIN AccountsTrips at ON a.Id = at.AccountId
JOIN Trips t ON at.TripId = t.Id
JOIN Rooms r ON t.RoomId = r.Id
JOIN Hotels ht ON r.HotelId = ht.Id
JOIN Cities ct ON ht.CityId = c.Id

WHERE c.Id = ct.Id
GROUP BY a.Id, a.Email, c.Name
ORDER BY Trips DESC, a.Id