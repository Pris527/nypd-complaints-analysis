-- summary_offense_borough_recent

CREATE OR REPLACE TABLE
  `nypd-complaints-99906.NYPD_Complaints.summary_offense_borough_recent` AS
WITH recent AS (
  SELECT
    borough,
    offense_description,
    offense_severity
  FROM `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_enriched`
  WHERE complaint_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)
    AND borough IS NOT NULL
    AND offense_description IS NOT NULL
),
by_borough_offense AS (
  SELECT
    borough,
    offense_description,
    offense_severity,
    COUNT(*) AS complaint_count,
    SUM(COUNT(*)) OVER (PARTITION BY borough) AS borough_total,
    RANK() OVER (
      PARTITION BY borough
      ORDER BY COUNT(*) DESC
    ) AS borough_rank
  FROM recent
  GROUP BY borough, offense_description, offense_severity
)
SELECT
  borough,
  offense_description,
  offense_severity,
  complaint_count,
  borough_total,
  ROUND(100.0 * complaint_count / borough_total, 2) AS pct_of_borough,
  borough_rank
FROM by_borough_offense
WHERE borough_rank <= 10;
