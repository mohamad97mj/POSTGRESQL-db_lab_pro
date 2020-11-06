--create datebase
\i db/create_db.sql

--create tebles
\i tables/create_users_table.sql
\i tables/create_accounts_table.sql
\i tables/create_users_accounts_table.sql
\i tables/create_contracts_table.sql
\i tables/create_subcontracts_table.sql
\i tables/create_transactions_table.sql

\c pro
--create roles

\i roles/create_importer_role.sql    
\i roles/create_exchanger_role.sql    
\i roles/create_exporter_role.sql    
\i roles/create_judge_role.sql    
\i roles/create_reporter_role.sql    
\i roles/create_users.sql


--create procedures
\i procedures/create_deposit_procedure.sql    
\i procedures/create_withdraw_procedure.sql    
\i procedures/create_money_transfer_procedure.sql    
\i procedures/create_create_contract_procedure.sql    
\i procedures/create_create_subcontract_procedure.sql    
\i procedures/create_pay_contract_procedure.sql    
--\i procedures/create_pay_subcontract_procedure.sql    


--create functions
\i functions/create_get_account_balance_function.sql    
\i functions/create_get_account_turnover_function.sql    
\i functions/create_get_transactions_between2accounts_function.sql    


--create triggers
\i triggers/create_contract_status_changed_trigger.sql
\i triggers/create_subcontract_status_changed_trigger.sql
\i triggers/create_transaction_backup_trigger.sql
    
    
--init tables
\i init/init_users_table.sql
\i init/init_accounts_table.sql
\i init/init_users_accounts_table.sql
\i init/init_contracts_table.sql
\i init/init_subcontracts_table.sql
\i init/init_transactions_table.sql

    

