-- summary_daily complaints_borough 

CREATE OR REPLACE TABLE
  `nypd-complaints-99906.NYPD_Complaints.summary_daily_borough` AS
WITH base AS (
  SELECT
    complaint_date,
    borough,
    offense_severity,
    is_weekend
  FROM `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_enriched`
  WHERE complaint_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 YEAR)
    AND borough IS NOT NULL
),
agg AS (
  SELECT
    complaint_date,
    borough,
    COUNT(*) AS total_complaints,
    COUNTIF(offense_severity = 'high')   AS high_severity_complaints,
    COUNTIF(offense_severity = 'medium') AS medium_severity_complaints,
    COUNTIF(offense_severity = 'other')  AS other_severity_complaints,
    COUNTIF(is_weekend = TRUE)           AS weekend_complaints
  FROM base
  GROUP BY complaint_date, borough
),
with_ma AS (
  SELECT
    complaint_date,
    borough,
    total_complaints,
    high_severity_complaints,
    medium_severity_complaints,
    other_severity_complaints,
    weekend_complaints,
    ROUND(
      AVG(total_complaints) OVER (
        PARTITION BY borough
        ORDER BY complaint_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
      ),
      2
    ) AS total_complaints_ma7
  FROM agg
)
SELECT * FROM with_ma;
