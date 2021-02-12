CREATE PROC usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
BEGIN

DECLARE @TripHotelId INT
DECLARE @TargetHotelId INT

SET @TripHotelId = (SELECT r.HotelId FROM Trips t JOIN Rooms r ON t.RoomId = r.Id WHERE t.Id = @TripId)
SET @TargetHotelId = (SELECT HotelId FROM Rooms WHERE Id = @TargetRoomId)

IF(@TripHotelId <> @TargetHotelId)
	THROW 50001, 'Target room is in another hotel!', 1

DECLARE @TripAccounts INT
SET @TripAccounts= (SELECT COUNT(*) FROM AccountsTrips WHERE TripId = @TripId)
DECLARE @TargetBeds INT
SET @TargetBeds = (SELECT r.Beds FROM Rooms r WHERE r.Id = @TargetRoomId)

IF @TripAccounts > @TargetBeds
	THROW 50002, 'Not enough beds in target room!', 1

UPDATE Trips
SET RoomId = @TargetRoomId 
WHERE Id = @TripId

END
GO

