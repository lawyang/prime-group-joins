-- Get all customers and their addresses.
SELECT first_name, last_name, street, city, state, zip FROM addresses
JOIN customers ON customer_id = customers.id;

-- Get all orders and their line items.
SELECT order_date, total, unit_price, quantity FROM orders
JOIN line_items ON order_id = orders.id;

-- Which warehouses have cheetos?
SELECT warehouse, description, on_hand FROM warehouse_product
JOIN products ON product_id = products.id
JOIN warehouse ON warehouse_id = warehouse.id
WHERE description = 'cheetos';


-- Which warehouses have diet pepsi?
SELECT description, warehouse, on_hand FROM products
JOIN warehouse_product ON product_id = products.id
JOIN warehouse ON warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, last_name, count(order_id) FROM customers
JOIN addresses ON customer_id = customers.ID
JOIN orders ON addresses.id = address_id GROUP BY first_name, last_name;

-- How many customers do we have?
SELECT count(id) FROM customers;

-- How many products do we carry?
SELECT count(id) FROM customers;

-- What is the total available on-hand quantity of diet pepsi?
SELECT description, sum(on_hand) FROM warehouse_product
JOIN warehouse ON warehouse_id = warehouse.id
JOIN products ON product_id = products.id
WHERE description = 'diet pepsi' GROUP BY description;