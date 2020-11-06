CREATE OR REPLACE FUNCTION create_contract_payment_transaction()
    RETURNS TRIGGER
    language plpgsql
AS
$BODY$
BEGIN
IF OLD!=NEW THEN
    IF OLD.status = 'created' AND NEW.status = 'payed' THEN
   	CALL public.money_transfer(OLD.importer_account_id, OLD.exchanger_account_id, OLD.remittance_value);
    ELSE
    END IF;
END IF;
RETURN NEW;
END;
$BODY$;
CREATE TRIGGER contract_status_changed AFTER UPDATE
    ON PUBLIC.contracts FOR EACH ROW
    EXECUTE PROCEDURE create_contract_payment_transaction();


