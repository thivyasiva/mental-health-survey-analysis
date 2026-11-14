# Mental Health Survey Analysis

Solo project by Thivya Siva — Toronto Metropolitan University, Bachelor of Commerce, Business Technology Management (minor in Computer Science), expected April 2027.

Analysis of **1,259 mental health survey records** with **SQL and SQLite**, exploring demographic and treatment patterns.

## What it is

The original analysis combined **4 CSV files** into a single SQLite database and queried it to explore how survey respondents' demographics relate to seeking treatment for mental health.

This repository contains the full analysis workflow, rebuilt from the project description:

- `sql/schema.sql` — the table definition used for the survey data
- `sql/analysis.sql` — the analysis queries: joins, filters, `CASE` expressions, aggregations and views
- `generate_sample_data.py` — generates a small synthetic sample CSV in the same format, so the queries can be run end-to-end without the original survey files
- `data/sample_survey.csv` — a small synthetic sample (clearly labelled as sample data)

> **Note on data:** the original 1,259 survey records are not included in this repository. The sample data here is synthetic and is provided only so the SQL can be run and inspected. No results in this README are claimed from the original dataset beyond what is described in the project summary.

## Skills

SQL, SQLite, joins, filters, `CASE` expressions, aggregations, views, data cleaning.

## How to run

```bash
# 1. (Optional) regenerate the sample data
python3 generate_sample_data.py

# 2. Create the database and load the sample data
sqlite3 mental_health.db < sql/schema.sql
sqlite3 mental_health.db ".mode csv" ".import data/sample_survey.csv survey_responses --skip 1"

# 3. Run the analysis queries
sqlite3 mental_health.db < sql/analysis.sql
```

Or run a single query at a time from `sql/analysis.sql` in any SQLite client (e.g. DB Browser for SQLite).

## What the analysis explores

- How many respondents sought treatment, overall and by age group and gender
- Treatment rates by family history of mental illness
- How work interference relates to seeking treatment
- Whether respondents work at a tech company / remotely, and how that relates to treatment
- Summary views that can be reused for reporting

## Files

| File | Description |
| --- | --- |
| `sql/schema.sql` | `survey_responses` table definition |
| `sql/analysis.sql` | Analysis queries and views |
| `generate_sample_data.py` | Synthetic sample-data generator |
| `data/sample_survey.csv` | Synthetic sample data (not the original survey) |
