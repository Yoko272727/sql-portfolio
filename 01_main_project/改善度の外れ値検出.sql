WITH stats AS (
    SELECT
        AVG(HbA1c) AS avg_hba1c,
        STDDEV(HbA1c) AS sd_hba1c
    FROM diabetes_records
)
SELECT
    d.*,
    (d.HbA1c - s.avg_hba1c) / s.sd_hba1c AS z_score
FROM diabetes_records d
CROSS JOIN stats s
WHERE ABS((d.HbA1c - s.avg_hba1c) / s.sd_hba1c) > 2.5;
