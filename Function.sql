use quan_ly_dat_hang
GO
ALTER FUNCTION dbo.fn_TotalOrdersBySupplier (@supplier_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @total_orders INT;
    SELECT @total_orders = COUNT(*) 
    FROM orders 
    WHERE supplier_id = @supplier_id;
    RETURN @total_orders;
END;
GO
CREATE FUNCTION dbo.fn_GetExpensiveProducts()
RETURNS @ExpensiveProducts TABLE
(
    product_id INT,
    name VARCHAR(255),
    price DECIMAL(10,2)
)
AS
BEGIN
    DECLARE @avg_price DECIMAL(10,2);
    SELECT @avg_price = AVG(name) FROM products;
    
    INSERT INTO @ExpensiveProducts
    SELECT product_id, name
    FROM products
    WHERE name > @avg_name;

    RETURN;
END;

