# Lab 4 Rubric: *Data Processing (Part 2) – Merging Datasets*

**Total points:** 100  
**Grading philosophy:**  

- Emphasis on understanding merge strategies and data quality validation  
- Technical correctness matters, but reasoning about joins is paramount  
- Partial credit encouraged  
- Penalize vague responses that avoid discussing join types or merge consequences  

---

## Section A: Data Preparation & Reshaping (20 points)

### Q1. Identifying Untidy Structure in BEA Data (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly identifies wide format AND articulates specific challenges for merging (different row structure, multiple year columns) |
| 6–8   | Notes untidy structure but explanation is incomplete or generic |
| 3–5   | Mentions years as columns but limited reasoning about merge challenges |
| 0–2   | Vague or missing |

**Key indicators:**

- Recognizes that years (2000–2024) are spread across columns instead of rows
- Counts or estimates the number of year columns
- Explains that this structure prevents direct matching with long-format datasets (corn, drought)

---

### Q2. Data Type Conversion Importance (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Clearly explains why numeric year is essential |
| 6–8   | Identifies importance of numeric conversion but examples are generic |
| 3–5   | Mentions data type but reasoning is incomplete |
| 0–2   | No meaningful response |

**Look for evidence of:**

- Understanding that character year can't match numeric year across datasets
- Awareness that character sorting alphabetically would produce wrong order
- Discussion of how this causes merge failures (no matches found)

---

## Section B: Understanding Data Integration (20 points)

### Q3. Identifying Key Merge Variables (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly identifies common variables across all three datasets  |
| 6–8   | Identifies most key variables but reasoning is incomplete |
| 3–5   | Lists some variables but confusion about which exist in which dataset |
| 0–2   | Incorrect or missing |

**Key indicators:**

- Recognizes `year` is common across all three datasets (and should be numeric)
- Notes that state abbreviation appears in all three but with different names (`state_alpha`, `StateAbbreviation`, `state_abr`)
- Understands that these are the *only* join keys available

---

### Q4. Left Join Scenario & Year Coverage (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly predicts outcome for both year ranges AND explains why (no match = NA) |
| 6–8   | Correct predictions but explanation is incomplete |
| 3–5   | Partial understanding of join behavior |
| 0–2   | Incorrect or confused |

**Look for evidence of:**

- Recognition that years before 2000 in BEA would NOT appear (corn yield doesn't go back that far)
- Understanding that years 2000–2024 would add BEA data to corn yield rows where available
- Clarity that unmatched rows from BEA (pre-2000) are discarded in left join
- Awareness that corn yield rows without BEA matches would have `NA` for farm_gdp

---

## Section C: Merging & Data Quality Validation (30 points)

### Q5. Merge Outcome: Row Count & Observation Loss (12 points)

| Score | Criteria |
|-:|------------------|
| 11–12 | Correctly states merged row count AND explains whether/why observations were lost |
| 8–10  | Mostly correct with minor reasoning gaps |
| 5–7   | Identifies row count but explanation is incomplete |
| 0–4   | Missing calculations or incorrect |

**Key indicators:**

- Provides actual row counts for comparison
- Recognizes that `inner_join` keeps only state-years present in *both* datasets
- Explains that small states or non-agricultural regions may not have drought data
- Distinguishes between data not matching vs. data not existing

---

### Q6. Implications of Duplicate State-Year Combinations (11 points)

| Score | Criteria |
|-:|------------------|
| 10–11 | Clearly defines duplicates AND articulates specific analytical consequences |
| 7–9   | Identifies what duplicates mean but analytical impact is vague |
| 4–6   | Notes duplicates but reasoning is weak |
| 0–3   | Missing or incorrect |

**Look for evidence of:**

- Recognition that duplicates violate the assumption of one observation per state-year
- Understanding that duplicates could arise from:
  - Multiple entries per year in source data (not collapsed before merge)
  - Merge key misspecification (accidentally matching on subsets of keys)
- Discussion of analytical problems:
  - Biased estimates (weights states unequally)
  - Inflated sample size
  - Incorrect standard errors

---

### Q7. Join Type Selection: Left vs. Inner Join (7 points)

| Score | Criteria |
|-:|------------------|
| 6–7   | Clearly articulates why `left_join` was chosen AND explains inner_join consequences |
| 4–5   | Correct reasoning but some nuance is missing |
| 5–7   | Identifies difference but incomplete justification |
| 0–4   | Confused or missing |

**Look for evidence of:**

- Recognition that `left_join` preserves all corn-drought observations (our primary dataset)
- Understanding that `inner_join` would remove state-years without BEA data (loss of information)
- Discussion of when `inner_join` would be appropriate (only if BEA is complete for all states/years)
- Awareness of trade-off: `left_join` introduces `NA` values but retains full corn-drought sample

---

## Section D: Analytical Thinking & Synthesis (15 points)

### Q8. Research Question → Data Decisions → Analysis (15 points)

| Score | Criteria |
|-:|------------------|
| 13–15 | Clearly traces how research question drove reshaping, merging choices AND proposes some form of analyses |
| 10–12 | Good flow from question to decisions; analyses may be a bit generic |
| 6–9   | Addresses question but weak connection to merge decisions or analyses |
| 0–5   | Minimal engagement or off-topic |

**Look for evidence of:**

- Explicit reference to the drought-yield-GDP research question
- Explanation of how this question motivated:
  - Reshaping BEA to long format (to match other datasets)
  - Choosing left join (to preserve corn-yield observations)
  - Aggregating drought to annual level (to align with annual yield and GDP)
- Proposed analyses (but do not be overly critical as the students have little experience at this point in the course):
  - Regression of yield on drought severity
  - Correlation between drought impact and farm GDP sensitivity
  - State-level heterogeneity in drought-yield relationship
- Recognition that merge strategy constrains which analyses are possible

---

## Section E: Code Quality & Documentation (10 points)

### Code & Log File

| Score | Criteria |
|-:|------------------|
| 9–10  | All code runs without errors; logical workflow; thorough comments; complete and clean log file |
| 6–8   | Code runs mostly; adequate comments; minor formatting issues in log |
| 3–5   | Code has minor errors or incomplete comments; log present but messy |
| 0–2   | Code does not run or log file is missing/unusable |

**Look for evidence of:**

- Correct use of `pivot_longer()`, `as.numeric()`, `rename()`, `select()`
- Proper join syntax with `by = c("left_var" = "right_var")` where needed
- Data validation steps (dimension checks, missing value summaries)
- Clear comments explaining each major merge step and validation check
- Logical organization: prep → inspect → merge → validate

---

## Section F: Overall Notebook Quality (5 points)

### Clarity, Completeness & Engagement

| Score | Criteria |
|-:|------------------|
| 5     | All 8 questions answered thoughtfully; organized; shows critical thinking |
| 3–4   | Most questions answered; some responses are superficial or brief |
| 1–2   | Minimal effort; several unanswered or incomplete questions |
| 0     | Missing or severely incomplete notebook |

---

## Instructor / TA Notes

- This rubric emphasizes **join strategy reasoning** and **merge validation** over perfect coding  
- Many students struggle with the conceptual difference between left/inner/full joins—reward clear articulation  
- Highlight that merging is a design choice: which observations to keep, which to discard, which to allow as `NA`  
- Encourage students to think about *why* the research question drives merge decisions (not just mechanics)  
- Data quality checks (duplicates, missing values) are critical; reward thorough validation  
- Watch for students who successfully execute merges but can't explain why they chose a particular join type  
- In the reflection, look for evidence that students understand trade-offs (e.g., left join introduces `NA` but preserves information)
