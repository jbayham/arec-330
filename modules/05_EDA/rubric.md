# Lab 5 Rubric: *Exploratory Data Analysis (EDA)*

**Total points:** 100  
**Grading philosophy:**

- Emphasis on interpretation, not just screenshot production
- Reward clear links between visuals/statistics and the research question
- Partial credit encouraged for reasonable analysis, even if imperfectly executed
- Penalize vague responses that only describe charts without interpreting patterns

---

## Section A: Power BI Visual Analysis (40 points)

### Q1. Corn Yield Patterns Across States and Time (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Identifies clear state and time patterns, names high/low-yield states, and provides plausible interpretation |
| 6–8   | Describes major patterns but interpretation is somewhat generic |
| 3–5   | Lists observations with limited interpretation |
| 0–2   | Vague, incorrect, or missing |

**Key indicators:**

- Distinguishes cross-state differences from over-time trends
- Notes whether yields generally rise, fall, or vary over time
- Mentions at least one notable state pattern (high, low, or unusual)

---

### Q2. Drought Patterns in Colorado vs Other States (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly identifies high-severity months/years for Colorado and makes a meaningful comparison to other states |
| 6–8   | Identifies Colorado patterns but comparison is brief or superficial |
| 3–5   | Mentions severe periods but lacks clear comparison |
| 0–2   | Minimal, incorrect, or missing |

**Look for evidence of:**

- Use of the state slicer and heatmap interpretation
- Specific references to timing (months/years) of severe drought
- Comparative language (e.g., more/less severe, different seasonality)

---

### Q3. Farm GDP Patterns Across States and Time (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Clearly identifies cross-state differences and temporal trends with sound interpretation |
| 6–8   | Captures key patterns but explanation lacks depth |
| 3–5   | Basic description with little analytical interpretation |
| 0–2   | Off-topic, vague, or missing |

**Key indicators:**

- Identifies high and low farm GDP states (or clusters)
- Describes trend direction over time (growth, decline, volatility)
- Recognizes that interactive filtering changes interpretation

---

### Q4. Scatterplot: Drought Severity vs Corn Yield (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly interprets direction/strength of association, discusses trend line, and notes outliers/exceptions |
| 6–8   | Interprets relationship correctly but misses nuance (outliers or strength) |
| 3–5   | Mentions relationship but interpretation is unclear or unsupported |
| 0–2   | Incorrect, vague, or missing |

**Look for evidence of:**

- Whether relationship appears negative, positive, or weak
- Proper use of trend line as summary (not proof of causality)
- Identification of outliers or state-year exceptions

---

## Section B: R-Based Statistical Summaries (40 points)

### Q5. Distribution Interpretation (Histograms) (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Interprets all required histograms (`yield_bu_per_acre`, `mean_dsci`, `farm_gdp`) with discussion of shape, spread, and unusual values |
| 6–8   | Covers most variables and basic distribution properties |
| 3–5   | Minimal interpretation; mostly descriptive |
| 0–2   | Missing or incorrect |

**Key indicators:**

- Mentions skewness/symmetry where relevant
- Notes possible outliers or long tails
- Compares distributions across variables

---

### Q6. Correlation Interpretation (Yield and Farm GDP) (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Correctly interprets sign and magnitude of correlation and gives a careful implication for economic outcomes |
| 6–8   | Correct sign/magnitude interpretation with limited implications |
| 3–5   | Computes value but interpretation is weak or partially incorrect |
| 0–2   | Missing or incorrect |

**Look for evidence of:**

- Correct interpretation of positive/negative/near-zero correlation
- Distinguishes correlation from causation
- Thoughtful link to possible drought-yield-output dynamics

---

### Q7. Summary Statistics Table and Interpretation (12 points)

| Score | Criteria |
|-:|------------------|
| 11–12 | Complete, neatly formatted table with all required statistics and a strong interpretation of central tendency/variability |
| 8–10  | Table mostly complete with reasonable interpretation |
| 5–7   | Partial table or limited interpretation |
| 0–4   | Missing major components |

**Required table elements:**

- Variables: corn yield, drought severity, farm GDP
- Statistics: mean, median, standard deviation, minimum, maximum, number of observations, number of missing values
- Human-readable variable labels

---

### Q8. Codebook Quality and Completeness (8 points)

| Score | Criteria |
|-:|------------------|
| 7–8   | Complete codebook for `final_merged_data.csv` with clear descriptions, data types, units, and source information |
| 5–6   | Mostly complete with minor omissions or vague descriptions |
| 3–4   | Partial codebook; several required fields missing |
| 0–2   | Minimal or missing |

**Look for evidence of:**

- Variable-by-variable documentation
- Plain-language descriptions understandable to non-technical readers
- Appropriate unit and source attribution where applicable

---

## Section C: Code, Reproducibility, and Deliverables (15 points)

### R Script + Log File + Power BI PDF

| Score | Criteria |
|-:|------------------|
| 13–15 | `lab_05.log` runs cleanly with organized/commented code, and Power BI PDF contains all four required pages |
| 9–12  | Minor issues in organization or completeness, but core deliverables are present |
| 5–8   | Deliverables incomplete or code quality weak |
| 0–4   | Major missing deliverables or nonfunctional workflow |

**Key indicators:**

- Clear script structure (load → visualize → summarize → interpret)
- Reproducible commands and readable comments
- Power BI export includes: Corn, Drought, Farm GDP, Scatterplot pages

---

## Section D: Overall Notebook Quality (5 points)

### Clarity, Completeness, and Critical Thinking

| Score | Criteria |
|-:|------------------|
| 5     | All 8 questions answered thoughtfully with clear, evidence-based reasoning |
| 3–4   | Most questions answered; some responses are brief/superficial |
| 1–2   | Several incomplete answers or limited engagement |
| 0     | Missing or severely incomplete notebook |

---

## Instructor / TA Notes

- Prioritize interpretation quality over polished prose
- High scores require specific evidence from visuals/statistics, not generic statements
- Reward students who acknowledge uncertainty and limitations
- In Q4 and Q6, deduct points if students claim causal conclusions from correlation alone
- In Q7 and Q8, emphasize communication quality: can another analyst reuse their outputs?
