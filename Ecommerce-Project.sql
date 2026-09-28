CREATE DATABASE ecommerceDB;
USE ecommerceDB;
drop database ecommerceDB;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers
(customer_id, customer_name, city, state, signup_date)
VALUES
(1, 'Rahul', 'Hyderabad', 'Telangana', '2025-01-15'),
(2, 'Sneha', 'Bangalore', 'Karnataka', '2025-02-10'),
(3, 'Arjun', 'Chennai', 'Tamil Nadu', '2025-03-05'),
(4, 'Priya', 'Hyderabad', 'Telangana', '2025-03-20'),
(5, 'Kiran', 'Vijayawada', 'Andhra Pradesh', '2025-04-12'),
(6, 'Anjali', 'Pune', 'Maharashtra', '2025-05-18'),
(7, 'Rohit', 'Bangalore', 'Karnataka', '2025-06-01'),
(8, 'Divya', 'Visakhapatnam', 'Andhra Pradesh', '2025-06-25'),
(9, 'Varun', 'Chennai', 'Tamil Nadu', '2025-07-14'),
(10, 'Meena', 'Hyderabad', 'Telangana', '2025-08-08');

SELECT * FROM customers;
INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 2500),
(104, 'Keyboard', 'Accessories', 1500),
(105, 'Mouse', 'Accessories', 800),
(106, 'Monitor', 'Electronics', 12000),
(107, 'Printer', 'Electronics', 15000),
(108, 'Webcam', 'Electronics', 3500),
(109, 'USB Cable', 'Accessories', 500),
(110, 'Laptop Bag', 'Accessories', 2000);

SELECT * FROM products;


INSERT INTO orders
(order_id, customer_id, order_date, status)
VALUES
(1001, 1, '2025-08-15', 'Completed'),
(1002, 2, '2025-08-18', 'Completed'),
(1003, 3, '2025-08-20', 'Completed'),
(1004, 1, '2025-08-25', 'Cancelled'),
(1005, 4, '2025-09-02', 'Completed'),
(1006, 5, '2025-09-05', 'Completed'),
(1007, 6, '2025-09-10', 'Pending'),
(1008, 2, '2025-09-15', 'Completed'),
(1009, 7, '2025-09-20', 'Completed'),
(1010, 8, '2025-09-25', 'Completed'),
(1011, 3, '2025-10-01', 'Completed'),
(1012, 9, '2025-10-05', 'Cancelled'),
(1013, 4, '2025-10-10', 'Completed'),
(1014, 10, '2025-10-15', 'Completed'),
(1015, 5, '2025-10-20', 'Completed');

SELECT * FROM orders;

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 105, 2),
(3, 1002, 102, 1),
(4, 1002, 103, 1),
(5, 1003, 106, 2),
(6, 1003, 104, 1),
(7, 1004, 101, 1),
(8, 1005, 107, 1),
(9, 1005, 109, 3),
(10, 1006, 103, 2),
(11, 1006, 108, 1),
(12, 1007, 102, 1),
(13, 1007, 105, 1),
(14, 1008, 101, 1),
(15, 1008, 110, 1),
(16, 1009, 106, 1),
(17, 1009, 105, 2),
(18, 1010, 104, 2),
(19, 1010, 109, 2),
(20, 1011, 102, 2),
(21, 1011, 103, 1),
(22, 1012, 107, 1),
(23, 1013, 101, 1),
(24, 1013, 108, 2),
(25, 1014, 110, 1),
(26, 1014, 105, 2),
(27, 1015, 106, 1),
(28, 1015, 109, 4);

SELECT * FROM order_items;

INSERT INTO payments
(payment_id, order_id, payment_method, payment_status, payment_date)
VALUES
(501, 1001, 'UPI', 'Paid', '2025-08-15'),
(502, 1002, 'Credit Card', 'Paid', '2025-08-18'),
(503, 1003, 'Debit Card', 'Paid', '2025-08-20'),
(504, 1004, 'Credit Card', 'Refunded', '2025-08-25'),
(505, 1005, 'UPI', 'Paid', '2025-09-02'),
(506, 1006, 'Cash on Delivery', 'Paid', '2025-09-05'),
(507, 1007, 'UPI', 'Pending', '2025-09-10'),
(508, 1008, 'Credit Card', 'Paid', '2025-09-15'),
(509, 1009, 'UPI', 'Paid', '2025-09-20'),
(510, 1010, 'Debit Card', 'Paid', '2025-09-25'),
(511, 1011, 'UPI', 'Paid', '2025-10-01'),
(512, 1012, 'Credit Card', 'Refunded', '2025-10-05'),
(513, 1013, 'UPI', 'Paid', '2025-10-10'),
(514, 1014, 'Debit Card', 'Paid', '2025-10-15'),
(515, 1015, 'UPI', 'Paid', '2025-10-20');

SELECT * FROM payments;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT COUNT(*) AS total_payments
FROM payments;

SELECT *
FROM customers
WHERE customer_id IS NULL
   OR customer_name IS NULL
   OR city IS NULL
   OR state IS NULL
   OR signup_date IS NULL;

SELECT COUNT(*) AS null_rows
FROM customers
WHERE customer_id IS NULL;

SELECT COUNT(*) AS total_rows
FROM customers;

SELECT *
FROM products
WHERE product_id IS NULL
   OR product_name IS NULL
   OR category IS NULL
   OR price IS NULL;

SELECT COUNT(*) AS null_rows
FROM products
WHERE product_id IS NULL
   OR product_name IS NULL
   OR category IS NULL
   OR price IS NULL;
   
   
   
SELECT *
FROM orders
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR order_date IS NULL
   OR status IS NULL;
   
SELECT *
FROM payments
WHERE payment_id IS NULL
   OR order_id IS NULL
   OR payment_method IS NULL
   OR payment_status IS NULL
   OR payment_date IS NULL;
   
   
SELECT customer_id, COUNT(*) AS count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*) AS count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*) AS count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_item_id, COUNT(*) AS count
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;

SELECT payment_id, COUNT(*) AS count
FROM payments
GROUP BY payment_id
HAVING COUNT(*) > 1;

SELECT o.order_id, o.customer_id
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT oi.order_item_id, oi.order_id
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT oi.order_item_id, oi.product_id
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

SELECT p.payment_id, p.order_id
FROM payments p
LEFT JOIN orders o
    ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;
    
SELECT COUNT(*) AS total_orders
FROM orders;

SELECT 
    SUM(oi.quantity * p.price) / COUNT(DISTINCT oi.order_id) AS average_order_value
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;
    
SELECT 
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status;

SELECT SUM(quantity) AS total_quantity_sold
FROM order_items;

SELECT 
    p.category,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category;

SELECT 
    p.category,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category;

SELECT 
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;


SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

SELECT 
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2;

SELECT 
    c.city,
    SUM(oi.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;


SELECT 
    MONTH(o.order_date) AS order_month,
    SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY MONTH(o.order_date)
ORDER BY order_month;

SELECT 
    payment_method,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_method
ORDER BY total_payments DESC;

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;
    
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS item_total
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id;
    
    SELECT
    o.order_id,
    o.order_date,
    o.status AS order_status,
    p.payment_method,
    p.payment_status
FROM orders o
INNER JOIN payments p
    ON o.order_id = p.order_id;
    
    SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_name,
    p.category,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS item_total,
    o.status AS order_status,
    pay.payment_method,
    pay.payment_status
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
JOIN payments pay
    ON o.order_id = pay.order_id;
    
    
SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

SELECT
    p.category,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2
ORDER BY total_orders DESC;

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.status = 'Cancelled';



SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status
ORDER BY total_payments DESC;

SELECT
    payment_method,
    COUNT(*) AS usage_count
FROM payments
GROUP BY payment_method
ORDER BY usage_count DESC
LIMIT 1;


SELECT
    c.city,
    SUM(oi.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY total_revenue DESC
LIMIT 1;

SELECT
    MONTHNAME(o.order_date) AS month,
    SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY MONTH(o.order_date), MONTHNAME(o.order_date)
ORDER BY MONTH(o.order_date);


SELECT
    c.state,
    SUM(oi.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.state
ORDER BY total_revenue DESC;


SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;


SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC
LIMIT 1;


SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

SELECT
    pay.payment_method,
    COUNT(*) AS completed_orders
FROM payments pay
JOIN orders o
    ON pay.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY pay.payment_method
ORDER BY completed_orders DESC
LIMIT 1;


SELECT
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    c.customer_name,
    AVG(order_total) AS average_order_value
FROM customers c
JOIN (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.order_id, o.customer_id
) AS order_values
    ON c.customer_id = order_values.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY average_order_value DESC
LIMIT 1;

SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * p.price) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            o.customer_id,
            SUM(oi.quantity * p.price) AS customer_total
        FROM orders o
        JOIN order_items oi
            ON o.order_id = oi.order_id
        JOIN products p
            ON oi.product_id = p.product_id
        GROUP BY o.customer_id
    ) AS customer_spending
)
ORDER BY total_spent DESC;


SELECT
    c.customer_name,
    c.city,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name, c.city
HAVING SUM(oi.quantity * p.price) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            c2.customer_id,
            SUM(oi2.quantity * p2.price) AS customer_total
        FROM customers c2
        JOIN orders o2
            ON c2.customer_id = o2.customer_id
        JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        JOIN products p2
            ON oi2.product_id = p2.product_id
        WHERE c2.city = c.city
        GROUP BY c2.customer_id
    ) AS city_spending
);

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_spending
ORDER BY total_spent DESC;


WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_spending
WHERE total_spent > 50000
ORDER BY total_spent DESC;

WITH category_revenue AS (
    SELECT
        p.category,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.category
)
SELECT *
FROM category_revenue
ORDER BY total_revenue DESC;


WITH completed_sales AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    WHERE o.status = 'Completed'
    GROUP BY o.customer_id
)
SELECT
    c.customer_name,
    cs.total_revenue
FROM completed_sales cs
JOIN customers c
    ON cs.customer_id = c.customer_id
ORDER BY cs.total_revenue DESC;

SELECT
    p.category,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    ROW_NUMBER() OVER (
        PARTITION BY p.category
        ORDER BY SUM(oi.quantity) DESC
    ) AS row_num
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;


SELECT
    p.category,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(oi.quantity) DESC
    ) AS sales_rank
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;

SELECT
    p.category,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    DENSE_RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(oi.quantity) DESC
    ) AS sales_rank
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;


SELECT
    customer_id,
    order_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_date
FROM orders;

SELECT
    customer_id,
    order_id,
    order_date,
    LEAD(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_date
FROM orders;

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    SUM(oi.quantity * p.price) AS order_total,
    SUM(SUM(oi.quantity * p.price)) OVER (
        PARTITION BY c.customer_id
        ORDER BY o.order_date
    ) AS running_total
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
ORDER BY c.customer_id, o.order_date;

WITH product_revenue AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * p.price) AS total_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.category,
        p.product_id,
        p.product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        total_revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM product_revenue
)
SELECT
    category,
    product_name,
    total_revenue
FROM ranked_products
WHERE revenue_rank = 1;


SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed';

SELECT
    COUNT(*) AS completed_orders
FROM orders
WHERE status = 'Completed';


SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;



SELECT
    p.category,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC;


SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


SELECT
    MONTHNAME(o.order_date) AS month,
    SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY
    MONTH(o.order_date),
    MONTHNAME(o.order_date)
ORDER BY MONTH(o.order_date);

SELECT
    pay.payment_method,
    COUNT(*) AS total_orders
FROM payments pay
JOIN orders o
    ON pay.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY pay.payment_method
ORDER BY total_orders DESC;


SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.status = 'Cancelled'
ORDER BY o.order_date;

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


SELECT
    COUNT(DISTINCT o.order_id) AS completed_orders,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * p.price) AS total_revenue,
    AVG(oi.quantity * p.price) AS average_item_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Completed';

