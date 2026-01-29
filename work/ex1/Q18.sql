SELECT 
    co.country_id,
    co.country,
    COUNT(DISTINCT cu.customer_id) AS customer_count,
    SUM(p.amount) AS total_sales
FROM country co
JOIN city ci ON co.country_id = ci.country_id
JOIN address a ON ci.city_id = a.city_id
JOIN customer cu ON a.address_id = cu.address_id
JOIN rental r ON cu.customer_id = r.customer_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
GROUP BY co.country_id, co.country
ORDER BY co.country_id;
