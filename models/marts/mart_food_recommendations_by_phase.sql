SELECT
    cp.phase_name,
    cp.typical_duration_days,
    cp.dominant_hormones,
    f.food_name,
    f.food_name_spanish,
    f.food_group,
    r.recommendation_score,
    r.rank_in_phase,
    r.key_benefits
FROM {{ ref('stg_food_recommendations') }} r
JOIN {{ ref('stg_foods') }} f
    ON r.food_id = f.food_id
JOIN {{ ref('stg_cycle_phases') }} cp
    ON r.phase_id = cp.phase_id
ORDER BY cp.phase_id, r.rank_in_phase