CREATE OR REPLACE PROCEDURE withdraw(src_account INTEGER, amount INTEGER)
    language plpgsql
AS
$$
DECLARE
    account_balance DECIMAL;
begin
    account_balance := (SELECT public.get_account_balance(src_account));
    IF (amount > account_balance) THEN
        raise notice 'Not enough balance!';
    ELSE
    	UPDATE accounts
    	SET balance=balance - amount
    	WHERE account_id = src_account;
	amount = -1* amount;
    	INSERT INTO transactions (amount, src_account_id, dst_account_id, date)
    	VALUES (amount, src_account, src_account, now()::timestamp);
       END IF;
END;
$$;
