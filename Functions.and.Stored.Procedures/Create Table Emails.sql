CREATE TRIGGER tr_NotificationEmails ON Logs FOR INSERT
AS
DECLARE @accountId INT = (SELECT TOP(1) AccountId FROM inserted)
DECLARE @OldSum DECIMAL(15,2) = (SELECT TOP(1) OldSum FROM inserted)
DECLARE @NewSum DECIMAL(15,2) = (SELECT TOP(1) NewSum FROM inserted)

INSERT INTO NotificationEmails VALUES
(
@accountId,
'Balance change for account: ' + CAST(@AccountId AS VARCHAR(20)),
'On ' + CONVERT(VARCHAR(30), GETDATE(), 103) + 'your balance was changed from ' +  CAST(@OldSum AS VARCHAR(20)) + 'to ' + CAST(@NewSum AS VARCHAR(20))
)