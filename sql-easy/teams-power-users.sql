SELECT sender_id, COUNT(message_id) as message_count 
FROM messages 
WHERE EXTRACT(MONTH FROM sent_date) = 8
GROUP BY sender_id;
