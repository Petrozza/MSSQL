SELECT TOP(2) dp.DepositGroup
FROM
(SELECT DepositGroup, AVG(MagicWandSize) AS AvgSize
FROM WizzardDeposits
GROUP BY DepositGroup) AS dp
ORDER BY dp.AvgSize ASC
