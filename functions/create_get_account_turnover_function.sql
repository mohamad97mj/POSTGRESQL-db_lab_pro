CREATE OR REPLACE FUNCTION get_account_turnover(IN account_id INTEGER)
    RETURNS INTEGER
    language plpgsql
AS
$$
DECLARE
    account_turnover INTEGER;
BEGIN
    SELECT sum(amount) 
    INTO account_turnover
	FROM transactions 
	WHERE src_account_id = account_id OR dst_account_id = account_id;
    RETURN account_turnover;
END;
$$;
