# ============================================================
# 01_load_data.R
# Load DAILY Bitcoin data (R-native, tsibble)
# ============================================================

library(tidyverse)
library(tsibble)
library(lubridate)

# ------------------------------------------------------------
# 1. Load raw DAILY data
# ------------------------------------------------------------
btc_raw <- read_csv(
  "data/btc_2014_2025.csv",   # yes, file name can stay for now
  show_col_types = FALSE
)

message("Rows loaded (daily): ", nrow(btc_raw))

# ------------------------------------------------------------
# 2. Basic validation
# ------------------------------------------------------------
required_cols <- c("date", "close")

missing_cols <- setdiff(required_cols, names(btc_raw))
if (length(missing_cols) > 0) {
  stop(
    "Missing required columns: ",
    paste(missing_cols, collapse = ", ")
  )
}

# ------------------------------------------------------------
# 3. Parse date & clean
# ------------------------------------------------------------
btc_clean <- btc_raw %>%
  mutate(
    date = as.Date(date),
    close = as.numeric(close)
  ) %>%
  arrange(date)

# ------------------------------------------------------------
# 4. Convert to DAILY tsibble
# ------------------------------------------------------------
btc_ts <- btc_clean %>%
  as_tsibble(index = date)

# ------------------------------------------------------------
# 5. Sanity checks
# ------------------------------------------------------------
gaps <- has_gaps(btc_ts)

if (nrow(gaps) > 0) {
  warning("⚠️ Time series has missing DAYS (gaps detected)")
  print(gaps)
}

if (any(is.na(btc_ts$close))) {
  warning("⚠️ Missing values detected in 'close'")
}

# ------------------------------------------------------------
# 6. Preview
# ------------------------------------------------------------
print(btc_ts)
glimpse(btc_ts)

message("✅ Daily Bitcoin data successfully loaded as tsibble.")

