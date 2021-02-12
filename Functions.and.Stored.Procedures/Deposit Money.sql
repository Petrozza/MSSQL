CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(18,4)) 
AS
BEGIN TRANSACTION

DECLARE @account INT = (SELECT Id FROM Accounts WHERE Id = @AccountId)

	IF (@account IS NULL)
	BEGIN
	ROLLBACK
	RAISERROR ('Invalid Account', 16, 1)
	END

	IF (@MoneyAmount < 0)
	BEGIN
	ROLLBACK
	RAISERROR ('Invalid Money', 16, 1)
	END

	UPDATE Accounts
	SET Balance += @MoneyAmount
	WHERE id = @AccountId
COMMIT

