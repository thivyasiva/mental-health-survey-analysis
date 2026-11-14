-- Mental Health Survey Analysis — schema
-- One table holding the combined survey records.
-- The original analysis used 1,259 records from 4 CSV files.

CREATE TABLE IF NOT EXISTS survey_responses (
    id INTEGER PRIMARY KEY,
    age INTEGER,
    gender TEXT,
    country TEXT,
    self_employed TEXT,
    family_history TEXT,
    treatment TEXT,
    work_interfere TEXT,
    no_employees TEXT,
    remote_work TEXT,
    tech_company TEXT,
    benefits TEXT,
    care_options TEXT,
    wellness_program TEXT,
    seek_help TEXT,
    anonymity TEXT,
    leave TEXT,
    mental_health_consequence TEXT,
    phys_health_consequence TEXT,
    coworkers TEXT,
    supervisor TEXT,
    mental_health_interview TEXT,
    phys_health_interview TEXT,
    mental_vs_physical TEXT,
    obs_consequence TEXT
);
