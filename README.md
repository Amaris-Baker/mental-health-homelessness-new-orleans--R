[README.md](https://github.com/user-attachments/files/22852305/README.md)
# Mental Health Survey Data Analysis

## Project Overview
This repository contains data cleaning and analysis code for a mental health survey conducted with individuals experiencing homelessness in New Orleans.

## Repository Contents

### Code Files
- `Cleaning Survey Data.R` - Complete data cleaning script with multiselect handling
- `Data Analysis.R` - Statistical analysis and visualization code
- `Data_Dictionary.md` - Documentation of all cleaned variables and transformations

### Documentation
- `Research Hypothesis.docx` - Research questions and hypotheses
- `README.md` - This file

## Data Privacy
- **Original survey data is NOT included** in this repository for privacy protection
- Only aggregated results and code are shared
- Raw data contains sensitive health information and must be handled according to HIPAA/privacy guidelines

## Key Features

### Multiselect Question Handling
The cleaning script properly handles multiselect questions by:
- Creating binary flags for each option
- Generating mutually exclusive categories with "Multiple" buckets
- Providing both exclusive and any-selection counts
- Categorizing free-text "Other" responses

### Survey Topics Covered
- Demographics (race, ethnicity, gender, age)
- Homelessness duration and living situations
- Substance use patterns
- Mental health diagnoses and service utilization
- Barriers to mental healthcare access
- Community support services received

## Usage

1. **Data Cleaning**: Run `Cleaning Survey Data.R` to process raw survey data
2. **Analysis**: Use `Data Analysis.R` for statistical analysis and visualizations
3. **Documentation**: Refer to `Data_Dictionary.md` for variable definitions

## Sample Size
- **Total participants**: 100 individuals
- **Mental health service users**: 68 participants (past year)
- **Community support recipients**: 36 participants

## Results Summary
- 85% reported substance use in past month
- 69% had multiple mental health diagnoses
- 74% experienced multiple barriers to care
- 42% strongly disagreed that there are adequate mental health resources for unhoused individuals

## Technical Notes
- Built in R using tidyverse packages
- Handles complex multiselect survey responses
- Includes comprehensive data quality checks
- Reproducible analysis pipeline

## License
This project is for academic/research purposes. Please ensure compliance with data privacy regulations when working with health survey data.
