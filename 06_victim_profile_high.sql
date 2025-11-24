--  summary_victim_profile_high

CREATE OR REPLACE TABLE
  `nypd-complaints-99906.NYPD_Complaints.summary_victim_profile_high` AS
WITH base AS (
  SELECT
    -- Fix borough
    COALESCE(borough, 'Unknown') AS borough,

    UPPER(TRIM(vic_age_group)) AS vic_age_raw,
    victim_gender,
    vic_race
  FROM `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_enriched`
  WHERE offense_severity = 'High'
    AND victim_gender IS NOT NULL
    AND vic_age_group IS NOT NULL
),

bucketed AS (
  SELECT
    borough,
    victim_gender,
    vic_race,
    CASE
      WHEN vic_age_raw IN ('<18','UNDER 18','0-17','0 – 17','0-18') THEN '<18'
      WHEN vic_age_raw IN ('18-24','18 – 24','18 TO 24','18','19','20','21','22','23','24') THEN '18–24'
      WHEN vic_age_raw IN ('25-44','25 – 44','25 TO 44')
         OR vic_age_raw IN ('25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44')
         THEN '25–44'
      WHEN vic_age_raw IN ('45-64','45 – 64','45 TO 64')
         OR vic_age_raw IN ('45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','64')
         THEN '45–64'
      WHEN vic_age_raw IN ('65+','65 +','65 AND OVER')
         OR vic_age_raw IN ('65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83','84','85','86','87','88','89','90')
         THEN '65+'
      ELSE 'Unknown'
    END AS victim_age_bucket
  FROM base
)

SELECT
  borough,
  victim_age_bucket,
  victim_gender,
  COUNT(*) AS complaint_count
FROM bucketed
GROUP BY borough, victim_age_bucket, victim_gender;
