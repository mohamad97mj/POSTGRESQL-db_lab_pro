CREATE OR REPLACE PROCEDURE pay_contract(contract INTEGER)
    language plpgsql
AS
$$
DECLARE
    contract_status CHARACTER(255);
BEGIN
    SELECT status
    INTO contract_status
    FROM contracts
    WHERE contract_id = contract;
    IF contract_status = 'created' THEN
    	UPDATE contracts
    	SET status='payed'
    	WHERE contract_id = contract;
    END IF;
END;
$$;

