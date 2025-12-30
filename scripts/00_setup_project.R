# ============================================================
# Project setup script: bitcoin-ts-2
# Creates standard project folder structure
# ============================================================

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

# Optional: create placeholder README
if (!file.exists("README.md")) {
  writeLines(
    c(
      "# bitcoin-ts-2",
      "",
      "Monthly Bitcoin Time Series Forecasting using R.",
      "",
      "This project is a clean R-native rebuild of bitcoin-ts-1.",
      "",
      "Stack:",
      "- tidyverse",
      "- tsibble",
      "- fable",
      "- renv"
    ),
    "README.md"
  )
  message("Created README.md")
} else {
  message("README.md already exists")
}

message("✅ Project setup completed.")
