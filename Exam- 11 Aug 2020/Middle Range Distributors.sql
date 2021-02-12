SELECT d.[Name] AS DistributorName, i.[Name] AS IngredientName, p.[Name] AS ProductName, AVG(f.Rate)
FROM Distributors d
JOIN Ingredients i ON d.Id = i.DistributorId
JOIN ProductsIngredients pin ON i.Id = pin.IngredientId
JOIN Products p ON pin.ProductId = p.Id
JOIN Feedbacks f ON p.Id = f.ProductId
GROUP BY p.[Id], d.[Name], i.[Name], p.[Name]
HAVING AVG(Rate) >= 5 AND AVG(Rate) <= 8
ORDER BY DistributorName, IngredientName, ProductName