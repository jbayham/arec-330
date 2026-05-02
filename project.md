---
layout: page
title: "Course Project"
permalink: /project/
---

<style>
.project-proposal-template h4 {
  font-weight: 700;
  margin-bottom: 0.2rem;
}

.project-proposal-template .sentence-starter {
  margin-left: 1rem;
}
</style>


## Overview

In this project, you will take on the role of a data analyst asked to support a real-world decision using data. Rather than following a step-by-step recipe, your team will be responsible for defining the question, assembling and analyzing data, and communicating results to an audience that needs to act on your findings.

In many professional settings (e.g., business, policy, consulting, and research) analysts are rarely handed a perfectly defined problem. Instead, they are asked to clarify goals, make reasonable assumptions, work with imperfect data, and deliver insights that are useful under real constraints. This project is designed to mirror that experience.

You will work in a team of **three** to investigate a question that genuinely interests you. You may choose a topic related to business, agriculture, environmental issues, public policy, as long as your question can be addressed using regression or forecasting methods and available data. I encourage you to choose a topic that you care about. The project will be more enjoyable and you will be motivated to work on it.

Your task is not to build the most complex model possible. Your task is to build a model that helps someone make a better decision. This means thinking carefully about:

- Who the decision maker is
- What outcome they care about
- What information would actually change their behavior

By the end of the project, you should be able to explain not only what you did, but why you did it, and why someone should trust your results.


Deliverables:

| Deliverable | Weight |
| --- | ---: |
| Proposal | 10% |
| Written report | 30% |
| Oral presentation | 30% |
| Replication materials (cleaned data + code) | 10% |
| Individual reflection and peer review | 10% |

<br>

Core learning goals:

- Translate a real-world question into a testable empirical model
- Apply regression or forecasting methods appropriately
- Make defensible modeling choices using data diagnostics
- Communicate results to a non-technical decision maker
- Practice professional teamwork and accountability


---

## A. Proposal 

The proposal defines the scope and direction of your project. Its purpose is to ensure that your team has a clear, feasible, and well-motivated plan before investing time in data collection and modeling.

Feeling uncertain at this stage is normal. In real analytical work, the hardest part is often turning a broad interest into a question that is specific, answerable, and useful. The goal of the proposal is not to have a perfect project from the start. The goal is to arrive at a feasible, decision-relevant question that you can investigate well.

If you want a refresher on the decision-maker, outcome, and unit-of-observation framework, revisit the <a href="{{ site.url }}{{ site.baseurl }}/modules/02_framework_question/lab.html">Week 2 lab: <em>From Question to Data</em></a>. In that module, we emphasized that good analysis starts with a problem, then a decision, then a question. The same logic applies here.

Your proposal should be 1–2 pages. Use the process below to move from an initial idea to a workable proposal.

### Step 1: Identify the problem and generate 3 candidate ideas

Do not stop at the first idea your group mentions. Start by sketching three possibilities, then compare them.

| Candidate idea | Topic area | What is the problem? | Who is the decision maker? | What decision could they make? | What outcome do they care about? | Likely data source(s) | Main goal: forecasting or explaining relationships? |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Idea 1 |  |  |  |  |  |  |  |
| Idea 2 |  |  |  |  |  |  |  |
| Idea 3 |  |  |  |  |  |  |  |

As you compare ideas, favor projects where you can clearly state the problem first. If you cannot name the underlying problem, it will be hard to specify a relevant question.

### Step 2: Turn one problem into a workable question

Choose the strongest candidate and refine it. A good project question is not just "interesting." It is rooted in a real problem, linked to a decision, and specific about the outcome and data structure.

Use these prompts to refine your question:

- What is the underlying problem faced by a firm or society?
- Why does this problem matter?
- Who is the decision maker, and what choice do they control?
- What decision would be informed by your analysis?
- Who or what is being observed?
- Where is the question set (for example, a state, county, market, firm, or store)?
- When is the relevant time period?
- What is the outcome you want to explain or predict?
- What is the unit of observation in the data?
- Why would answering this question help someone make a decision?

Try to write your question in one or two sentences. The question should follow naturally from the problem and the decision, not from the dataset alone.


### Step 3: Feasibility screen

Before you draft the proposal, test whether the question is realistic.

- Have we identified a real firm or social problem that motivates the project?
- Is there a decision someone could plausibly make in response to that problem?
- Can we measure the outcome clearly with available data?
- Can we observe the key predictors or explanatory variables we need?
- Does the unit of observation match the claim we want to make?
- Do we have enough time periods, observations, or variation to estimate something meaningful?
- Are the data accessible now, not just theoretically available?
- Can this question be addressed with regression or forecasting methods covered in this course?

If your team has more than one `No` or `Unsure`, revise the question before moving forward.

### Step 4: Draft the proposal

Use the headings below to draft the actual 1–2 page proposal. If you can write a clear response under each heading, you are in good shape. You do not have to use the sentence starters. They are there to get your started.

<div class="project-proposal-template">
  <h4>Underlying problem</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "The firm or social problem motivating this project is ..."</p>

  <h4>Decision problem</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "Because of this problem, the key decision is ..."</p>

  <h4>Decision maker</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "The primary decision maker is ... and they would use this analysis to ..."</p>

  <h4>Empirical question</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "Our empirical question is ..."</p>

  <h4>Outcome variable</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "The main outcome variable is ... because it captures ..."</p>

  <h4>Unit of observation</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "The unit of observation is ... which matches our question because ..."</p>

  <h4>Data sources</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "We plan to use data from ... These sources are appropriate because ..."</p>

  <h4>Planned approach</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "We plan to estimate a regression or forecasting model ... because ..."</p>

  <h4>Why this is feasible and useful</h4>
  <p class="sentence-starter"><strong>Sentence starter:</strong> "This project is feasible because ... and useful because ..."</p>
</div>


### Suggested in-class workshop plan (1 hour 40 minutes)

Use the lab time to leave class with a real draft, not just a topic idea.

| Time | Task | Concrete output |
| --- | --- | --- |
| 0–10 min | Re-read the proposal guidance as a team. Assign temporary roles: facilitator, recorder, and data scout. | Everyone understands the goal and one person is responsible for capturing the group's work. |
| 10–25 min | Brainstorm 3 candidate project ideas using the table in Step 1. Do not evaluate too early. | A completed 3-idea table. |
| 25–40 min | Compare the 3 ideas and choose the strongest one. Use the decision maker, outcome, and unit-of-observation framework to justify the choice. | One selected project idea and one rejected backup idea. |
| 40–55 min | Refine the chosen idea into a 1-2 sentence empirical question using the prompts in Step 2. | A draft question, named decision maker, outcome variable, and unit of observation. |
| 55–70 min | Conduct the feasibility screen. Search for actual data sources, not hypothetical ones. | A short list of candidate datasets and a decision about whether the project is feasible as currently framed. |
| 70–90 min | Draft the proposal using the headings in Step 4. Keep writing even if some parts are rough. | A rough but complete 1-2 page draft. |
| 90–100 min | Do a final review: identify the weakest section, revise it, and make a plan for what each group member will do next. | A stronger draft and a next-steps plan. |

If your group gets stuck, use this rule: do not spend more than 10 minutes debating a broad topic without writing something down. Move to a more specific question, a narrower setting, or a more accessible dataset.

### Checkpoints for today

By the end of class, your team should have:

- Three candidate ideas written down
- One clearly chosen project direction
- A named decision maker
- A specific outcome variable
- A clear unit of observation
- At least one real data source you can access now
- A rough proposal draft organized under the Step 4 headings

### Instructor check-ins (Optional)

Ask for feedback once your group can show all three of the following:

- Your draft empirical question in one or two sentences
- The decision maker, outcome, and unit of observation
- The dataset or data source you think makes the project feasible

That will make it much easier to give you useful feedback quickly.

### Using AI tools effectively for the proposal

AI tools can help you think faster at this stage, but they are most useful when you use them to sharpen your judgment, not replace it.

Use AI tools for tasks like:

- Generating and comparing possible project ideas
- Stress-testing whether a question is too broad, too vague, or not decision-relevant
- Revising a weak question into a clearer empirical question
- Identifying likely decision makers, outcomes, and units of observation
- Brainstorming keywords, agencies, repositories, and organizations to search for data
- Comparing whether a question is better suited for regression or forecasting
- Improving the clarity of your proposal draft

Use AI tools carefully. Do not treat an AI response as automatically correct. AI tools can:

- Invent data sources that do not exist
- Suggest questions that sound impressive but are not feasible
- Confuse correlation, causation, prediction, and explanation
- Give generic answers that are not tied to a real decision problem

Your job is to evaluate the output. If the AI suggests a dataset, check that it actually exists and that you can access it now. If it suggests a question, ask whether the decision maker, outcome, and unit of observation really line up.

### Good prompting strategies

Weak prompts usually produce weak answers. Give the model context, constraints, and a clear task.

Instead of:

- "Give us a project idea"

Try prompts like:

- "Critique this project idea. Tell us whether the decision maker, outcome, unit of observation, and likely data source are clearly defined."
- "We are considering this question: [insert question]. Rewrite it so it is narrower, more decision-relevant, and easier to answer with available data."
- "List likely public data sources for this topic. First, confirm they exist. For each source, explain what the unit of observation would be and whether it seems useful for regression or forecasting."
- "Challenge this idea. What are the main feasibility risks, hidden assumptions, and reasons this project could fail?"

Good prompts often include:

- The course constraint: regression or forecasting methods covered in class
- The decision context
- The geographic setting
- The time period
- The likely outcome variable
- The audience for the final analysis
- A request for critique, not just idea generation

### Smart ways to use AI during the workshop

1. Start with idea generation, but ask for multiple alternatives.
2. Use AI to critique each idea, not just praise it.
3. Ask AI what would make the idea infeasible.
4. Ask for likely datasets, then verify them yourself.
5. Ask AI to help you revise the question after you have chosen an idea.
6. Use AI to improve the writing of your proposal only after you have settled the substance.

You will get more value from prompts like "What is wrong with this idea?" than from prompts like "Tell us if this is a good idea."

### Data search and verification

AI can help you search for data, but it should not be your final source of truth.

When using AI for data search:

- Ask for specific dataset names, agencies, repositories, or organizations
- Ask what variables are likely available
- Ask what the unit of observation probably is
- Ask whether the data seem better for cross-sectional, panel, or time-series analysis
- Verify every promising source by visiting the actual website

For example, a strong workflow is:

1. Ask AI for likely data sources and search terms.
2. Visit the real source.
3. Confirm the data exist, are accessible, and contain the variables you need.
4. Decide whether the source actually matches your empirical question.

### Submission requirement: AI conversation record

Along with your proposal, your team must submit a record of your AI conversations related to developing the proposal.

This is required because I want to see how you used AI as part of your analytical process, including brainstorming, critique, revision, and data search.

Your submission should include the conversations that show how you:

- Generated or compared project ideas
- Refined your empirical question
- Evaluated feasibility
- Searched for data sources
- Revised your writing or argument

Do not curate only your best-looking exchange. Include the conversation record that reflects your actual process.

### How to export or save your AI conversations

Different AI tools handle exports differently, so use whichever of the following methods works for your platform.

#### Option 1: Export directly from the platform

If your AI tool has an export, share, print, or download feature, use it to save the relevant conversation as a PDF, HTML file, or text file.

#### Option 2: Browser extension

If needed, you may use a browser extension designed to export chats, such as <https://www.chatgptexporter.com/en>. This may let you save the conversation in formats such as PDF, Markdown, or JSON.

#### Option 3: Print to PDF

If there is no export button, use your browser's print function and save the conversation as a PDF.

#### Option 4: Copy into a document

If the other options do not work well, copy and paste the full conversation into a document and save it as a PDF or Word file. Make sure the prompts and responses are clearly labeled and remain in order.

### What to submit

Submit one file per group containing your AI conversation record. Acceptable formats are:

- PDF
- Word document
- Plain text file
- JSON

Label the file clearly, for example:

- `project_proposal_ai_record.pdf`

If your group used more than one AI tool, combine the relevant conversations into one file if possible. If you submit a JSON export, make sure it still clearly preserves the conversation record.

At minimum, the conversation record must show:

- The prompts your group wrote
- The AI responses
- Enough of the conversation to show how your idea evolved

If you quote, paraphrase, or directly use language from an AI tool in your proposal, that use should be visible in the submitted conversation record.


The proposal should demonstrate that your question is answerable with available data and methods covered in this course. Instructor feedback at this stage is intended to help refine your project, not to lock you into a final design.

### Rubric

| Level                          | Description                                                                                                                                                                                                                                                                               |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Exceeds expectations**       | The proposal clearly defines a compelling and realistic decision problem. The outcome, decision maker, and unit of observation are well aligned. Data sources are appropriate and feasible. The proposed modeling approach is well motivated and demonstrates strong analytical judgment. |
| **Meets expectations**         | The proposal defines a clear question and outcome. Data sources and methods are generally appropriate, though some elements may need refinement. The project appears feasible and relevant to course objectives.                                                                          |
| **Does not meet expectations** | The proposal is vague, unrealistic, or poorly aligned with available data or methods. Key elements (decision context, outcome, unit of observation, or data source) are missing or unclear.                                                                                               |

<br>

-----


## B. Written Report 

The written report presents your full analysis and is the primary record of your work. It should be written for an intelligent but non-technical audience and emphasize interpretation and decision relevance over technical detail.

The report should be concise (double-spaced with 12 or 11 pt font approximately 6–8 pages, excluding tables and figures) and include:

- An executive summary that highlights key findings and recommendations
- Background and decision context
- Data description, including sources and limitations
- Modeling approach and justification
- Results and interpretation of coefficients or forecasts
- Discussion of uncertainty, assumptions, and limitations
- Conclusions and actionable recommendations

Clear writing, well-designed tables and figures, and logical organization are essential.

Recommended sections:

1. Executive Summary (one paragraph summary concisely describing your problem, research question, data used, key findings, recommendations. ~One sentence for each.)
  - Example: "Producers are faced with uncertainty in XXX (rewrite this part for your specific decision maker). This report investigates how ZZZ affects XXX (again, adjust to be specific to your analysis). We use data from WWWW to estimate a regression/forecasting model (again adjust to your analysis) that [explain what model does]. Our analysis shows that [key findings]. We recommend YYY."
2. Background and Decision Context (describe the problem, why it matters, and who the decision maker is. This should be a more detailed version of the first two sentences of your executive summary. Include citations for research papers and/or news articles when appropriate. Citation style is up to you, but should be consistent throughout the report.)
3. Data (describe the data sources you used, where they come from, how you cleaned and processed the data, and any limitations or caveats about the data. If you use many data sources, can include a table with data sources to focus writing on describing cleaning process / data limitations (see Week 5 lab, question 8 (codebook) for example.))
4. Modeling Approach (describe the model(s) you estimated, why you chose that model, and how it helps answer your question.)
5. Results (present the results of your model, including key figures. Make sure these are explained well in the text (should be able to get the takeaway from the text absent the figure). Interpret key coefficients (including significance) or forecasts (can evaluate with accuracy metrics from Week 6 lab). Use tables and figures to support your explanation. Interpret the results in plain language and explain what they mean for the decision maker.)
6. Discussion (discuss the assumptions, limitations, and uncertainty in your analysis. What are the main caveats that a decision maker should be aware of when interpreting your results? How might these limitations affect the conclusions you draw?)
7. Conclusion and Recommendations (summarize the main findings and explain what you recommend the decision maker do as a result. Be specific about what action you think they should take, and why. If there are multiple possible actions, explain the tradeoffs between them and how your analysis informs those tradeoffs.)

### Rubric

| Level                          | Description                                                                                                                                                                                                                                                                            |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Exceeds expectations**       | The report is well organized, clearly written, and analytically strong. Results are interpreted correctly and tied directly to the decision context. Limitations and uncertainty are discussed thoughtfully. Recommendations are clear, realistic, and well supported by the analysis. |
| **Meets expectations**         | The report presents a complete analysis with generally correct interpretation. Organization and clarity are adequate. Results are connected to the decision problem, though discussion of limitations or implications may be limited.                                                  |
| **Does not meet expectations** | The report is incomplete, unclear, or difficult to follow. Results are misinterpreted or poorly connected to the decision context. Key sections are missing, or the analysis lacks credibility.                                                                                        |

<br>

**Replication Materials (Data and Code)**

Reproducibility is a core professional standard in data analysis. You will develop replication materials for your project. Your replication materials must allow another analyst to reproduce your results. This includes cleaned data files and clearly written code used for data processing, analysis, and figure generation.

Materials should include:

- Raw or source data references
- Cleaned datasets used in analysis
- Well-organized, commented code
- Clear file structure and naming conventions


### Rubric

| Level                          | Description                                                                                                                                                       |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Exceeds expectations**       | Materials are complete, well organized, and fully reproducible. Code is clear and well documented. A third party could easily reproduce the analysis and results. |
| **Meets expectations**         | Materials are mostly complete and reproducible. Code runs with minimal effort, though documentation or organization could be improved.                            |
| **Does not meet expectations** | Materials are incomplete, poorly organized, or not reproducible. Code does not run or key data files are missing.                                                 |


<br>

-------

## C. Oral Presentation 

The oral presentation communicates your project’s key insights to an audience of decision makers. The goal is not to walk through every technical detail, but to explain what you found, why it matters, and what should be done as a result.

Presentations should be 8 minutes and include:

- A clear statement of the problem and decision context
- A brief overview of data and approach
- Key results and their interpretation
- Implications and recommendations
- Visuals that support, rather than distract from, the message

All group members are expected to participate.

### Rubric

| Level                          | Description                                                                                                                                                                                                     |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Exceeds expectations**       | The presentation is clear, engaging, and well paced. Results are communicated accurately and persuasively. Visuals are effective. The team demonstrates strong understanding and answers questions confidently. |
| **Meets expectations**         | The presentation clearly explains the project and results. Visuals are adequate. Some aspects of interpretation or delivery may be uneven, but the core message is understandable.                              |
| **Does not meet expectations** | The presentation is disorganized, unclear, or difficult to follow. Results are miscommunicated or poorly explained. Visuals are confusing or missing.                                                           |


<br>


---------

## E. Individual Reflection and Peer Review

Each student will submit an individual reflection that focuses on both teamwork and analytical learning. This reflection is an opportunity to step back from the final product and critically assess the project as a whole.

In addition to describing your contributions and evaluating teamwork, you should reflect on the analytical decisions your group made and what you learned from the process. In professional settings, analysts are often asked not only to deliver results, but also to explain what they would do differently with more time, better data, or additional information. This reflection mirrors that expectation.

Your reflection should address the following points:

- A clear description of your individual contributions to the project
- An assessment of how your team functioned (communication, division of labor, coordination)
- Thoughtful reflection on the analysis itself, including:
  - What worked well in your approach
  - What you would change if you were starting the project again
  - What additional data, methods, or checks you would pursue with more time
- Constructive and professional feedback on the contributions of your teammates

Reflections should be specific and concrete. Vague statements (e.g., “we would collect better data” or “we would improve the model”) should be avoided in favor of clear, actionable insights.

Peer evaluations may be used to adjust individual grades.

### Rubric

| Level                          | Description                                                                                                                                                                                                                                                                                                            |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Exceeds expectations**       | The reflection is thoughtful, specific, and demonstrates deep engagement with the project. The student clearly explains their contributions, critically evaluates analytical choices, and provides concrete ideas for how the project could be improved if done again. Peer feedback is constructive and professional. |
| **Meets expectations**         | The reflection adequately describes contributions and team dynamics. The student reflects on the project and identifies areas for improvement, though discussion may be general or limited in depth. Peer feedback is appropriate.                                                                                     |
| **Does not meet expectations** | The reflection is superficial, incomplete, or missing. Contributions are unclear, reflection on the analysis is minimal or absent, or peer feedback is unconstructive or unprofessional.                                                                                                                               |

<br>
