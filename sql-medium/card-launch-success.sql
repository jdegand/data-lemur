SELECT card_name, MAX(issued_amount) AS issued_amount 
FROM monthly_cards_issued 
WHERE issue_month = (SELECT MIN(issue_month) FROM monthly_cards_issued)
GROUP BY card_name 
ORDER BY issued_amount DESC;
