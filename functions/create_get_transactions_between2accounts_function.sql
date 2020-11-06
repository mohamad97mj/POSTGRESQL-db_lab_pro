CREATE OR REPLACE FUNCTION get_transactions_between2accounts(IN src_account INTEGER, IN dst_account INTEGER)
RETURNS TABLE(amount INTEGER, src_account_id INTEGER, dst_account_id INTEGER, date TIMESTAMP)
language plpgsql
AS
$$
BEGIN
    RETURN QUERY
    SELECT transactions.amount, transactions.src_account_id, transactions.dst_account_id, transactions.date 
	FROM transactions 
	WHERE 
		(transactions.src_account_id = src_account AND transactions.dst_account_id = dst_account);
END;
$$;

