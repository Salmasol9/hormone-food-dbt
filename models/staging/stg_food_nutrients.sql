SELECT
    food_id,
    nutrient_id,
    amount AS nutrient_amount_per_100g
FROM {{ source('hormone_food_raw', 'food_nutrients') }}
WHERE food_id IS NOT NULL AND nutrient_id IS NOT NULL