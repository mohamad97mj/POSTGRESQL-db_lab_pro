CREATE OR REPLACE PROCEDURE pay_subcontract(contract INTEGER)
    language plpgsql 
AS
$$
BEGIN
    contract_to_pay = 
    IF status = 'created' THEN
    	UPDATE contracts
    	SET status='payed'
    	WHERE contract_id = contract;
    END IF;
END;
$$;
