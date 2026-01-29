SELECT 
    c.category_id,
    c.name AS category_name,
    AVG(DATE_PART('day', r.return_date - r.rental_date)) AS avg_rental_days
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
WHERE r.return_date IS NOT NULL
GROUP BY c.category_id, c.name
ORDER BY c.category_id;
