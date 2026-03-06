SELECT
    PatientID,
    AVG(CASE WHEN VisitDate < TreatmentStartDate THEN HbA1c END) AS avg_before,
    AVG(CASE WHEN VisitDate >= TreatmentStartDate THEN HbA1c END) AS avg_after,
    AVG(CASE WHEN VisitDate >= TreatmentStartDate THEN HbA1c END)
      - AVG(CASE WHEN VisitDate < TreatmentStartDate THEN HbA1c END) AS improvement
FROM diabetes_records
GROUP BY PatientID;