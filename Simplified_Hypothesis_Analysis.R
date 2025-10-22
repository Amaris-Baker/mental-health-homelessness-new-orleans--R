# SIMPLIFIED MENTAL HEALTH SURVEY ANALYSIS
# Testing All 8 Research Hypotheses - Simplified Version
# 
# This script provides a comprehensive analysis of all research hypotheses
# with clear output and interpretations

# Load required packages
suppressPackageStartupMessages({
  library(tidyverse)
  library(knitr)
})

# Load cleaned dataset
cat("=== MENTAL HEALTH SURVEY HYPOTHESIS TESTING ===\n")
cat("Loading data...\n")

data <- read.csv("Survey_Cleaned_Final.csv")
cat("Data loaded successfully. Sample size:", nrow(data), "participants\n\n")

# Data preparation
data <- data %>%
  mutate(
    # Service uptake (binary)
    service_uptake = ifelse(accessed_care == 1, 1, 0),
    service_uptake_factor = factor(service_uptake, levels = c(0, 1), labels = c("No", "Yes")),
    
    # Time homeless categories
    time_homeless_cat = case_when(
      time_homeless == 1 ~ "<6 months",
      time_homeless == 2 ~ "6-12 months", 
      time_homeless == 3 ~ "1-3 years",
      time_homeless == 4 ~ ">3 years",
      TRUE ~ "Unknown"
    ),
    
    # Gender categories
    gender_cat = case_when(
      gender == 1 ~ "Female",
      gender == 2 ~ "Male",
      TRUE ~ "Other"
    ),
    
    # Adequacy perception
    adequacy_cat = case_when(
      mh_resources_feelings == 1 ~ "Strongly disagree",
      mh_resources_feelings == 2 ~ "Somewhat disagree", 
      mh_resources_feelings == 3 ~ "Neutral",
      mh_resources_feelings == 4 ~ "Somewhat agree",
      mh_resources_feelings == 5 ~ "Strongly agree",
      TRUE ~ "Unknown"
    )
  )

# ========================================================================
# HYPOTHESIS 1: BARRIERS AND SERVICE UPTAKE
# ========================================================================
cat("HYPOTHESIS 1: BARRIERS AND SERVICE UPTAKE\n")
cat("==========================================\n")
cat("H0: Reported barriers are not associated with service uptake\n")
cat("HA: Specific barriers are associated with significantly lower odds of accessing services\n\n")

# Service uptake summary
service_summary <- table(data$service_uptake_factor)
cat("Service uptake distribution:\n")
print(service_summary)
cat("Percentage accessing services:", round(prop.table(service_summary)[2] * 100, 1), "%\n\n")

# Barrier analysis
barrier_vars <- c("barrier_insurance", "barrier_transportation", "barrier_stigma", 
                  "barrier_negative_experiences", "barrier_lack_knowledge", 
                  "barrier_meds_appointments", "barrier_navigation")

cat("Barrier prevalence:\n")
for(var in barrier_vars) {
  if(var %in% names(data)) {
    barrier_summary <- table(data[[var]])
    barrier_pct <- round(prop.table(barrier_summary)[2] * 100, 1)
    cat("-", gsub("barrier_", "", var), ":", barrier_pct, "%\n")
  }
}
cat("\n")

# ========================================================================
# HYPOTHESIS 2: SERVICE TYPES AND PERCEIVED ADEQUACY
# ========================================================================
cat("HYPOTHESIS 2: SERVICE TYPES AND PERCEIVED ADEQUACY\n")
cat("===================================================\n")
cat("H0: Type of services accessed is not associated with perceived adequacy\n")
cat("HA: Type of services accessed is associated with perceived adequacy\n\n")

if("services_category" %in% names(data)) {
  service_dist <- table(data$services_category)
  cat("Service types accessed:\n")
  print(service_dist)
  cat("\n")
}

if("mh_resources_feelings" %in% names(data)) {
  adequacy_dist <- table(data$adequacy_cat)
  cat("Perceived adequacy of resources:\n")
  print(adequacy_dist)
  cat("\n")
}

# ========================================================================
# HYPOTHESIS 3: ADEQUACY PERCEPTIONS ACROSS SUBGROUPS
# ========================================================================
cat("HYPOTHESIS 3: ADEQUACY PERCEPTIONS ACROSS SUBGROUPS\n")
cat("==================================================\n")
cat("H0: No difference in perceptions of adequacy across subgroups\n")
cat("HA: Perceptions of adequacy differ across subgroups\n\n")

# By gender
if("gender" %in% names(data)) {
  cat("Adequacy perceptions by gender:\n")
  gender_adequacy <- table(data$gender_cat, data$adequacy_cat)
  print(gender_adequacy)
  cat("\n")
}

# By age group
if("age_group" %in% names(data)) {
  cat("Adequacy perceptions by age group:\n")
  age_adequacy <- table(data$age_group, data$adequacy_cat)
  print(age_adequacy)
  cat("\n")
}

# ========================================================================
# HYPOTHESIS 4: MH DIAGNOSIS TYPE/DURATION PREDICTING ADEQUACY
# ========================================================================
cat("HYPOTHESIS 4: MH DIAGNOSIS TYPE/DURATION PREDICTING ADEQUACY\n")
cat("============================================================\n")
cat("H0: Mental health diagnosis type/duration does not predict perceptions of adequacy\n")
cat("HA: Mental health diagnosis type/duration predicts perceptions of adequacy\n\n")

if("mh_category" %in% names(data)) {
  cat("Mental health diagnoses:\n")
  mh_dist <- table(data$mh_category)
  print(mh_dist)
  cat("\n")
}

# ========================================================================
# HYPOTHESIS 5: TIME HOMELESS VS MH DIAGNOSIS DURATION
# ========================================================================
cat("HYPOTHESIS 5: TIME HOMELESS VS MH DIAGNOSIS DURATION\n")
cat("====================================================\n")
cat("H0: Time homeless is not associated with length of time experiencing MH diagnosis\n")
cat("HA: Time homeless is associated with length of time experiencing MH diagnosis\n\n")

cat("Time homeless distribution:\n")
time_dist <- table(data$time_homeless_cat)
print(time_dist)
cat("\n")

# ========================================================================
# HYPOTHESIS 6: TIME HOMELESS VS ACCESSING SERVICES
# ========================================================================
cat("HYPOTHESIS 6: TIME HOMELESS VS ACCESSING SERVICES\n")
cat("=================================================\n")
cat("H0: Time homeless is not associated with accessing mental health services\n")
cat("HA: Time homeless is associated with accessing mental health services\n\n")

cat("Service access by time homeless:\n")
time_service <- table(data$time_homeless_cat, data$service_uptake_factor)
print(time_service)

# Calculate percentages
time_service_pct <- prop.table(time_service, margin = 1) * 100
cat("\nPercentages by row:\n")
print(round(time_service_pct, 1))
cat("\n")

# ========================================================================
# HYPOTHESIS 7: TIME HOMELESS VS PERCEIVED ADEQUACY
# ========================================================================
cat("HYPOTHESIS 7: TIME HOMELESS VS PERCEIVED ADEQUACY\n")
cat("=================================================\n")
cat("H0: Time homeless is not associated with perceived adequacy of resources\n")
cat("HA: Time homeless is associated with perceived adequacy of resources\n\n")

cat("Perceived adequacy by time homeless:\n")
time_adequacy <- table(data$time_homeless_cat, data$adequacy_cat)
print(time_adequacy)
cat("\n")

# ========================================================================
# HYPOTHESIS 8: SERVICE TYPES DISTRIBUTION BY TIME HOMELESS
# ========================================================================
cat("HYPOTHESIS 8: SERVICE TYPES DISTRIBUTION BY TIME HOMELESS\n")
cat("========================================================\n")
cat("H0: Distribution of service types does not differ by time of homelessness\n")
cat("HA: Distribution of service types differs by time of homelessness\n\n")

if("services_category" %in% names(data)) {
  cat("Service types by time homeless:\n")
  time_services <- table(data$time_homeless_cat, data$services_category)
  print(time_services)
  cat("\n")
}

# ========================================================================
# SUMMARY STATISTICS
# ========================================================================
cat("SUMMARY STATISTICS\n")
cat("==================\n")

# Demographics
cat("Sample Demographics:\n")
cat("- Total participants:", nrow(data), "\n")
cat("- Female:", sum(data$gender == 1, na.rm = TRUE), "\n")
cat("- Male:", sum(data$gender == 2, na.rm = TRUE), "\n")
cat("- Other gender:", sum(data$gender == 3, na.rm = TRUE), "\n")

if("age_group" %in% names(data)) {
  age_summary <- table(data$age_group)
  cat("\nAge distribution:\n")
  print(age_summary)
}

# Key findings
cat("\nKey Findings:\n")
cat("- Percentage accessing mental health services:", 
    round(sum(data$accessed_care == 1, na.rm = TRUE) / nrow(data) * 100, 1), "%\n")

if("mh_resources_feelings" %in% names(data)) {
  disagree_pct <- sum(data$mh_resources_feelings <= 2, na.rm = TRUE) / 
                  sum(!is.na(data$mh_resources_feelings)) * 100
  cat("- Percentage who disagree/strongly disagree that resources are adequate:", 
      round(disagree_pct, 1), "%\n")
}

if("barrier_num_selected" %in% names(data)) {
  avg_barriers <- mean(data$barrier_num_selected, na.rm = TRUE)
  cat("- Average number of barriers reported:", round(avg_barriers, 1), "\n")
}

cat("\n=== ANALYSIS COMPLETE ===\n")
cat("This simplified analysis provides descriptive statistics for all 8 hypotheses.\n")
cat("For statistical testing (chi-square, logistic regression, etc.), use the comprehensive analysis script.\n")
