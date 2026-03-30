SELECT
    food_id,
    source,
    external_id,
    name_es AS food_name_spanish,
    name_en AS food_name_english,
    COALESCE(name_en, name_es) AS food_name,
    category,
    group_name AS food_group,
    created_at,
    updated_at
FROM {{ source('hormone_food_raw', 'foods') }}
WHERE food_id IS NOT NULL