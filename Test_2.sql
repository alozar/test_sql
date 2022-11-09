SELECT d1.Id AS d1_Id, d1.Date AS d1_Date, d2.Id AS d2_Id, MIN(d2.Date) AS d2_Date FROM Dates d1, Dates d2
WHERE d1.Date < d2.Date
GROUP BY d1.Id, d1.Date, d2.Id
HAVING d1.Id=d2.Id;