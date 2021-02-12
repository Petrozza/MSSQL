CREATE PROC usp_GetHoldersWithBalanceHigherThan (@HigherBallance DECIMAL(15,2))
AS
BEGIN
	SELECT FirstName, LastName
	FROM AccountHolders ah
	JOIN Accounts a ON ah.Id = a.AccountHolderId
	GROUP BY FirstName, LastName
	HAVING SUM(a.Balance) > @HigherBallance
	ORDER BY FirstName, LastName
END