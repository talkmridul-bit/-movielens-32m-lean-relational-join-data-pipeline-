# -movielens-32m-lean-relational-join-data-pipeline-
"A memory-optimized relational data joining and processing pipeline built for the massive MovieLens 32M dataset. Successfully engineered and executed locally on a constraint-heavy setup (4GB RAM, Core i3) with strict 0 OPEX and zero cloud dependence."


# Resource-Constrained MovieLens 32M Relational Data Joining Pipeline

## 🚀 Project Overview
This project demonstrates an **ultra-lean, high-performance data engineering pipeline** built to clean, pre-aggregate, and relationally join the massive **MovieLens 32M dataset** using **R (Tidyverse)**. 

While enterprise-scale big data workflows typically demand distributed clusters, high-end cloud instances, or 16GB+ RAM workstations, this entire pipeline was architected, optimized, and successfully executed locally under extreme hardware constraints (**0 OPEX / Zero Operational Cost**).

---

## 💻 Hardware Constraints & Environment
* **Processor:** Intel Core i3 (1.2 GHz)
* **RAM:** 4 GB Total (Strict Local Memory Management)
* **Infrastructure:** 100% Local Machine (No Cloud, No Dedicated Server, No Spark Cluster)
* **Tech Stack:** R, Tidyverse (`readr`, `dplyr`), CSV Processing

---

## 📊 Data Pipeline Architecture & Workflow

```text
[Raw Ratings CSV (32M+)] ------> [Data Cleaning & Filtering] ------------┐
                                                                          │-----> [Inner Join on movieId] -----> [Feature Selection & Export]
[Raw Tags CSV]            ------> [Pre-Aggregation & Tag Counting (n())] -┘

    Ingestion & Schema Validation:

        Massive raw datasets are ingested locally using readr::read_csv().

        Data structures and types are inspected via glimpse().

    Data Cleansing & Transformation:

        Ratings Dataset: Stripped duplicates using distinct(), enforced strict data types (integer for IDs, integer for ratings),
and filtered out logical anomalies (> 0).

        Tags Dataset: Cleaned, filtered, and pre-aggregated using group_by(movieId) and summarise() to compute Total_Tags per movie. This crucial pre-aggregation step prevents explosive Cartesian products and memory overflow (OOM) during table joins.

    Optimized Relational Join:

        Performed a high-efficiency inner_join on movieId under strict low-memory thresholds.

    Export & Persistence:

        Selected core metrics (userId, movieId, rating, Total_Tags), filtered unique records, and exported a lightweight, clean analytical dataset (New_dataset_movielens_32M_data_joining_pieline_data.csv).
