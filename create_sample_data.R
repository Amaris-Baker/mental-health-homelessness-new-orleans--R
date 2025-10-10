# Create sample data for demonstration purposes
# This file creates anonymized sample data that demonstrates the structure
# without containing any real participant information

library(tidyverse)

# Create sample data with same structure but no real responses
set.seed(123)
n <- 100

sample_survey <- data.frame(
  # Demographics
  gender = sample(c(1, 2, 3), n, replace = TRUE, prob = c(0.17, 0.82, 0.01)),
  ethnicity = sample(c(1, 2, 3), n, replace = TRUE, prob = c(0.15, 0.80, 0.05)),
  race_category = sample(c("White", "Black or African American", "Multiracial", 
                          "American Indian or Alaska Native", "Asian", "Other", "Prefer not to say"), 
                        n, replace = TRUE, prob = c(0.43, 0.44, 0.02, 0.02, 0.01, 0.07, 0.01)),
  
  # Homelessness
  time_homeless = sample(1:4, n, replace = TRUE, prob = c(0.26, 0.11, 0.33, 0.30)),
  sleep_setting = sample(c("1", "2", "3", "4"), n, replace = TRUE, prob = c(0.33, 0.60, 0.06, 0.01)),
  
  # Substance use
  any_substance_use = sample(c(0, 1), n, replace = TRUE, prob = c(0.15, 0.85)),
  
  # Mental health
  mh_category = sample(c("Multiple", "Depression", "Anxiety disorder", "Bipolar disorder", 
                        "Schizophrenia", "PTSD", "Other", "Prefer not to say"), 
                      n, replace = TRUE, prob = c(0.69, 0.70, 0.50, 0.41, 0.21, 0.38, 0.27, 0.01)),
  
  # Healthcare access
  accessed_care = sample(c(1, 2), n, replace = TRUE, prob = c(0.68, 0.32)),
  
  # Barriers (simplified)
  barrier_category = sample(c("Multiple barriers", "Insurance/Financial", "Transportation", 
                             "Stigma/Discrimination", "Negative experiences", "Lack of knowledge"), 
                           n, replace = TRUE, prob = c(0.74, 0.45, 0.60, 0.27, 0.31, 0.55)),
  
  # Support
  support = sample(c(1, 2), n, replace = TRUE, prob = c(0.36, 0.64))
)

# Save sample data
write.csv(sample_survey, "sample_survey_data.csv", row.names = FALSE)

cat("Sample data created: sample_survey_data.csv\n")
cat("This file demonstrates the data structure without real participant information.\n")
