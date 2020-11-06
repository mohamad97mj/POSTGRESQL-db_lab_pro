SELECT 
       date_part('year', contracts.date)  as year,
       date_part('month', contracts.date) as month,
       date_part('day', contracts.date)   as day,
       SUM(transactions.amount)
FROM pro.public.transactions INNER JOIN contracts
ON contracts.importer_account_id = transactions.src_account_id
WHERE date_part('month', contracts.date) > 6 
GROUP BY
    CUBE (year, month, day)
