CREATE OR REPLACE TABLE
  `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_cleaned` AS
SELECT
  -- Identifiers & timestamps
  complaint_number,
  complaint_from_ts,
  complaint_date,
  complaint_time,
  complaint_to_ts,
  complaint_to_date,
  complaint_to_time,
  precinct_code,
  reported_ts,
  offense_code,

  -- Converted to Capitalized Case
  INITCAP(offense_description) AS offense_description,
  INITCAP(attempted_or_completed) AS attempted_or_completed,
  INITCAP(law_category) AS law_category,
  INITCAP(borough) AS borough,
  INITCAP(location_description) AS location_description,
  INITCAP(premise_type) AS premise_type,
  INITCAP(jurisdiction) AS jurisdiction,
  INITCAP(suspect_age_group) AS suspect_age_group,
  INITCAP(suspect_race) AS suspect_race,
  INITCAP(VIC_RACE) AS vic_race,
  INITCAP (VIC_SEX) AS vic_sex,
  INITCAP(VIC_AGE_GROUP) AS vic_age_group,

  -- Standardized victim sex
  CASE 
    WHEN vic_sex = 'M' THEN 'Male'
    WHEN vic_sex = 'F' THEN 'Female'
    ELSE 'Unknown'
  END AS victim_gender,


  -- Coordinates unchanged
  x_coord,
  y_coord,
  latitude,
  longitude,
  location_geog,


   FROM `nypd-complaints-99906.NYPD_Complaints.NYPD_Complaints_staging`
