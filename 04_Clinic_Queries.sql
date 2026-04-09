SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(sale_datetime) = 2021
GROUP BY sales_channel; 


SELECT 
    uid,
    SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(sale_datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;  


SELECT 
    c.city,
    cs.cid,
    (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
FROM clinic_sales cs
JOIN clinics c ON cs.cid = c.cid
LEFT JOIN expenses e ON cs.cid = e.cid
WHERE MONTH(cs.sale_datetime) = 9 
  AND YEAR(cs.sale_datetime) = 2021
GROUP BY c.city, cs.cid
HAVING profit = (
    SELECT MAX(profit)
    FROM (
        SELECT 
            (SUM(cs2.amount) - IFNULL(SUM(e2.amount),0)) AS profit
        FROM clinic_sales cs2
        JOIN clinics c2 ON cs2.cid = c2.cid
        LEFT JOIN expenses e2 ON cs2.cid = e2.cid
        WHERE MONTH(cs2.sale_datetime) = 9 
          AND YEAR(cs2.sale_datetime) = 2021
        GROUP BY c2.city, cs2.cid
    ) t
);



SELECT *
FROM (
    SELECT 
        c.state,
        cs.cid,
        (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.sale_datetime) = 9 
      AND YEAR(cs.sale_datetime) = 2021
    GROUP BY c.state, cs.cid
    ORDER BY profit ASC
    LIMIT 2
) t
ORDER BY profit DESC
LIMIT 1;