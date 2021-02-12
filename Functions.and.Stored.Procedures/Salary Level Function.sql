CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @Result VARCHAR(50)
	IF (@salary < 30000)
		SET @Result = 'Low'
	ELSE IF (@salary >= 30000 AND @salary <= 50000)
		SET @Result = 'Average'
	ELSE SET @Result = 'High'

	RETURN @Result
END

