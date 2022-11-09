SELECT
  c.Id,
  c.ClientName,
  ISNULL(cc_t.CountContacts,0) as CountContacts
FROM Clients c
LEFT JOIN (
  SELECT cc.ClientId, COUNT(*) as CountContacts FROM ClientContacts cc
  GROUP BY cc.ClientId
) as cc_t ON c.Id=cc_t.ClientId;

SELECT c.Id, c.ClientName FROM Clients c
JOIN (
  SELECT cc.ClientId, COUNT(*) as CountContacts FROM ClientContacts cc
  GROUP BY cc.ClientId
  HAVING COUNT()>2
) as cc_t ON c.Id=cc_t.ClientId;