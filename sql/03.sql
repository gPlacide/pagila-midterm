/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */
SELECT
    children.first_name,
    children.last_name
FROM (
    SELECT DISTINCT
        actor.first_name,
        actor.last_name
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
        actor.first_name,
        actor.last_name
        --category.name
    FROM actor
    INNER JOIN film_actor USING (actor_id)
    INNER JOIN film USING (film_id)
    INNER JOIN film_category USING (film_id)
    INNER JOIN category USING (category_id)
    WHERE name = 'Horror'
    --ORDER BY actor.first_name, actor.last_name
) AS Horror ON children.first_name = Horror.first_name AND children.last_name = Horror.last_name
WHERE Horror.first_name IS NULL AND Horror.last_name IS NULL
ORDER BY children.first_name, children.last_name 
;
