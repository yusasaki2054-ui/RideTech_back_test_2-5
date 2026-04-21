SELECT
    u.id AS user_id,
    u.name,
    COUNT(o.id) AS order_count
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY u.id, u.name
ORDER BY order_count DESC, u.id ASC
LIMIT 5;