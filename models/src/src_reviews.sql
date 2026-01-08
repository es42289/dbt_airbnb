WITH  raw_reviews AS (
    SELECT
        *
    FROM
        source('airbnb','reviews')
)
SELECT 
    comments AS review_text,
    date AS review_date,
    listing_id,
    reviewer_name,
    sentiment AS review_sentiment
FROM 
    raw_reviews

