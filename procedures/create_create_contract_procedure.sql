CREATE OR REPLACE PROCEDURE create_contract(importer_account INTEGER, exchanger_account INTEGER, judge INTEGER, remittance INTEGER)
    language plpgsql
AS
$$
BEGIN
    INSERT INTO contracts (importer_account_id, exchanger_account_id, judge_id, remittance_value, judge_vote, date, status)
    VALUES (importer_account, exchanger_account, judge, remittance, 'none', now()::TIMESTAMP, 'created');
END;
$$;

