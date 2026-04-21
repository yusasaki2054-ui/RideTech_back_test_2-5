SELECT
    SUBSTRING_INDEX(email, '@', -1) AS domain,
    COUNT(*) AS user_count
FROM users
GROUP BY domain
ORDER BY user_count DESC;