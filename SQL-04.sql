SELECT
    o.id,
    u.name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.order_date DESC;