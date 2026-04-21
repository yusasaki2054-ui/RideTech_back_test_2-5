UPDATE products p
JOIN categories c ON p.category_id = c.id
SET p.price = ROUND(p.price * 1.05)
WHERE c.name = 'Seasonal';

SELECT p.id AS product_id, p.name AS product_name, p.price AS updated_price
FROM products p
JOIN categories c ON p.category_id = c.id AND c.name = 'Seasonal'
ORDER BY p.id ASC;