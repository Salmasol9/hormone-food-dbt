SELECT
    nutrient_id,
    name AS nutrient_name,
    unit AS nutrient_unit
FROM {{ source('hormone_food_raw', 'nutrients') }}
WHERE nutrient_id IS NOT NULL