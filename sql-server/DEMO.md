# Instructor Demo Guide — SQL Server

Suggested flow for a foundationals Copilot training using the files in this
folder. Adjust order and depth to fit your time box.

## 1. Code Completions — Generate a query from a comment
Open [queries.sql](queries.sql) and add a comment on a new line:

```sql
-- Return the 5 most recent pending orders with the customer's full name
```

Press Enter and let Copilot complete the `SELECT`. Call out that Copilot
picked up the tables from [schema.sql](schema.sql) in the same folder.

## 2. Ask Mode — Explain existing SQL
Attach [queries.sql](queries.sql) and ask:

> Explain query #3 and tell me why it might perform poorly on a large
> Orders table.

## 3. Edit Mode — Rewrite / optimize
With [queries.sql](queries.sql) open:

> Rewrite query #3 to use a JOIN instead of a subquery and add any index
> suggestions I should create on the Customers and Orders tables.

## 4. Review — Find security issues
Attach [sp_GetCustomerOrders.sql](sp_GetCustomerOrders.sql) and ask:

> Do you see any security vulnerabilities in this stored procedure?

Copilot should call out the SQL injection via dynamic SQL and suggest
parameterized execution with `sp_executesql`.

## 5. Generate — Test data and unit tests
> Generate an INSERT script that adds 10 realistic sample customers, 5
> products, and 20 orders spread across the last 60 days using the schema
> in `schema.sql`.

> Write a tSQLt test that verifies `sp_GetCustomerOrders` returns only
> orders for the matching customer email.

## 6. Agent Mode — End-to-end task
> Add a `TotalAmount` computed column to the Orders table, update
> `schema.sql`, and add a new query in `queries.sql` that returns the top
> 5 highest-value orders this month.
