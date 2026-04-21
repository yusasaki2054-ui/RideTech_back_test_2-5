DELETE FROM logs
WHERE created_at < '2024-01-01'
ORDER BY created_at ASC
LIMIT 1000;

SELECT COUNT(*) AS remaining_before_2024
FROM logs
WHERE created_at < '2024-01-01';