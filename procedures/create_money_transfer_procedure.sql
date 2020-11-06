CREATE OR REPLACE PROCEDURE money_transfer(src_account INTEGER, dst_account INTEGER, amount INTEGER)
    language plpgsql 
AS
$$
DECLARE
    account_balance DECIMAL;
BEGIN
    account_balance := (SELECT public.get_account_balance(src_account));
    IF (amount > account_balance) THEN
        RAISE NOTICE 'Not enough balance!';
    ELSE
        UPDATE accounts
        SET balance=balance - amount
        WHERE account_id = src_account;

        UPDATE accounts
        SET balance=balance + amount
        WHERE account_id = dst_account;

        INSERT INTO transactions (amount, src_account_id, dst_account_id, date)
        VALUES (amount, src_account, dst_account, now()::TIMESTAMP);

    END IF;
END;
$$;
