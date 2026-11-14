"""Generate a small SYNTHETIC sample CSV in the survey format.

This is sample data only, so the SQL in sql/ can be run end-to-end.
It is not the original 1,259 survey records, and no findings from
this sample should be presented as findings from the original data.
"""
import csv
import random

random.seed(42)

ROWS = 20
GENDERS = ["Female", "Male", "Female", "Male", "Non-binary"]
COUNTRIES = ["Canada", "United States", "United Kingdom", "Canada"]
YES_NO = ["Yes", "No"]
WORK_INTERFERE = ["Never", "Rarely", "Sometimes", "Often", ""]

with open("data/sample_survey.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow([
        "id", "age", "gender", "country", "self_employed", "family_history",
        "treatment", "work_interfere", "no_employees", "remote_work",
        "tech_company", "benefits", "care_options", "wellness_program",
        "seek_help", "anonymity", "leave", "mental_health_consequence",
        "phys_health_consequence", "coworkers", "supervisor",
        "mental_health_interview", "phys_health_interview",
        "mental_vs_physical", "obs_consequence",
    ])
    for i in range(1, ROWS + 1):
        writer.writerow([
            i,
            random.randint(20, 55),
            random.choice(GENDERS),
            random.choice(COUNTRIES),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(WORK_INTERFERE),
            random.choice(["1-5", "6-25", "26-100", "100-500"]),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(["Yes", "No", "Not sure"]),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(["Very easy", "Somewhat easy", "Somewhat difficult", "Very difficult"]),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
            random.choice(YES_NO),
        ])

print(f"Wrote {ROWS} synthetic sample rows to data/sample_survey.csv")
