CREATE TRIGGER tr_RemoveRelationsFromProducts
ON  Products
INSTEAD OF DELETE
AS
BEGIN

DECLARE @PructToDelete INT = 
					(SELECT p.Id FROM Products p 
					JOIN deleted d ON p.Id = d.Id)

DELETE  FROM Feedbacks
WHERE Feedbacks.ProductId = @PructToDelete

DELETE FROM ProductsIngredients
WHERE ProductsIngredients.ProductId = @PructToDelete

DELETE FROM Products
WHERE Products.Id = @PructToDelete

END
