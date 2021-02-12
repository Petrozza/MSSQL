CREATE TRIGGER tr_InsertAccountInfo ON Accounts FOR UPDATE
AS
DECLARE @NewSum DECIMAL(15,2) = (SELECT Balance FROM inserted)
DECLARE @OldSum DECIMAL(15,2) = (SELECT Balance FROM deleted)
DECLARE @AccountId INT = (SELECT Id FROM inserted)

INSERT INTO Logs (AccountId, NewSum, OldSum) VALUES
(@AccountId, @NewSum, @OldSum)

