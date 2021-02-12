CREATE FUNCTION udf_GetCost(@JobId INT)
RETURNS DECIMAL (15,2)
AS
BEGIN
DECLARE @Result DECIMAL(15,2)
SET @Result = (SELECT SUM(p.Price * op.Quantity) AS Total
FROM Jobs j
JOIN Orders o ON j.JobId = o.JobId
JOIN OrderParts op ON o.OrderId = op.OrderId
JOIN Parts p ON op.PartId = p.PartId
WHERE j.JobId = @JobId
GROUP BY j.JobId)

IF @Result IS NULL
	SET @Result = 0

	RETURN @Result
END

