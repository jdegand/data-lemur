/*
SELECT card_name,
       MAX(issued_amount) AS issued_amount
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY issued_amount DESC;
*/

/*
WITH cte AS (
    SELECT 
        card_name, 
        MIN(CONCAT(issue_year, '-', issue_month)) AS min_issue_date,
        SUM(issued_amount) AS issued_amount
    FROM 
        monthly_cards_issued
    GROUP BY 
        card_name
)
SELECT card_name, issued_amount
FROM cte
ORDER BY issued_amount DESC;
*/

/*
SELECT card_name, MAX(issued_amount) AS issued_amount
FROM monthly_cards_issued
WHERE (card_name, issue_year, issue_month) IN (
    SELECT card_name, MIN(issue_year), MIN(issue_month)
    FROM monthly_cards_issued
    GROUP BY card_name
)
GROUP BY card_name
ORDER BY issued_amount DESC;
*/
