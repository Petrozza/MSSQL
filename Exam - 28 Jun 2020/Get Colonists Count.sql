CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR (30)) 
RETURNS INT
AS
BEGIN
	DECLARE @Result INT
	SET @Result =
	(SELECT COUNT(t.Id)
	FROM TravelCards t
	JOIN Journeys j ON t.JourneyId = j.Id
	JOIN Spaceports s ON j.DestinationSpaceportId = s.Id
	JOIN Planets p ON s.PlanetId = p.Id
	WHERE p.NAME = @PlanetName)

	RETURN @Result
END	
	
