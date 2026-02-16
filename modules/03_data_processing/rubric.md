# Lab 3 Rubric: *Data Processing (Part 1)*

**Total points:** 100  
**Grading philosophy:**  

- Emphasis on understanding data cleaning decisions and reasoning  
- Technical correctness matters, but explanation is paramount  
- Partial credit encouraged  
- Penalize vague, incomplete, or unreflective responses  

---

## Section A: Missing Data Analysis (30 points)

### Q1. Comparative Missingness & Type Interpretation (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly identifies which column has more missing values AND articulates the difference between MAR and MNAR patterns |
| 6–8   | Correctly identifies column but explanation of missingness types is incomplete |
| 3–5   | Identifies column but reasoning about missingness patterns is vague |
| 0–2   | Incorrect or missing |

**Key indicators:**

- States which column (MAR or MNAR) has more missing values
- Explains why this suggests different mechanisms of missingness
- Connects to practical interpretation (e.g., reporting bias vs. random omission)

---

### Q2. Patterns in Missingness by State & Year (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Identifies specific states/years with higher missingness AND provides plausible explanations |
| 6–8   | Notes variation but explanations are generic or superficial |
| 3–5   | Observes some pattern but little reasoning about causes |
| 0–2   | No analysis or missing conclusions |

**Look for evidence of:**

- Concrete examples (e.g., "State X in Year Y has Z% missing")
- Hypotheses about causes (e.g., reporting thresholds, crop failure, data collection issues)
- Distinction between MAR and MNAR patterns in the data

---

### Q3. Bias from Missing Data (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Clearly states how mean yields differ AND interprets the direction/magnitude of bias |
| 6–8   | Calculates correctly but explanation of bias implications is weak |
| 3–5   | Notes differences but doesn't explain why they matter |
| 0–2   | Missing calculations or interpretation |

**Key indicators:**

- Quantifies the difference in means across the three columns
- Explains how MCAR, MAR, and complete-case analyses diverge
- Discusses whether the bias is systematic (favoring high/low yields) or random

---

## Section B: Reshaping Untidy Data (25 points)

### Q4. Identifying & Describing Untidy Structure (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Clearly explains why the wide format violates tidy data rules  |
| 6–8   | Identifies the issue but explanation is brief or slightly incomplete |
| 3–5   | Mentions structure but doesn't connect to tidy data principles |
| 0–2   | Vague or incorrect |

**Look for evidence of:**

- Recognition that years are spread across columns instead of rows
- Understanding that this violates the "each variable is a column" rule
- Awareness that this structure complicates analysis

---

### Q5. Transformation & Data Properties (15 points)

| Score | Criteria |
|-:|------------------|
| 13–15 | Correctly identifies all changes (row count, new columns) AND recognizes data type issue with year |
| 10–12 | Mostly correct; minor omissions (e.g., mentions row expansion but not data type concern) |
| 6–9   | Addresses structural changes but lacks completeness or clarity |
| 0–5   | Incomplete or incorrect analysis |

**Key indicators:**

- Correctly computes new row count (original states × number of years)
- Identifies the two new columns created: `year` and `yield`
- Recognizes that `year` is imported as character and should be numeric
- Explains why converting `year` to numeric is important (for time-series operations)
- Compares ease of calculating grouped means in wide vs. tidy formats

---

## Section C: Temporal Aggregation & Metrics (30 points)

### Q6. DSCI Explanation (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Clearly explains DSCI to a non-technical audience AND justifies its usefulness |
| 6–8   | Explains the calculation but lacks simplicity or rationale |
| 3–5   | Mentions weighting but explanation is technical or incomplete |
| 0–2   | Vague or incorrect |

**Look for evidence of:**

- Plain-language description of what DSCI measures (overall drought severity)
- Recognition that DSCI produces a single number summarizing multiple drought types
- Discussion of why this is useful (comparable across states and years)

---

### Q7. Aggregation to Annual Level & Limitations (20 points)

| Score | Criteria |
|-:|------------------|
| 18–20 | Clearly defines `mean_dsci`, articulates its utility for merging AND identifies substantive limitations |
| 14–17 | Correct definition and merging rationale but limitations are incomplete |
| 9–13  | Addresses most components but reasoning lacks depth |
| 0–8   | Significant gaps or missing components |

**Key indicators:**

- Defines `mean_dsci` as the annual average drought severity per state
- Explains how this aggregation enables merging with annual corn yield data
- Identifies limitations (e.g., loss of weekly timing information, misses peak drought periods)
- Discusses that simple averaging may obscure critical drought windows (e.g., reproductive stage)
- Recognizes that biological impact depends on *when* drought occurs, not just *average*

---

## Section D: Code Quality & Documentation (10 points)

### Code & Log File

| Score | Criteria |
|-:|------------------|
| 9–10  | All code runs without errors; clear, logical organization; thorough comments; log file is complete and clean |
| 6–8   | Code runs mostly; comments are adequate but could be clearer; minor formatting issues in log |
| 3–5   | Code has minor errors or incomplete comments; log file present but messy |
| 0–2   | Code does not run or log file is missing/unusable |

**Look for evidence of:**

- Logical workflow (load, inspect, process, summarize)
- Comments explaining each major step and decision
- Correct use of `select()`, `mutate()`, `group_by()`, `summarize()`, `pivot_longer()`

---

## Section E: Overall Synthesis & Reflection (5 points)

### Notebook Clarity & Completeness

| Score | Criteria |
|-:|------------------|
| 5     | All questions answered thoughtfully; notebook is organized and shows engagement |
| 3–4   | Most questions answered; some responses are superficial |
| 1–2   | Minimal effort; several unanswered questions |
| 0     | Missing or incomplete notebook |

---

## Instructor / TA Notes

- This rubric emphasizes **conceptual understanding** of data challenges and decision-making over perfect technical execution  
- Encourage students to explain *why* they made choices (e.g., data type conversion, aggregation strategy)  
- Missing data and temporal aggregation are subtle topics—reward thoughtful engagement with limitations  
- Deduct points for responses that are purely descriptive without interpretation (e.g., "The data had 5% missingness" without discussing bias implications)  
- Students should articulate the trade-offs of different processing strategies (e.g., deletion vs. imputation, simple averaging vs. windowing)
