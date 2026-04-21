SELECT d.customer AS name, 
       ROUND(AVG(d.unitprice), 2) AS avg_unit_price,
       (SELECT SUM(quantity) 
        FROM sold s 
        WHERE s.customer = d.customer) AS amount_bought
FROM distributor d
GROUP BY d.customer
HAVING AVG(d.unitprice) > (SELECT AVG(unitprice) FROM distributor);