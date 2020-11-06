SELECT transactions.transaction_id, users.name, transactions.amount, RANK() OVER (PARTITION BY users.name ORDER BY transactions.amount DESC)
FROM pro.public.transactions
         INNER JOIN pro.public.users_accounts ON users_accounts.account_id = transactions.src_account_id
         INNER JOIN pro.public.users ON users.user_id = users_accounts.user_id;
