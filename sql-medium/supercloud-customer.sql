-- Need to run SELECT DISTINCT product_category FROM products; to get the matching count 
-- JOIN type doesn't seem to matter here

SELECT customer_contracts.customer_id 
FROM customer_contracts 
JOIN products USING(product_id) 
GROUP BY customer_contracts.customer_id 
HAVING COUNT(DISTINCT products.product_category) = 3; 

'''
SELECT customer_contracts.customer_id 
FROM customer_contracts 
JOIN products ON customer_contracts.product_id = products.product_id 
GROUP BY customer_contracts.customer_id 
HAVING COUNT(DISTINCT products.product_category) = 3; 
''' 

'''
-- This is more of a proper solution but harder to write 

SELECT customer_id 
FROM (
    SELECT customer_id, COUNT(DISTINCT products.product_category) AS NumberOfProducts 
    FROM customer_contracts 
    JOIN products ON customer_contracts.product_id = products.product_id 
    GROUP BY customer_id
) AS SuperCloud
WHERE NumberOfProducts = (
    SELECT COUNT(DISTINCT product_category) 
    FROM products
);
'''
