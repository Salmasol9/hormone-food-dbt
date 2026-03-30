SELECT
    cp.phase_name,
    f.food_group,
    COUNT(*) AS total_foods,
    ROUND(AVG(r.recommendation_score), 2) AS avg_recommendation_score,
    ROUND(MAX(r.recommendation_score), 2) AS max_recommendation_score,
    ROUND(MIN(r.recommendation_score), 2) AS min_recommendation_score
FROM {{ ref('stg_food_recommendations') }} r
JOIN {{ ref('stg_foods') }} f
    ON r.food_id = f.food_id
JOIN {{ ref('stg_cycle_phases') }} cp
    ON r.phase_id = cp.phase_id
WHERE f.food_group IS NOT NULL
GROUP BY cp.phase_name, f.food_group
ORDER BY cp.phase_name, avg_recommendation_score DESC