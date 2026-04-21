SELECT name 
FROM customer
WHERE name NOT IN (
    SELECT customer_name 
    FROM sold
)
AND name NOT IN (
    SELECT customer_name 
    FROM distributor
);