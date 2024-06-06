SELECT pages.page_id
FROM pages
WHERE NOT EXISTS (
    SELECT 1
    FROM page_likes
    WHERE pages.page_id = page_likes.page_id
);
