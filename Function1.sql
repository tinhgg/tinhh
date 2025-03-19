use quan_ly_dat_hang;
go

CREATE FUNCTION dbo.fn_TotalOrdersBySupplier (@supplier_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @total_orders INT;
    SELECT @total_orders = COUNT(*) 
    FROM orders 
    WHERE supplier_id = @supplier_id;
    RETURN @total_orders;
END;
go
SELECT dbo.fn_TotalOrdersBySupplier(1) AS TotalOrders;
CREATE FUNCTION dbo.fn_GetProductsBySupplier (@supplier_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT product_id, name, price
    FROM products
    WHERE supplier_id = @supplier_id
);
