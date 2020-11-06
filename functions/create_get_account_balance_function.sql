CREATE OR REPLACE FUNCTION get_account_balance(IN src_account INTEGER)
    RETURNS INTEGER
    language plpgsql
AS
$$
DECLARE
    account_balance INTEGER;
BEGIN
    SELECT balance
    INTO account_balance
    FROM accounts
    WHERE account_id = src_account;
    RETURN account_balance;
END;
$$;

