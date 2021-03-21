/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT
    country,
    count(customer_id) AS customer_count
FROM country
INNER JOIN city USING (country_id)
INNER JOIN address USING (city_id)
INNER JOIN customer USING (address_id)
GROUP BY country
ORDER BY customer_count DESC
LIMIT 1
;
