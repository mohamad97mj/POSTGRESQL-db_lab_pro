CREATE OR REPLACE PROCEDURE create_subcontract(parent INTEGER, exporter_account INTEGER, remittance INTEGER)
    language plpgsql 
AS
$$
BEGIN
    INSERT INTO subcontracts (parent_id, exporter_account_id, remittance_value, judge_vote, date, status)
    VALUES (parent, exporter_account, remittance, 'none', now()::TIMESTAMP, 'created');
END;
$$;


