SELECT id, name, age, created_at
FROM users
WHERE age >= 30 AND status = 'active'
ORDER BY created_at DESC
LIMIT 5;