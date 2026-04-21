SELECT DISTINCT fishery.name, fishery.country 
    FROM fishery JOIN fish ON fishery.name = fish.caughtby
    ORDER BY fishery.name ASC