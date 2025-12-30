# ============================================================
# 00_setup_project.R
# Project scaffolding for bitcoin-ts-2 (monthly, R)
# ============================================================

# ---- Folder structure ----
folders <- c(
  "data",
  "scripts",
  "reports",
  "notebooks"
)

for (f in folders) {
  if (!dir.exists(f)) {
    dir.create(f, recursive = TRUE)
    message("Created folder: ", f)
  } else {
    message("Folder already exists: ", f)
  }
}

# ---- Helper to create file if not exists ----
create_file_if_missing <- function(path, lines = character()) {
  if (!file.exists(path)) {
    writeLines(lines, path)
    message("Created file: ", path)
  } else {
    message("File already exists: ", path)
  }
}

# ---- README ----
create_file_if_missing(
  "README.md",
  c(
    "# bitcoin-ts-2",
    "",
    "Monthly Bitcoin Time Series Forecasting using R.",
    "",
    "This project is an R-native rebuild of bitcoin-ts-1 (monthly scope).",
    "",
    "## Stack",
    "- tidyverse",
    "- tsibble",
    "- fable",
    "- renv"
  )
)

# ---- Script skeletons ----
create_file_if_missing(
  "scripts/01_load_data.R",
  c(
    "# ============================================================",
    "# 01_load_data.R",
    "# Load and prepare monthly Bitcoin data",
    "# ============================================================",
    "",
    "library(tidyverse)",
    "library(tsibble)",
    "library(lubridate)",
    "",
    "# TODO:",
    "# - Read monthly BTC CSV",
    "# - Validate columns",
    "# - Convert to tsibble",
    ""
  )
)

create_file_if_missing(
  "scripts/02_eda_monthly.R",
  c(
    "# ============================================================",
    "# 02_eda_monthly.R",
    "# Exploratory Data Analysis (Monthly)",
    "# ============================================================",
    "",
    "library(tidyverse)",
    "",
    "# TODO:",
    "# - Plot monthly trend",
    "# - Check seasonality",
    "# - Summary statistics",
    ""
  )
)

create_file_if_missing(
  "scripts/03_baseline_model.R",
  c(
    "# ============================================================",
    "# 03_baseline_model.R",
    "# Baseline time series models (Naive, ARIMA)",
    "# ============================================================",
    "",
    "library(tsibble)",
    "library(fable)",
    "",
    "# TODO:",
    "# - Fit naive model",
    "# - Fit ARIMA model",
    "# - Generate forecasts",
    ""
  )
)

create_file_if_missing(
  "scripts/04_evaluation.R",
  c(
    "# ============================================================",
    "# 04_evaluation.R",
    "# Model evaluation & comparison",
    "# ============================================================",
    "",
    "library(fable)",
    "",
    "# TODO:",
    "# - Compute accuracy metrics",
    "# - Compare models",
    ""
  )
)

# ---- Report skeleton ----
create_file_if_missing(
  "reports/bitcoin_ts_monthly_report.Rmd",
  c(
    "---",
    "title: \"Bitcoin Monthly Time Series Forecasting\"",
    "output: html_document",
    "---",
    "",
    "```{r setup, message=FALSE}",
    "library(tidyverse)",
    "```",
    "",
    "## Overview",
    "",
    "TODO: Project overview and objectives."
  )
)

message("✅ Project scaffolding completed.")
