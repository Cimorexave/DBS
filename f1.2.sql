-- approach 1
SELECT fishery.name, fishery.country
FROM fishery
JOIN fish ON fishery.name = fish.caughtby
GROUP BY fishery.name, fishery.country
HAVING COUNT(fish.id) > 40
ORDER BY fishery.name ASC;



-- approach 2, subquery
SELECT name, country
FROM fishery
WHERE (
    SELECT COUNT(*) 
    FROM fish 
    WHERE fish.caughtby = fishery.name
) > 40
ORDER BY name ASC;