# NYPD Complaints Analysis — Data Insights for Public Safety
**Using BigQuery and Tableau to reveal temporal, spatial, and behavioural patterns in NYC police reporting**

---

## ⭐ Summary — What This Project Demonstrates

This project showcases my ability to:

- Analyse and model **multi-million-row datasets** using BigQuery SQL  
- Engineer features that **reveal behaviour**, not just numbers  
- Build decision-support dashboards using **Tableau**  
- Transform noisy raw data into **clear operational insights**  
- Apply **mixed-method thinking** grounded in community context  

It reflects analytics capability applied to a real-world public sector dataset.

---

## 📌 Why This Matters — The Problem

Police complaints tell more than where crime happens. They reveal:

- **Who feels safe reporting**
- **When communities are most at risk**
- **How quickly incidents reach authorities**

However — reporting behaviour is uneven, timestamps are inconsistent, and raw records are **too large to analyse without robust engineering**.

NYC needs visibility into:

> 🧩 *Who is affected, when, and why — to improve community safety decisions.*

This **exploratory data analysis** reveals temporal + demographic reporting patterns that could strengthen resource planning across boroughs. The chart below illustrates monthly complaint patterns in different boroughs. 

![monthly_complaints](Images/Line_chart.jpeg)

---

## 🎯 Objectives

This project answers five operational questions:

1. How do complaint volumes change over time and by borough?  
2. Which offenses most drive police workload?  
3. When are communities most at risk?  
4. Which crimes experience delayed reporting — and where?  
5. Who is most vulnerable based on demographic patterns?

These insights connect **incident data** with **public safety strategy**.

---

## 🧠 Tech Stack

| Layer                         | Tools |
|------------------------------|------|
| Data Warehouse               | BigQuery (Partitioning + Clustering) |
| Cleaning & Feature Engineering | SQL (standard functions, CASE, SAFE_CAST) |
| Analytics & Visualisation    | Tableau Public |
| Storage                      | Google Cloud Storage |
| Versioning                  | Git + GitHub |

---

## 🔄 Data Pipeline Overview

Raw data: **~3GB NYPD complaint history (3 years)**  
Loaded into BigQuery for scalable transformation.

### Key Engineering Components

| Step | Description | Value |
|------|-------------|------|
| Standardisation | Unified timestamps, normalized text fields | Prevent broken time trends |
| Feature Engineering | Derived hour, day, season, severity, weekend flags | Enables behavioural insight |
| Reporting Lag Correction | Removed negative/invalid delays | Accurate timeliness metrics |
| Offense Segmentation | High vs low frequency categories | Focus on operationally relevant crime |
| Victim Demographics | Normalised age groups | Clear vulnerability patterns |
| Aggregation to Summary Tables | Pushdown processing → Tableau | Performance for rich visuals |

⚠️ Note: Tableau Public size limits required optimisation to avoid degraded dashboard performance.

---

## 📊 Dashboard Features

🔗 Live dashboard:  
https://public.tableau.com/app/profile/presca.evans/viz/NYPDComplaintsdata2/Dashboard22

| Visual | What It Shows | Who It Helps |
|-------|---------------|--------------|
| Daily Trend Line | Demand over time | City leadership |
| Top Offenses Bar | Drivers of police workload | Resource planners |
| Hourly x Day Heatmap | Crime rhythms | Shift schedulers |
| Reporting Lag Quadrants | Where reporting barriers exist | Community safety teams |
| Victim Profiles | Population exposure | Equity & prevention programs |

Screenshots included in `Images` folder.

---

## 🔍 Key Insights

### 🚨 Crime follows social rhythms
- **Evening + weekend surges** across boroughs  
→ Staffing models could better align with community activity patterns.

### 🏙 Brooklyn + Manhattan drive most reports
- Highest volumes correlate with **population density + mobility**

### 🕒 Some offenses are reported much later
- Reporting lags differ by **borough + offense**
- Indicates **access, trust, or logistical barriers**

### 👥 Victims are predominantly adults 25–64
- Reflects everyday civilian exposure
- Men slightly over-represented in complaints

### 🧭 Operational takeaway
> **Patterns are predictable** → risk can be anticipated, not just reacted to.

---

## 🚀 Future Enhancements

This project is built for further iteration. Next phase improvements:

| Category | Enhancement | Benefit |
|---------|-------------|--------|
| Geospatial Insight | Borough & precinct map layers | Place-based strategy |
| Social Context | Integrate income, density, housing indicators | Understand *why* crime varies |
| Temporal Modelling | Seasonality analysis & forecast trends | Proactive deployment |
| Demographic Depth | Race × age × borough intersection | Targeted prevention |
| Automation | Scripted refresh of BigQuery summary tables | Minimal maintenance |
| Narratives | Borough-specific mini case studies | Human-centred storytelling |

My qualitative background strengthens interpretation — not just number crunching.

---

## 📂 Repository Structure

nypd-complaints-analysis
│
├─ README.md
├─ sql_scripts
│ ├─ 01_ingest.sql
│ ├─ 02_clean_transform.sql
│ ├─ 03_feature_engineering.sql
│ ├─ 04_summary_tables.sql
│
├─ data
│ └─ summary_tables
│
└─ Images
├─ Line_chart.jpeg




---

## 👤 Author — Dr. Presca Evans

Data Analyst • Mixed-Method Researcher • Public Service Insight  
📍 Relocating to Brisbane QLD — January availability  
💡 Focus: turning data into decisions that improve community outcomes

---

*This project reflects my commitment to combining data analytics with human-centred insight to support safer, fairer cities.*

---
