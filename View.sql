use quan_ly_dat_hang;
go

CREATE VIEW v_order_details AS
SELECT 
    o.order_id, 
    o.order_date, 
    s.name AS supplier_name
FROM orders AS o
INNER JOIN suppliers AS s ON o.supplier_id = s.supplier_id;
go

CREATE VIEW v_supplier_order_count AS
SELECT 
    s.name AS supplier_name, 
    COUNT(o.order_id) AS total_orders
FROM orders AS o
INNER JOIN suppliers AS s ON o.supplier_id = s.supplier_id
GROUP BY s.name;
go

CREATE VIEW v_active_suppliers AS
SELECT 
    s.name AS supplier_name, 
    COUNT(o.order_id) AS total_orders
FROM orders AS o
INNER JOIN suppliers AS s ON o.supplier_id = s.supplier_id
GROUP BY s.name
HAVING COUNT(o.order_id) >= 3;
go

CREATE VIEW v_top_supplier AS
SELECT 
    s.name AS supplier_name, 
    COUNT(o.order_id) AS total_orders
FROM orders AS o
INNER JOIN suppliers AS s ON o.supplier_id = s.supplier_id
GROUP BY s.name
HAVING COUNT(o.order_id) = (
    SELECT MAX(order_count)
    FROM (
        SELECT supplier_id, COUNT(order_id) AS order_count
        FROM orders
        GROUP BY supplier_id
    ) AS subquery
);
go

CREATE VIEW v_supplier_category AS
SELECT 
    s.name AS supplier_name, 
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) >= 10 THEN 'VIP'
        WHEN COUNT(o.order_id) >= 5 THEN 'Thường xuyên'
        ELSE 'Ít giao dịch'
    END AS category
FROM orders AS o
INNER JOIN suppliers AS s ON o.supplier_id = s.supplier_id
GROUP BY s.name;
go


