SELECT p.PartId, p.Description, pn.Quantity AS [Required], p.StockQty AS [In Stock], IIF(o.Delivered = 0, op.Quantity, 0) AS Ordered
  FROM Parts p
  LEFT JOIN PartsNeeded pn ON p.PartId = pn.PartId
  LEFT JOIN OrderParts op ON p.PartId = op.PartId
  LEFT JOIN Jobs j ON pn.JobId = j.JobId
  LEFT JOIN ORDERS o ON j.JobId = o.JobId
 WHERE j.Status <> 'Finished' AND 
       IIF(o.Delivered = 0, op.Quantity, 0) + p.StockQty < pn.Quantity
 ORDER BY p.PartId
