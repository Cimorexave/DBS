SELECT 
    wholesalers.name, 
    wholesalers.taxID, 
    COUNT(sold.customer) AS number_of_customers
FROM wholesalers
LEFT JOIN sold 
    ON wholesalers.name = sold.whname 
    AND wholesalers.taxID = sold.whtaxID
GROUP BY 
    wholesalers.name, 
    wholesalers.taxID
ORDER BY 
    number_of_customers DESC;