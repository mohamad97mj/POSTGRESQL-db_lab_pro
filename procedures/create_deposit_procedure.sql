CREATE OR REPLACE PROCEDURE deposit(src_account INTEGER, amount INTEGER)
    language plpgsql 
AS
$$
BEGIN
    UPDATE accounts
    SET balance=balance + amount
    WHERE account_id = src_account;

    INSERT INTO transactions (amount, src_account_id, dst_account_id, date)
    VALUES (amount, src_account, src_account, now()::TIMESTAMP);
END;
$$;
