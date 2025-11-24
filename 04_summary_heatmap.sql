-- summary_heatmap_hourly_high


CREATE OR REPLACE TABLE
  `nypd-complaints-99906.NYPD_Complaints.summary_heatmap_hourly_high` AS
WITH base AS (
  SELECT
    complaint_dayofweek,
    complaint_hour,
    borough
  FROM `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_enriched`
  WHERE offense_severity = 'High'
    AND complaint_dayofweek IS NOT NULL
    AND complaint_hour IS NOT NULL
    AND borough IS NOT NULL
)
SELECT
  borough,
  complaint_dayofweek,
  complaint_hour,

  COUNT(*) AS complaint_count,
  ROUND(
    100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
    2
  ) AS pct_of_all_high_severity
FROM base
GROUP BY borough,complaint_dayofweek, complaint_hour;
