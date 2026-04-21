SELECT 
    wholesalers.name, 
    wholesalers.taxID, 
    COUNT(sold.customer) AS number_of_customers
FROM wholesalers
JOIN sold 
    ON wholesalers.name = sold.whname 
    AND wholesalers.taxid = sold.whtaxID
GROUP BY 
    wholesalers.name, 
    wholesalers.taxID
HAVING 
    SUM(sold.quantity) > 20000
ORDER BY 
    number_of_customers DESC;