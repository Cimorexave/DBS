SELECT 
    c.name, 
    ROUND(AVG(d.unitprice), 2) AS avg_unit_price
FROM customer c
JOIN distributor d 
    ON c.name = d.customer
JOIN wholesalers w 
    ON d.whname = w.name 
    AND d.whtaxid = w.taxid 
    AND w.country = c.country
WHERE NOT EXISTS (
    SELECT *
    FROM wholesalers w2
    WHERE w2.country = c.country
    AND NOT EXISTS (
        SELECT *
        FROM distributor d2
        WHERE d2.customer = c.name
        AND d2.whname = w2.name
        AND d2.whtaxid = w2.taxid
    )
)
GROUP BY 
    c.name
ORDER BY 
    c.name DESC;