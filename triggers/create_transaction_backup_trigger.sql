CREATE OR REPLACE FUNCTION transaction_performed()
    RETURNS TRIGGER
    language plpgsql
AS
$BODY$
BEGIN

    CREATE TABLE IF NOT EXISTS transactions_backup
    (
        transaction_id  INTEGER,
        amount  INTEGER,
        src_account_id INTEGER,
        dst_account_id INTEGER,
        date TIMESTAMP
    );
    INSERT INTO transactions_backup VALUES (NEW.transaction_id, NEW.amount, NEW.src_account_id, NEW.dst_account_id, NEW.date);

RETURN NEW;
END;
$BODY$;
CREATE TRIGGER backup_transactions AFTER INSERT
    ON public.transactions FOR EACH ROW
    EXECUTE PROCEDURE transaction_performed();

