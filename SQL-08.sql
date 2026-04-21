SELECT
    user_id,
    id AS last_order_id,
    order_date AS last_order_date,
    total_amount AS last_total_amount
FROM (
    SELECT
        user_id,
        id,
        order_date,
        total_amount,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date DESC, id DESC) AS rn
    FROM orders
) ranked
WHERE rn = 1
ORDER BY user_id ASC;