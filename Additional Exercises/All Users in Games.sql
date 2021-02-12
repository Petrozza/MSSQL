SELECT g.Name AS Game, gt.Name AS [Game Type], u.Username, ug.Level, ug.Cash, ch.Name AS Character
FROM Users u
JOIN UsersGames ug ON u.Id = ug.UserId
JOIN Games g ON ug.GameId = g.Id
JOIN GameTypes gt ON g.GameTypeId = gt.Id
JOIN Characters ch ON ug.CharacterId = ch.Id
ORDER BY ug.Level DESC, (u.Username + g.Name)ASC







