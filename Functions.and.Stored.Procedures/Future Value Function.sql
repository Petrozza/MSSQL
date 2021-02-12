CREATE FUNCTION ufn_CalculateFutureValue 
(@Sum DECIMAL(15, 4), @YearlyInterest FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(15,4)
AS
BEGIN
	DECLARE @result DECIMAL(15,4)
	SET @result = (POWER((1 + @YearlyInterest), @NumberOfYears)) * @Sum
	RETURN ROUND(@result, 4)
END

