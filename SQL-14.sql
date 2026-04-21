SELECT DISTINCT
    u.id,
    u.name
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE c.name = 'Beverages'
ORDER BY u.id ASC;