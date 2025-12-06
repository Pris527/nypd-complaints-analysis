--- reporting time lag of complaints

CREATE OR REPLACE TABLE
  `nypd-complaints-99906.NYPD_Complaints.summary_reporting_lag` AS
WITH lags AS (
  SELECT
    borough,
    offense_description,
    -- raw lag in minutes
    TIMESTAMP_DIFF(reported_ts, complaint_from_ts, MINUTE) AS lag_minutes
  FROM `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_enriched`
  WHERE complaint_from_ts IS NOT NULL
    AND reported_ts IS NOT NULL
),
clean_lags AS (
  SELECT
    borough,
    offense_description,
    lag_minutes
  FROM lags
  WHERE lag_minutes >= 0
  -- OPTIONAL: drop extreme outliers > 30 days
  -- AND lag_minutes <= 60 * 24 * 30
),
agg AS (
  SELECT
    borough,
    offense_description,
    APPROX_QUANTILES(lag_minutes, 100)[OFFSET(50)] AS median_lag_minutes,
    COUNT(*) AS complaint_count
  FROM clean_lags
  GROUP BY borough, offense_description
)

SELECT
  borough,
  offense_description,
  median_lag_minutes,
  complaint_count
FROM agg
WHERE complaint_count >= 50;  -- enough data for a stable median
