CREATE OR REPLACE FUNCTION create_subcontract_payment_transaction()
    RETURNS TRIGGER
    language plpgsql
AS
$BODY$
DECLARE
     exchanger_account INTEGER;
BEGIN
IF OLD!=NEW THEN
    SELECT exchanger_account_id 
    INTO exchanger_account
    FROM contracts 
    WHERE contracts.contract_id = OLD.parent_id;
    IF OLD.status = 'created' AND NEW.status = 'payed' THEN
   	CALL public.money_transfer(exchanger_account, OLD.exporter_account_id, OLD.remittance_value);
    END IF;
END IF;
RETURN MEW;
END;
$BODY$;
 CREATE TRIGGER subcontract_status_changed AFTER UPDATE
     ON PUBLIC.subcontracts FOR EACH ROW
     EXECUTE PROCEDURE create_subcontract_payment_transaction();


