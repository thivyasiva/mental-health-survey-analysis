-- Mental Health Survey Analysis — analysis queries
-- Run against the survey_responses table created by schema.sql.
-- Uses joins (self-join example), filters, CASE expressions,
-- aggregations and views, as in the original project.

-- 1. Overall treatment rate
SELECT
    COUNT(*) AS total_respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment,
    ROUND(100.0 * SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS treatment_pct
FROM survey_responses;

-- 2. Treatment by age group (CASE expression + aggregation)
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END AS age_group,
    COUNT(*) AS respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment,
    ROUND(100.0 * SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS treatment_pct
FROM survey_responses
WHERE age BETWEEN 18 AND 100
GROUP BY age_group
ORDER BY age_group;

-- 3. Treatment by gender
SELECT
    gender,
    COUNT(*) AS respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment
FROM survey_responses
GROUP BY gender
ORDER BY respondents DESC;

-- 4. Family history and treatment
SELECT
    family_history,
    COUNT(*) AS respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment,
    ROUND(100.0 * SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS treatment_pct
FROM survey_responses
GROUP BY family_history;

-- 5. Work interference and treatment (filtered to respondents who answered)
SELECT
    work_interfere,
    COUNT(*) AS respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment
FROM survey_responses
WHERE work_interfere IS NOT NULL AND work_interfere != ''
GROUP BY work_interfere
ORDER BY respondents DESC;

-- 6. Tech company / remote work and treatment
SELECT
    tech_company,
    remote_work,
    COUNT(*) AS respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment
FROM survey_responses
GROUP BY tech_company, remote_work
ORDER BY tech_company, remote_work;

-- 7. Reusable view: treatment summary by age group and gender
CREATE VIEW IF NOT EXISTS treatment_by_age_gender AS
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END AS age_group,
    gender,
    COUNT(*) AS respondents,
    SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) AS sought_treatment
FROM survey_responses
WHERE age BETWEEN 18 AND 100
GROUP BY age_group, gender;

SELECT * FROM treatment_by_age_gender ORDER BY age_group, gender;

-- 8. Reusable view: support and benefits summary
CREATE VIEW IF NOT EXISTS support_summary AS
SELECT
    benefits,
    care_options,
    wellness_program,
    COUNT(*) AS respondents
FROM survey_responses
GROUP BY benefits, care_options, wellness_program;

SELECT * FROM support_summary ORDER BY respondents DESC LIMIT 10;
