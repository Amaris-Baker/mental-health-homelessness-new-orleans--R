# Survey Data Cleaning - Data Dictionary

## Dataset Overview
- **Original file**: HTC Mental Health_September 12, 2025_08.59.csv
- **Cleaned file**: Survey_Cleaned_Final.csv
- **Total observations**: 100 participants
- **Cleaning date**: [Current date]

## Key Transformations Applied

### 1. Data Preprocessing
- Removed Qualtrics metadata (rows 1-2, columns 1-18)
- Removed incomplete observation (row 88)
- **Final sample**: 100 participants

### 2. Demographic Variables

#### Gender (Q3 → gender)
- 1 = Female (17)
- 2 = Male (82) 
- 3 = Other/Bisexual (1)

#### Ethnicity (Q61 → ethnicity)
- 1 = Hispanic or Latino (15)
- 2 = Non-Hispanic or Latino (80)
- 3 = Prefer not to say (5)

#### Race (Q5 → race_category, multiselect)
**Exclusive categories:**
- White (43)
- Black or African American (44)
- Multiracial (2)
- American Indian or Alaska Native (2)
- Asian (1)
- Other (7)
- Prefer not to say (1)

**Binary flags created**: race_white, race_black, race_ai_an, race_asian, race_prefer_not, race_other

### 3. Homelessness Variables

#### Time Homeless (Q7 → time_homeless)
- 1 = Less than 6 months (26)
- 2 = 6 months to less than 1 year (11)
- 3 = 1 to 3 years (33)
- 4 = More than 3 years (30)

#### Sleep Setting (Q8 → sleep_setting)
- 1 = Shelter (33)
- 2 = Outdoors (60)
- 3 = Other (6)
- 4 = Car (1)

### 4. Substance Use Variables
- **Tobacco use**: 77 Yes, 23 No
- **Alcohol use**: 50 Yes, 50 No
- **Other drugs**: 46 Yes, 54 No
- **Any substance use**: 85 Yes, 15 No

### 5. Mental Health Variables

#### Mental Health Diagnoses (Q12 → mh_category, multiselect)
**Exclusive categories:**
- Multiple (69)
- Depression (70)
- Anxiety disorder (50)
- Bipolar disorder (41)
- Schizophrenia (21)
- PTSD (38)
- Other (27)
- Prefer not to say (1)

#### Mental Health Services Accessed (Q18 → services_category, multiselect)
**Exclusive categories:**
- Multiple (varies)
- ACT Team, Therapy/Counseling, Emergency Room, Inpatient Voluntary, Inpatient Involuntary, Medication Management, Outpatient Program, Other

#### Service Interruption Causes (Q31 → interruption_category, multiselect)
**Exclusive categories:**
- Multiple causes
- Incarceration, Poor connection from discharge, Missed appointments, Dropped by provider, Lost medications, Medication side effects, Chose to stop, Never accessed services, Other

### 6. Barriers to Care (Q33 → barrier_category, multiselect)
**Exclusive categories:**
- Multiple barriers (74)
- Insurance/Financial (45)
- Transportation (60)
- Stigma/Discrimination (27)
- Negative experiences (31)
- Lack of knowledge (55)
- Medications/Appointments (44)
- System navigation (41)
- Other (26)
- Prefer not to say (6)

### 7. Support Services (Q38 → support_category, multiselect)
**For 36 participants who received support:**
- Food, Hygiene, Housing assistance, Employment assistance, Case management, Benefits assistance, Other

## Multiselect Question Handling
All multiselect questions were processed using:
1. **Binary flags** for each option
2. **Exclusive categories** with "Multiple" bucket for people selecting multiple options
3. **Any-selection counts** showing total selections across all participants
4. **Free-text categorization** for "Other" responses

## File Outputs
- `Survey_Cleaned_Final.csv`: Cleaned dataset for analysis
- `Survey_Cleaned_Final.rds`: R data file (preserves data types)

## Quality Control
- All transformations documented with counts
- Missing data handled appropriately
- Multiselect questions ensure everyone is counted
- Free-text responses categorized for analysis
