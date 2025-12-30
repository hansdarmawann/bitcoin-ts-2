# ============================================================
# 03_baseline_model.R
# Baseline daily forecasting models
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

message("Rows for modeling: ", nrow(btc_ts))

# ------------------------------------------------------------
# 2. Train / test split (last 14 days as test)
# ------------------------------------------------------------
horizon <- 14

btc_train <- btc_ts %>%
  filter(date <= max(date) - days(horizon))

btc_test <- btc_ts %>%
  filter(date > max(date) - days(horizon))

message("Train rows: ", nrow(btc_train))
message("Test rows : ", nrow(btc_test))

# ------------------------------------------------------------
# 3. Fit baseline models
# ------------------------------------------------------------
models <- btc_train %>%
  model(
    naive = NAIVE(close),
    drift = RW(close ~ drift()),
    arima = ARIMA(close)
  )

report(models)

# ------------------------------------------------------------
# 4. Forecast
# ------------------------------------------------------------
fc <- models %>%
  forecast(h = horizon)

# ------------------------------------------------------------
# 5. Visual comparison
# ------------------------------------------------------------
p_fc <- autoplot(fc, btc_ts) +
  labs(
    title = "Daily Bitcoin Forecast (Baseline Models)",
    x = "Date",
    y = "Price"
  ) +
  theme_minimal()

print(p_fc)

message("✅ Baseline forecasting completed.")
