SELECT film_category.category_id, name AS category_name, count(DISTINCT rental.rental_id) AS rental_count, SUM(payment.amount) AS total_sales FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON rental.inventory_id = inventory.inventory_id
LEFT OUTER JOIN payment ON rental.rental_id = payment.rental_id
JOIN category ON category.category_id = film_category.category_id
GROUP BY film_category.category_id, name;