# Lab 7 Rubric: *Regression as a Tool for Answering Questions*

**Total points:** 100  
**Scope:** Questions 1-6 only  
**Grading philosophy:**

- Emphasis on regression interpretation and reasoning, not just reporting output
- Reward responses that connect coefficients, uncertainty, and diagnostics to the research question
- Partial credit encouraged for thoughtful analysis, even with minor technical mistakes
- Penalize vague responses that restate formulas or significance language without interpretation

---

## Section A: Expectations and Coefficient Intuition (26 points)

### Q1. Expectations About the Relationships (11 points)

| Score | Criteria |
|-:|------------------|
| 10-11 | Clearly discusses both relationships, including expected direction, likely linear/non-linear form, and expected strength with plausible reasoning |
| 7-9   | Addresses both relationships but one or more elements are underdeveloped or generic |
| 3-6   | Mentions only part of the prompt or gives very vague expectations |
| 0-2   | Missing or off-topic |

**Look for evidence of:**

- Separate discussion of drought-yield and yield-farm GDP
- Expected direction of each relationship
- Whether the student expects a roughly linear or non-linear pattern
- A reasoned statement about likely strength, not just a guess

### Q2. Simulated Slope Interpretation and Hidden Data-Generating Process (15 points)

| Score | Criteria |
|-:|------------------|
| 13-15 | Correctly interprets the slope with units, handles prediction comparisons accurately, and gives a thoughtful comparison between inferred and actual simulation parameters |
| 9-12  | Mostly correct interpretation with minor imprecision in units, intercept discussion, or inferred true relationship |
| 4-8   | Partial understanding of slope or predictions, but substantial confusion remains |
| 0-3   | Incorrect, minimal, or missing |

**Look for evidence of:**

- One-sentence slope interpretation in real-world terms with units
- Correct statement about what a 0.5 increase in drought implies for predicted yield
- Correct comparison of predicted yield at drought = 2 and drought = 3
- Recognition that the intercept may have limited substantive meaning if zero drought is outside the useful interpretation range
- A sensible attempt to infer the hidden intercept and slope, then compare to the actual simulation values

---

## Section B: Interpreting Real Regression Output (15 points)

### Q3. 2017 Regression Interpretation (15 points)

| Score | Criteria |
|-:|------------------|
| 13-15 | Correctly identifies the unit of observation, interprets the slope with units, explains significance and R-squared in plain language, and connects the result to decision-making confidence |
| 9-12  | Mostly correct but one area is weak or somewhat formulaic |
| 4-8   | Partial interpretation of output with missing or unclear plain-language explanation |
| 0-3   | Major misunderstandings or missing response |

**Look for evidence of:**

- Correct unit of observation: state-year for 2017, effectively one state in one year per row
- Slope interpretation in bushels per acre per one-unit increase in annual mean DSCI
- Correct explanation of statistical significance at the 5% level without overstating causality
- Thoughtful discussion of how uncertainty affects decision-making confidence
- Plain-language interpretation of R-squared as explained variation, not model correctness

---

## Section C: Diagnostics and Cross-Year Comparison (38 points)

### Q4. QQ Plot and Residual Normality (13 points)

| Score | Criteria |
|-:|------------------|
| 11-13 | Correctly interprets whether residuals are approximately normal and explains why normality matters for inference in linear regression |
| 7-10  | Gives a reasonable visual interpretation but explanation of why normality matters is limited |
| 3-6   | Minimal or partly incorrect discussion of the QQ plot or normality |
| 0-2   | Missing or off-topic |

**Look for evidence of:**

- Reference to whether points roughly follow the line or depart in tails or center
- Understanding that residual normality matters mainly for inference, especially t-tests, p-values, and confidence intervals
- Recognition that perfect normality is not required for a useful linear model

### Q5. Comparing 2017 to Another Year (25 points)

| Score | Criteria |
|-:|------------------|
| 22-25 | Strong comparison across scatterplots, regression output, and diagnostics; clearly explains similarities and differences and what they imply about the drought-yield relationship |
| 16-21 | Good comparison with reasonable interpretation, though some parts are brief or less integrated |
| 8-15  | Partial comparison; describes outputs more than interpreting them |
| 0-7   | Minimal, unsupported, or missing |

**Look for evidence of:**

- Direct comparison of pattern strength and direction across the two years
- Discussion of whether slope estimates and significance are similar or different
- Use of diagnostics, not just regression coefficients
- A plausible explanation for cross-year differences, such as weather timing, other agronomic conditions, or noise
- Careful implication statement about whether the drought-yield relationship appears stable or context-dependent

---

## Section D: Variable Definition and Broader Yield Determinants (21 points)

### Q6. Evaluating Annual Mean DSCI and Proposing Alternatives (21 points)

| Score | Criteria |
|-:|------------------|
| 19-21 | Clearly argues why annual mean DSCI may be limited, proposes a strong alternative measure, explains how to construct it, and identifies other important yield determinants |
| 13-18 | Reasonable critique and alternative measure, but construction details or broader determinants are somewhat limited |
| 6-12  | General discussion of drought timing or other factors, but proposal is vague |
| 0-5   | Minimal, incorrect, or missing |

**Look for evidence of:**

- Recognition that annual averaging may mask the timing of drought during critical growth stages
- A concrete alternative measure such as growing-season mean DSCI, peak drought during key months, cumulative drought exposure, or stage-specific drought indicators
- Explanation of how the alternative would be created from weekly or monthly data
- Justification for why the alternative better matches corn biology or the policy question
- Mention of other relevant factors such as temperature, precipitation, irrigation, soil quality, technology, pests, input use, or management practices

---

## Instructor / TA Notes

- Prioritize interpretation quality over polished prose
- Deduct points when students treat statistical significance as proof of causality
- Reward students who use units carefully and distinguish estimate size from uncertainty
- For Q4 and Q5, focus on whether diagnostics are interpreted sensibly, not whether students use perfect technical terminology
- For Q6, reward alternatives that better align drought measurement with the crop-growing calendar
