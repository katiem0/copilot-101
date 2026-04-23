-- Sample stored procedure with a subtle SQL injection risk
-- (dynamic SQL built from a string parameter). Useful for a
-- Copilot "review for security vulnerabilities" demo.

CREATE OR ALTER PROCEDURE dbo.sp_GetCustomerOrders
    @CustomerEmail NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'
        SELECT o.OrderId, o.OrderDate, o.Status
        FROM Orders o
        JOIN Customers c ON c.CustomerId = o.CustomerId
        WHERE c.Email = ''' + @CustomerEmail + N'''';

    EXEC (@sql);
END;
