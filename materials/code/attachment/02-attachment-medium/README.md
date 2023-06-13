# Attachment Analysis

In this repository we collect all the materials of the study *“My Nobel Prize-Winning article”*. The aim of the study is to assess the relationship between attachment towards the mother and   social emotional problems in children in the 3rd and 4th year of primary school.

The pre-print version of the article is available at [TODO: add link].

## Project Structure

The repository is organized in the following directories:

- `analysis/` includes all the R scripts used to run the analysis.
- `data/` includes the data `data.csv` used in the analysis and a description of the data.
- `documents/` includes the report `report.Rmd` with the description of the analysis and discussion of the results.
- `R/` includes all the `.R` scripts used to define custom functions used in the analysis.
- `outputs/` used to store the analysis results.

## `renv`

The R-package `renv` is used to manage the dependencies of the
R-packages used in the analysis. The `renv` package allows the creation
of an isolated, portable, and reproducible environment where the
analyses are run. To know more about `renv` consider the [official
documentation](https://rstudio.github.io/renv/articles/renv.html).

## Run the Analysis

To reproduce the analysis:

1.  Download the repository on your local machine

    ``` bash
    git clone [TODO: add link repository]
    ```
2.  Open the R project by double-clicking the file `Attachment.Rproj` you can find in the project main directory. A new R-studio session will open.
3.  Run `renv::restore()` to install the project’s dependencies (have a coffee, it takes some time).
4.  Run `analysis/analysis.R` to execute the analysis and create the analysis results. 
5.  To compile the report, open `documents/report.Rmd` and compile the file using `knitr`.
