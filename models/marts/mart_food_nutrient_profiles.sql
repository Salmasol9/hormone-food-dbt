SELECT
    f.food_id,
    f.food_name,
    f.food_name_spanish,
    f.food_group,
    n.nutrient_name,
    n.nutrient_unit,
    fn.nutrient_amount_per_100g
FROM {{ ref('stg_food_nutrients') }} fn
JOIN {{ ref('stg_foods') }} f
    ON fn.food_id = f.food_id
JOIN {{ ref('stg_nutrients') }} n
    ON fn.nutrient_id = n.nutrient_id
ORDER BY f.food_name, n.nutrient_name