CREATE PROC usp_CalculateFutureValueForAccount (@AccNumber INT, @Interest DECIMAL(18,2))
AS
BEGIN
	SELECT acc.Id AS [Account Id], ah.FirstName, ah.LastName, acc.Balance AS [Current Balance], dbo.ufn_CalculateFutureValue(acc.Balance, @Interest, 5) AS [Balance in 5 years]
	FROM AccountHolders AS ah
	JOIN Accounts AS acc ON ah.Id = acc.AccountHolderId
	WHERE acc.Id = @AccNumber
END

