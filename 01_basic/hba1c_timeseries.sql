SELECT
    PatientID,
    VisitDate,
    HbA1c,
    HbA1c - LAG(HbA1c) OVER (PARTITION BY PatientID ORDER BY VisitDate) AS delta_hba1c
FROM diabetes_records
ORDER BY PatientID, VisitDate;
