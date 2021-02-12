CREATE PROC usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(11))
AS
BEGIN
	IF NOT EXISTS (SELECT Id FROM Journeys WHERE id = @JourneyId)
	BEGIN
		THROW 50001, 'The journey does not exist!', 1
	END

	IF EXISTS (SELECT Purpose FROM Journeys 
	WHERE Purpose = @NewPurpose AND Id = @JourneyId)
	BEGIN
		THROW 50002, 'You cannot change the purpose!', 2
	END
	
		UPDATE Journeys 
		SET Purpose = @NewPurpose
		WHERE Id = @JourneyId
END

