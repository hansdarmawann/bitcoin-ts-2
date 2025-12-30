# ============================================================
# 04_evaluation.R
# Baseline model evaluation (daily)
# ============================================================

library(tidyverse)
library(tsibble)
library(fable)
library(lubridate)

# ------------------------------------------------------------
# 1. Load daily tsibble
# ------------------------------------------------------------
btc_ts <- read_csv(
  "data/btc_2014_2025.csv",
  show_col_types = FALSE
) %>%
  mutate(
    date = as.Date(date),
    close = as.numeric(close)
  ) %>%
  arrange(date) %>%
  as_tsibble(index = date)

# ------------------------------------------------------------
# 2. Train / test split (same as step 03)
# ------------------------------------------------------------
horizon <- 14

btc_train <- btc_ts %>%
  filter(date <= max(date) - days(horizon))

btc_test <- btc_ts %>%
  filter(date > max(date) - days(horizon))

# ------------------------------------------------------------
# 3. Fit baseline models
# ------------------------------------------------------------
models <- btc_train %>%
  model(
    naive = NAIVE(close),
    drift = RW(close ~ drift()),
    arima = ARIMA(close)
  )

# ------------------------------------------------------------
# 4. Forecast on test horizon
# ------------------------------------------------------------
fc <- models %>%
  forecast(h = horizon)

# ------------------------------------------------------------
# 5. Accuracy metrics (out-of-sample)
# ------------------------------------------------------------
acc <- accuracy(fc, btc_test)

print(acc)

# ------------------------------------------------------------
# 6. Simple comparison table
# ------------------------------------------------------------
acc_summary <- acc %>%
  select(.model, MAE, RMSE, MAPE) %>%
  arrange(RMSE)

print(acc_summary)

message("✅ Baseline evaluation completed.")
