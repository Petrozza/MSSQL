CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18,4))
AS
BEGIN TRANSACTION

	DECLARE @OurAccount INT = (SELECT Id FROM Accounts WHERE Id = @AccountId)

		IF (@OurAccount IS NULL)
		BEGIN
		ROLLBACK
		RAISERROR ('Error in Id', 16, 1)
		RETURN
		END

		IF (@MoneyAmount < 0)
		BEGIN
		ROLLBACK
		RAISERROR ('Error in Money', 16,1)
		RETURN
		END

	UPDATE Accounts
	SET Balance -= @MoneyAmount
	WHERE Id = @OurAccount

COMMIT