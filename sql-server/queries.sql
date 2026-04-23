-- Example queries against the schema in schema.sql.
-- Use these as a starting point for Copilot demos: optimization,
-- rewriting, explaining, and generating tests.

-- 1. Top 10 customers by total order count (basic JOIN + GROUP BY).
SELECT TOP 10
    c.CustomerId,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(o.OrderId) AS OrderCount
FROM Customers c
LEFT JOIN Orders o ON o.CustomerId = c.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY OrderCount DESC;

-- 2. Revenue per product for orders in the last 30 days.
SELECT
    p.ProductId,
    p.Name,
    SUM(oi.Quantity * p.UnitPrice) AS Revenue
FROM Products p
JOIN OrderItems oi ON oi.ProductId = p.ProductId
JOIN Orders o      ON o.OrderId    = oi.OrderId
WHERE o.OrderDate >= DATEADD(DAY, -30, SYSUTCDATETIME())
GROUP BY p.ProductId, p.Name
ORDER BY Revenue DESC;

-- 3. A deliberately naive query. Ask Copilot to optimize it.
SELECT *
FROM Orders
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Customers
    WHERE Email LIKE '%@example.com'
);
