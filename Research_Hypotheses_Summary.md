# Research Hypotheses Summary

## Study Overview
This analysis tests 8 research hypotheses related to mental health service access among individuals experiencing homelessness in New Orleans.

**Sample Size:** 100 participants  
**Key Outcome Variables:** Mental health service uptake, perceived adequacy of resources  
**Key Exposure Variables:** Barriers to care, time homeless, demographic characteristics  

---

## Hypothesis 1: Barriers and Service Uptake
**H0:** Reported barriers (Lack of insurance/financial resources, Lack of transportation, Stigma/fear of discrimination, Previous negative experiences, Lack of knowledge, Unable to keep medications/appointments, Difficulty navigating system) are not associated with service uptake.

**HA:** Specific barriers are associated with significantly lower odds of accessing mental-health services.

**Questions:** 15, 28, 29, 31, 32, 33, 35, 38

**Statistical Tests:**
- Univariate logistic regression for each barrier
- Multivariate logistic regression adjusting for all barriers
- Forest plots of odds ratios

**Expected Results:** If HA is true, we expect to see odds ratios < 1.0 for barriers, indicating reduced odds of service access.

---

## Hypothesis 2: Service Types and Perceived Adequacy
**H0:** Type of services accessed is not associated with perceived adequacy of resources.

**HA:** Type of services accessed is associated with perceived adequacy.

**Questions:** 18, 35, 36, 28, 41, 38

**Statistical Tests:**
- Chi-square test of independence
- Cross-tabulation analysis

**Expected Results:** If HA is true, we expect to see different patterns of perceived adequacy across service types.

---

## Hypothesis 3: Adequacy Perceptions Across Subgroups
**H0:** There is no difference in perceptions of adequacy of resources across subgroups (housing status, gender, age).

**HA:** Perceptions of adequacy differ across subgroups.

**Questions:** 3, 4, 1, 8, 9

**Statistical Tests:**
- Chi-square tests for each subgroup comparison
- Subgroup analysis by gender, age group, housing status

**Expected Results:** If HA is true, we expect significant differences in adequacy perceptions between groups.

---

## Hypothesis 4: MH Diagnosis Predicting Adequacy
**H0:** Mental health diagnosis type/duration does not predict perceptions of whether there are enough mental healthcare resources for unhoused individuals.

**HA:** Mental health diagnosis type/duration predicts perceptions of adequacy.

**Questions:** 12, 13, 28, 33, 35, 52-58, 41, 36

**Statistical Tests:**
- Chi-square test for diagnosis type vs adequacy
- Analysis of diagnosis duration vs adequacy

**Expected Results:** If HA is true, we expect different adequacy perceptions based on diagnosis characteristics.

---

## Hypothesis 5: Time Homeless vs MH Diagnosis Duration
**H0:** Time homeless is not associated with length of time experiencing a mental health diagnosis.

**HA:** Time homeless is associated with length of time experiencing a mental health diagnosis.

**Questions:** 7, 12, 52-58, 13, 49-51

**Statistical Tests:**
- Pearson correlation coefficient
- One-way ANOVA by time homeless categories

**Expected Results:** If HA is true, we expect a positive correlation between time homeless and diagnosis duration.

---

## Hypothesis 6: Time Homeless vs Service Access
**H0:** Time homeless is not associated with whether participants accessed mental health services.

**HA:** Time homeless is associated with whether participants accessed mental health services.

**Questions:** 7, 15, 16, 28-31, 37, 38, 41

**Statistical Tests:**
- Chi-square test
- Logistic regression

**Expected Results:** If HA is true, we expect different service access rates across time homeless categories.

---

## Hypothesis 7: Time Homeless vs Perceived Adequacy
**H0:** Time homeless is not associated with perceived adequacy of resources.

**HA:** Time homeless is associated with perceived adequacy of resources.

**Questions:** 7, 36, 35, 41

**Statistical Tests:**
- Chi-square test
- Ordinal logistic regression (if applicable)

**Expected Results:** If HA is true, we expect different adequacy perceptions across time homeless categories.

---

## Hypothesis 8: Service Types Distribution by Time Homeless
**H0:** The distribution of types of mental health services accessed does not differ by time of homelessness.

**HA:** The distribution of types of mental health services accessed differs by time of homelessness.

**Questions:** 7, 18, 38, 28

**Statistical Tests:**
- Chi-square test of independence

**Expected Results:** If HA is true, we expect different service type patterns across time homeless categories.

---

## Data Analysis Files

### 1. `Data Analysis.R`
- Contains detailed analysis for Hypothesis 1 only
- Includes univariate and multivariate logistic regression
- Creates forest plots and visualizations

### 2. `Comprehensive_Hypothesis_Analysis.R`
- Tests all 8 hypotheses with appropriate statistical tests
- Provides comprehensive results summary
- Creates multiple visualizations

### 3. `Simplified_Hypothesis_Analysis.R`
- Descriptive analysis for all hypotheses
- Easy to run without complex statistical packages
- Good for initial exploration

### 4. `Cleaning Survey Data.R`
- Data cleaning and preprocessing script
- Handles multiselect questions properly
- Creates the final cleaned dataset

---

## Key Variables

### Outcome Variables
- **Service Uptake:** `accessed_care` (1 = Yes, 2 = No)
- **Perceived Adequacy:** `mh_resources_feelings` (1-5 scale)

### Exposure Variables
- **Barriers:** `barrier_*` variables (binary flags)
- **Time Homeless:** `time_homeless` (1-4 categories)
- **Demographics:** `gender`, `age_group`, `race_category`
- **Mental Health:** `mh_category`, diagnosis duration variables

### Control Variables
- **Housing Status:** `sleep_setting`
- **Service Types:** `services_category`
- **Support Received:** `support_category`

---

## Expected Clinical Implications

If significant associations are found:

1. **Barrier-Specific Interventions:** Target the most significant barriers to service access
2. **Time-Sensitive Care:** Develop interventions for those homeless longer
3. **Subgroup-Tailored Approaches:** Customize services based on demographic characteristics
4. **Resource Allocation:** Focus resources where perceived adequacy is lowest

---

## Statistical Power Considerations

- **Sample Size:** 100 participants provides adequate power for medium to large effect sizes
- **Multiple Testing:** Consider Bonferroni correction for multiple comparisons
- **Effect Sizes:** Report confidence intervals and effect sizes alongside p-values

---

## Limitations

1. **Cross-sectional Design:** Cannot establish causality
2. **Self-reported Data:** Subject to recall bias and social desirability bias
3. **Convenience Sampling:** May not be representative of all unhoused individuals
4. **Small Sample Size:** Limited power for small effect sizes and subgroup analyses

---

## Next Steps

1. Run the comprehensive analysis script
2. Review results for each hypothesis
3. Identify significant findings
4. Develop targeted interventions based on results
5. Consider follow-up studies with larger samples
