WITH raw_hosts AS (
    SELECT
        *
    FROM
        {{ source('airbnb','hosts') }}
)
SELECT
    created_at,
    id AS host_id,
    is_superhost,
    name AS host_name,
    updated_at
FROM
    raw_hosts