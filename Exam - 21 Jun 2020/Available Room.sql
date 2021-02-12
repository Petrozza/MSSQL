CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(MAX)
AS
BEGIN

DECLARE @RoomInfo VARCHAR(MAX) = 
(
SELECT TOP (1)'Room ' + CONVERT(VARCHAR, r.Id) + ': ' + r.Type + ' (' + CONVERT(VARCHAR, r.Beds) + ' beds) - $' + CONVERT(VARCHAR, (h.BaseRate + r.Price) * 2)
FROM Rooms r
JOIN Trips t ON r.Id = t.RoomId
JOIN Hotels h ON r.HotelId = h.Id
WHERE	r.Beds >= @People AND 
		h.Id = @HotelId AND
		t.CancelDate IS NULL AND
		@date NOT BETWEEN t.ArrivalDate AND t.ReturnDate 
		AND YEAR(@Date) = YEAR(t.ArrivalDate)
ORDER BY (h.BaseRate + r.Price) * @People DESC
)
IF @RoomInfo IS NULL
	RETURN 'No rooms available'
RETURN @RoomInfo

END
