/*
-- SUBSTRING_INDEX doesn't work in postgres

SELECT CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings p1 
CROSS JOIN pizza_toppings p2 
CROSS JOIN pizza_toppings p3
WHERE p1.topping_name < p2.topping_name
AND p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, SPLIT_PART(pizza, ',', 1);

-- this is wrong caused I tried to get the first value of pizza and use that to sort
-- this is unnecessary

*/

/*
SELECT CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings p1 
CROSS JOIN pizza_toppings p2 
CROSS JOIN pizza_toppings p3
WHERE p1.topping_name < p2.topping_name
AND p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, pizza;
*/

/*
SELECT 
    p1.topping_name || ',' || p2.topping_name || ',' || p3.topping_name AS pizza,
    p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM 
    pizza_toppings p1
CROSS JOIN 
    pizza_toppings p2
CROSS JOIN 
    pizza_toppings p3
WHERE 
    p1.topping_name < p2.topping_name
    AND p2.topping_name < p3.topping_name
ORDER BY 
    total_cost DESC, pizza;
*/

SELECT 
    p1.topping_name || ',' || p2.topping_name || ',' || p3.topping_name AS pizza, 
    p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost 
FROM 
    pizza_toppings p1 
    INNER JOIN pizza_toppings p2 ON p1.topping_name < p2.topping_name
    INNER JOIN pizza_toppings p3 ON p2.topping_name < p3.topping_name
WHERE 
    p1.topping_name < p2.topping_name 
    AND p2.topping_name < p3.topping_name 
ORDER BY 
    total_cost DESC, 
    pizza;
