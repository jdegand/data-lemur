-- The directions have been updated, but they are still not great.
-- The quantity of items (batches) doesn't seem to play a part in this question.
-- The prime and non prime items count is even.
-- ASSUMPTIONS don't seem to have be checked for: 
-- The non-prime items are never gonna be zero, etc

/*
SELECT COUNT(*) as count, SUM(square_footage) AS total 
FROM inventory 
WHERE item_type = 'prime_eligible';
*/

/*
-- This isn't right

WITH cte AS (
    SELECT
        item_type,
        CASE WHEN item_type = 'prime_eligible' THEN 'prime' ELSE 'not_prime' END AS category,
        SUM(square_footage) AS total_square_footage
    FROM INVENTORY
    GROUP BY item_type
)
SELECT
    category AS item_type,
    FLOOR(500000 / 2 / MIN(total_square_footage)) AS item_count
FROM cte
GROUP BY category;
*/

WITH cte AS (
  SELECT
    item_type,
    COUNT(item_id) AS num_of_items,
    SUM(square_footage) AS container_area
  FROM inventory
  GROUP BY item_type
)
SELECT
  item_type,
  CASE
    WHEN item_type = 'prime_eligible' THEN
      FLOOR(500000 / container_area) * num_of_items
    WHEN item_type = 'not_prime' THEN
      FLOOR(
        (500000 - (SELECT FLOOR(500000 / container_area) * container_area
                   FROM cte
                   WHERE item_type = 'prime_eligible'))
        / container_area
      ) * num_of_items
  END AS item_count
FROM cte;

/*

-- non-prime is negative in this query

WITH cte AS (
  SELECT
    item_type,
    COUNT(item_id) AS num_of_items,
    SUM(square_footage) AS container_area
  FROM inventory
  GROUP BY item_type
)
SELECT
  item_type,
  FLOOR(
    500000 /
    CASE
      WHEN item_type = 'prime_eligible' THEN container_area
      ELSE container_area - (
        SELECT FLOOR(500000 / container_area) * container_area
        FROM cte
        WHERE item_type = 'prime_eligible'
      )
    END
  ) * num_of_items AS item_count
FROM cte;
*/

/*
-- flip subtraction of container_area -> still not right

WITH cte AS (
  SELECT
    item_type,
    COUNT(item_id) AS num_of_items,
    SUM(square_footage) AS container_area
  FROM inventory
  GROUP BY item_type
)
SELECT
  item_type,
  FLOOR(
    500000 /
    CASE
      WHEN item_type = 'prime_eligible' THEN container_area
      ELSE (
        SELECT FLOOR(500000 / container_area) * container_area
        FROM cte
        WHERE item_type = 'prime_eligible'
      ) - container_area
    END
  ) * num_of_items AS item_count
FROM cte;
*/
