SELECT
    phase_id,
    phase_name,
    description AS phase_description,
    typical_duration_days,
    day_range_start,
    day_range_end,
    dominant_hormones
FROM {{ source('hormone_food_raw', 'cycle_phases') }}
WHERE phase_id IS NOT NULL