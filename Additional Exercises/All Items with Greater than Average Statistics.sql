SELECT 
		i.Name, i.Price, i.MinLevel, s.Strength, s.Defence, s.Speed, s.Luck, s.Mind
FROM	Items i

JOIN	[Statistics] s ON i.StatisticId = s.Id

WHERE	s.Mind > (SELECT AVG(Mind) from [Statistics]) 
		AND s.Luck > (SELECT AVG(Luck) from [Statistics]) 
		AND s.Speed > (SELECT AVG(Speed) from [Statistics])
ORDER BY
		i.Name 