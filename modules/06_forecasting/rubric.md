# Lab 6 Rubric: *Forecasting National Park Visitation*

**Total points:** 100  
**Grading philosophy:**

- Emphasis on forecasting reasoning and interpretation, not just code execution
- Reward clear links between decomposition outputs, forecast choices, and evaluation results
- Partial credit encouraged for thoughtful analysis even with minor technical mistakes
- Penalize vague responses that report outputs without interpretation

---

## Section A: Time Series Setup & Data Understanding (15 points)

### Q1. Unit of Observation in `arches_raw` (7 points)

| Score | Criteria |
|-:|------------------|
| 6–7   | Correctly identifies the row-level unit (monthly park-level observation) and explains what key fields define it |
| 4–5   | Mostly correct unit identified but explanation is brief or partially imprecise |
| 2–3   | Mentions month/year but unclear about observation structure |
| 0–1   | Incorrect or missing |

### Q2. Raw Series Description (8 points)

| Score | Criteria |
|-:|------------------|
| 7–8   | Clearly identifies trend/regime shifts, seasonality, and notable outliers/spikes with concrete evidence from plot |
| 5–6   | Identifies major patterns but interpretation is somewhat generic |
| 2–4   | Basic description with limited pattern recognition |
| 0–1   | Minimal or missing |

---

## Section B: STL Decomposition & Seasonal Adjustment (25 points)

### Q3. Interpreting STL Components (15 points)

| Score | Criteria |
|-:|------------------|
| 13–15 | Strong interpretation of seasonal magnitude, peak/trough months, trend regimes, and at least one plausible shock explanation |
| 10–12 | Mostly correct interpretation with minor gaps in depth or specificity |
| 6–9   | Partial interpretation of components; limited linkage to forecasting implications |
| 0–5   | Major misunderstandings or missing response |

**Look for evidence of:**

- Relative importance of seasonal component vs trend/remainder
- Correct identification of high/low visitation months
- Multi-year trend interpretation (growth/decline phases)
- Plausible contextual explanation for major shocks

### Q4. Original vs Seasonally Adjusted Series (10 points)

| Score | Criteria |
|-:|------------------|
| 9–10  | Clearly explains what seasonal adjustment removes and what underlying signal remains |
| 6–8   | Correct general explanation but limited detail |
| 3–5   | Mentions differences without clear interpretation |
| 0–2   | Incorrect or missing |

---

## Section C: Forecast Construction & Evaluation (35 points)

### Q5. Forecast Accuracy and Error Interpretation (20 points)

| Score | Criteria |
|-:|------------------|
| 18–20 | Correctly reports MAE/RMSE, gives clear plain-language accuracy assessment, identifies error patterns/bias, and thoughtfully discusses reservation-policy change implications |
| 14–17 | Reports metrics and provides reasonable interpretation with minor gaps in bias/policy discussion |
| 9–13  | Reports metrics but interpretation is superficial or partly incorrect |
| 0–8   | Missing metrics or weak/incorrect interpretation |

**Look for evidence of:**

- Accurate reading of holdout performance metrics
- Distinction between random error and systematic bias
- Evidence-based comments from forecast vs test plot
- Discussion of structural change (reservation system introduction/removal)

### Q6. Benchmark Comparison (15 points)

| Score | Criteria |
|-:|------------------|
| 13–15 | Correctly compares decomposition model vs seasonal naive and justifies conclusion using accuracy metrics |
| 10–12 | Correct winner identified; justification is present but limited |
| 6–9   | Comparison attempted but unclear or weakly supported |
| 0–5   | Missing or incorrect |

---

## Section D: Transfer to a New Park (15 points)

### Q7. Replication and Comparative Insight (15 points)

| Score | Criteria |
|-:|------------------|
| 13–15 | Strong comparison to Arches (trend/seasonality/shocks), clear reflection on workflow challenges, and thoughtful accuracy comparison |
| 10–12 | Good comparison with minor gaps in interpretation depth |
| 6–9   | Partial comparison with limited insight |
| 0–5   | Minimal, off-topic, or missing |

---

## Section E: Reproducibility & Deliverables (10 points)

### Code, Log, Notebook, and Figure

| Score | Criteria |
|-:|------------------|
| 9–10  | `lab_06.log` runs cleanly, notebook answers are complete and interpretable, and required figure is present and relevant |
| 6–8   | Most deliverables complete with minor quality/formatting issues |
| 3–5   | Deliverables partially complete or weakly documented |
| 0–2   | Major missing deliverables |

**Required deliverables:**

- `lab_06.log` using sink-source-sink pattern
- Lab notebook responses (Questions 1–6 at minimum; include Q7 if assigned by instructor)
- One figure: STL decomposition plot or final forecast plot with holdout visible

---

## Instructor / TA Notes

- Prioritize interpretation quality over polished prose
- Reward students who connect model performance to possible structural breaks/policy changes
- Deduct points when students assert causal claims from visual associations alone
- Encourage transparency in model choice (why decomposition + ETS, why seasonal naive benchmark)
- For partial credit, focus on whether students show coherent forecasting logic end-to-end
