---
layout: page
title: Resources
permalink: /resources/
---

This page contains links to resources that may be helpful.

## Online Resources

There are many online resources to help you learn R programming and data analysis. Here are a select few that I have found helpful:

-   [Posit recipes for R basics](https://posit.cloud/learn/recipes): A collection of step-by-step guides for common R tasks.
-   [R for Data Science (2e)](https://r4ds.hadley.nz/): Online book for data science with R, a really great resource. You can search for relevant topics/tasks.
-   [Data Wrangling and Visualization Guide](https://bookdown.org/max_ricciardelli/wrangling_modules/): Online book with data wrangling, similar to R for Data Science but breaks down concepts more.
-   [Guide to using GitHub Copilot](https://docs.posit.co/ide/user/ide/guide/tools/copilot.html#using-copilot): How to use Github Copilot in RStudio.
-   [How to write better prompts for GitHub Copilot](https://github.blog/developer-skills/github/how-to-write-better-prompts-for-github-copilot/): Tips for writing effective prompts to get better code suggestions from Copilot.
-   [R as GIS for Economists](https://tmieno2.github.io/R-as-GIS-for-Economists-Quarto/): For those interested in spatial analysis with R. This is also be helpful when trying to create maps in R.
-   [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/): For those interested in coding with Python.
-   [dplyr Cheat Sheet](https://rstudio.github.io/cheatsheets/data-transformation.pdf): A quick reference for the dplyr package, which is commonly used for data manipulation in R.
-   [tidyverse Cheat Sheet](https://posit.co/resources/cheatsheets/): Cheat sheets to common tidyverse packages and tools.

## Quick Troubleshooting Tips in R

This is a list of things to check when you run into a problem in R.

-   Did you spell everything correctly? Case matters. Check for typos in function names, variable names, and file paths.

-   Is the computer looking/saving where you tell it to?

    -   File paths are important. Use `getwd()` to see your current working directory. Use `setwd("<your file path here>")` to change it.
    -   Example: `setwd("C:/Users/wacht/Documents/arec_330")`
    -   Here is how you can copy a folder/file path in Windows and Mac:
        -   Windows: Navigate to the folder/file in File Explorer, right-click the folder/file, and select "Copy as path".
        -   Mac: Navigate to the folder/file in Finder, right-click (or Control-click) the folder/file, hold down the Option (⌥) key, right-click the folder/file, and select "Copy <folder/file> as Pathname".
        -   NOTE: R only likes forward slashes (`/`) in file paths, even on Windows, so you may have to edit your copied file paths to successfully read files into R.

-   If you're using a specific function from a package, are you referencing the right package/function?

    -   Some packages have functions with the same name. To avoid confusion, use the `package::function()` syntax to specify which package's function you want to use.
    -   Example: `dplyr::filter()` vs `stats::filter()`. Using `dplyr::filter()` ensures R is using the filter function from the dplyr package.

## Using AI for Troubleshooting

-   Lean on VS and Copilot because these AI are built for coding. See links to resources in first section.
-   When using other AI tools like ChatGPT or Gemini for troubleshooting, be specific about the error message and context. Provide the exact error message, a brief description of what you were trying to do, and any relevant code snippets. This will help the AI provide more accurate and helpful responses.
-   If it recommends a fix with a specific package, check that the package/function being referenced is real (sometimes AI makes these things up, especially for more complicated coding challenges). You can look up the package documentation (using Google) to make sure it’s an actual package calling an actual function. Example: [dyplr package documentation](https://cran.r-project.org/web/packages/dplyr/dplyr.pdf)
-   Be careful about the proposed solutions. Sometimes they are legitimate, sometimes they will send you down rabbit holes that are not helpful / make your code less elegant.


## Video Tutorials

Setting directory and generating .log file:

<iframe src="https://colostate-my.sharepoint.com/personal/crw41_colostate_edu/_layouts/15/embed.aspx?UniqueId=44370a47-a4b3-4550-9e72-272ec5bcc71b&embed=%7B%22ust%22%3Atrue%2C%22hv%22%3A%22CopyEmbedCode%22%7D&referrer=StreamWebApp&referrerScenario=EmbedDialog.Create" width="640" height="360" frameborder="0" scrolling="no" allowfullscreen title="lab_setup_and_log_file.mp4"></iframe>
