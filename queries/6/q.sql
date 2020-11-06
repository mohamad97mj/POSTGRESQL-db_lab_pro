SELECT transactions.transaction_id, users.user_id, transactions.amount ,transactions.date
FROM pro.public.transactions
         INNER JOIN pro.public.users_accounts ON users_accounts.account_id = transactions.src_account_id
         INNER JOIN pro.public.users ON users.user_id = users_accounts.user_id
WHERE users.user_id = ANY(SELECT users.user_id
FROM pro.public.transactions
         INNER JOIN pro.public.users_accounts ON users_accounts.account_id = transactions.src_account_id
         INNER JOIN pro.public.users ON users.user_id = users_accounts.user_id
GROUP BY (users.user_id)
ORDER BY SUM(transactions.amount) DESC LIMIT 2);


