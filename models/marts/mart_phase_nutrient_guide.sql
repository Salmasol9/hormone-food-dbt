SELECT
    cp.phase_name,
    cp.dominant_hormones,
    n.nutrient_name,
    n.nutrient_unit,
    pn.importance_level,
    pn.importance_weight,
    pn.reasoning
FROM {{ ref('stg_phase_nutrient_needs') }} pn
JOIN {{ ref('stg_cycle_phases') }} cp
    ON pn.phase_id = cp.phase_id
JOIN {{ ref('stg_nutrients') }} n
    ON pn.nutrient_id = n.nutrient_id
ORDER BY cp.phase_id, pn.importance_weight DESC