-- SQL-16 カテゴリ別のトップ商品（売上金額1位）
-- 要件:
--   2024年の各カテゴリで、売上金額1位の商品を求める
--   出力: category_name, product_id, product_name, revenue
-- ヒント:
--   RANK() または ROW_NUMBER() を PARTITION BY category_id で利用
--
-- 提出方法: 下の /* ANSWER HERE */ に解答SQLを書いてください（1本または複数行）。
-- 注意: 先に DDL/テストデータを投入し、対象DBを USE 済みであること。

/* ANSWER HERE */
SELECT
category_name,
product_id,
product_name,
revenue
FROM (
    SELECT
    c.name AS category_name,
    p.id AS product_id,
    p.name AS product_name,
    SUM(oi.qty * oi.unit_price) AS revenue,
    RANK() OVER (PARTITION BY p.category_id ORDER BY SUM(oi.qty * oi.unit_price)DESC) AS rnk
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.id
    JOIN products p ON oi.product_id = p.id
    JOIN categories c ON p.category_id = c.id
    WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY p.category_id, c.name, p.id, p.name
    ) ranked
    WHERE rnk = 1
    ORDER BY category_name ASC;
