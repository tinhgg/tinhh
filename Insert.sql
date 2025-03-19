use quan_ly_dat_hang;
GO

-- B?ng suppliers
INSERT INTO suppliers (supplier_id, name, address, phone) VALUES
(1, 'Tech Supplies', '123 ???ng Nguy?n Trãi, Hà N?i', '0987654321'),
(2, 'Logistics Hub', '456 ???ng Lê L?i, TP HCM', '0912345678');

-- B?ng products
INSERT INTO products (product_id, name, unit, specification, stock) VALUES
(1, 'Laptop Dell', 'cái', 'Core i7, 16GB RAM, SSD 512GB', 50),
(2, 'Bàn phím c?', 'cái', 'RGB, Blue Switch', 100),
(3, 'Chu?t không dây Logitech', 'cái', 'K?t n?i Bluetooth, Pin 12 tháng', 150),
(4, 'Màn hình LG 24inch', 'cái', 'Full HD, 75Hz', 80);

-- B?ng orders
INSERT INTO orders (order_id, supplier_id, order_date, notes) VALUES
(1, 1, '2025-03-16', 'Giao hàng trong tu?n'),
(2, 2, '2025-03-15', 'Ki?m tra k? tr??c khi giao');

-- B?ng order_details
INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 10, 15000000.00),
(2, 1, 2, 20, 1200000.00),
(3, 2, 3, 15, 800000.00),
(4, 2, 4, 5, 3500000.00);

-- B?ng delivery_notes
INSERT INTO delivery_notes (delivery_id, order_id, delivery_date) VALUES
(1, 1, '2025-03-17'),
(2, 2, '2025-03-18');

-- B?ng delivery_details
INSERT INTO delivery_details (delivery_detail_id, delivery_id, product_id, quantity) VALUES
(1, 1, 1, 10),
(2, 1, 2, 20),
(3, 2, 3, 15),
(4, 2, 4, 5);

