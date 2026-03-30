SELECT
    phase_id,
    nutrient_id,
    importance_level,
    importance_weight,
    reasoning
FROM {{ source('hormone_food_raw', 'phase_nutrient_needs') }}
WHERE phase_id IS NOT NULL AND nutrient_id IS NOT NULL