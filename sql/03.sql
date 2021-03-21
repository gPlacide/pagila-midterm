/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */
SELECT
    children.full_name
FROM (
    SELECT DISTINCT
        actor.first_name || ' ' || actor.last_name AS full_name
        --category.name
    FROM actor
    INNER JOIN film_actor USING (actor_id)
    INNER JOIN film USING (film_id)
    INNER JOIN film_category USING (film_id)
    INNER JOIN category USING (category_id)
    WHERE name = 'Children'
    --ORDER BY actor.first_name, actor.last_name
) AS Children
LEFT JOIN (
    SELECT DISTINCT
        actor.first_name || ' ' || actor.last_name AS full_name
        --category.name
    FROM actor
    INNER JOIN film_actor USING (actor_id)
    INNER JOIN film USING (film_id)
    INNER JOIN film_category USING (film_id)
    INNER JOIN category USING (category_id)
    WHERE name = 'Horror'
    --ORDER BY actor.first_name, actor.last_name
) AS Horror ON children.full_name = Horror.full_name
WHERE Horror.full_name IS NULL
ORDER BY full_name
;
