SELECT date_part('year', date)  as year,
       date_part('month', date) as month,
       date_part('day', date)   as day,
       SUM(amount)
FROM pro.public.transactions
GROUP BY
    ROLLUP (year, month, day)
	
HAVING SUM(amount) > 4000;
