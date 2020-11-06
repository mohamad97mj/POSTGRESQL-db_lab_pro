SELECT * 
FROM users INNER JOIN users_accounts
ON users.user_id = users_accounts.user_id
INNER JOIN transactions
ON users_accounts.account_id = transactions.dst_account_id
WHERE users.name LIKE 'mo%' AND users.type IN ('importer', 'exchanger');
