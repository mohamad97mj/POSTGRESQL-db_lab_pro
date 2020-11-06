WITH tmp AS
(SELECT src_account_id, count(src_account_id)
FROM accounts INNER JOIN transactions 
ON transactions.src_account_id = accounts.account_id
GROUP BY src_account_id
HAVING count(src_account_id) > 2)
SELECT count(src_account_id) AS number_of_indivisual_accounts_with_more_than_one_transactions
FROM tmp;

