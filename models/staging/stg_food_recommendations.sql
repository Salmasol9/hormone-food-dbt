SELECT
    food_id,
    phase_id,
    recommendation_score,
    rank_in_phase,
    key_benefits,
    created_at
FROM {{ source('hormone_food_raw', 'food_recommendations') }}
WHERE food_id IS NOT NULL AND phase_id IS NOT NULL