SELECT city.*
FROM city
LEFT OUTER JOIN address ON city.city_id = address.city_id
WHERE address.city_id IS NULL;
