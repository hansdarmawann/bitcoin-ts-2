# ============================================================
# 02_eda_daily.R
# Exploratory Data Analysis (Daily Bitcoin)
# ============================================================

library(tidyverse)
library(tsibble)
library(lubridate)
library(slider)

# ------------------------------------------------------------
# 1. Load daily tsibble (reuse logic from 01)
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

message("EDA rows: ", nrow(btc_ts))

# ------------------------------------------------------------
# 2. Long-horizon daily price (full history)
# ------------------------------------------------------------
p_full <- ggplot(btc_ts, aes(date, close)) +
  geom_line(alpha = 0.6) +
  theme_minimal() +
  labs(
    title = "Bitcoin Daily Closing Price (Full History)",
    x = "Date",
    y = "Price"
  )

print(p_full)

# ------------------------------------------------------------
# 3. Recent window (last 2 years)
# ------------------------------------------------------------
btc_recent <- btc_ts %>%
  filter(date >= max(date) - years(2))

p_recent <- ggplot(btc_recent, aes(date, close)) +
  geom_line(color = "steelblue") +
  theme_minimal() +
  labs(
    title = "Bitcoin Daily Closing Price (Last 2 Years)",
    x = "Date",
    y = "Price"
  )

print(p_recent)

# ------------------------------------------------------------
# 4. Rolling mean (30-day)
# ------------------------------------------------------------
btc_roll <- btc_ts %>%
  mutate(
    close_ma_30 = slide_dbl(
      close,
      mean,
      .before = 29,
      .complete = TRUE
    )
  )

p_ma <- ggplot(btc_roll, aes(date)) +
  geom_line(aes(y = close), alpha = 0.4) +
  geom_line(aes(y = close_ma_30), color = "red", linewidth = 0.8) +
  theme_minimal() +
  labs(
    title = "Daily Price with 30-Day Rolling Mean",
    x = "Date",
    y = "Price"
  )

print(p_ma)

# ------------------------------------------------------------
# 5. Rolling volatility (30-day)
# ------------------------------------------------------------
btc_vol <- btc_ts %>%
  mutate(
    vol_30 = slide_dbl(
      close,
      sd,
      .before = 29,
      .complete = TRUE
    )
  )

p_vol <- ggplot(btc_vol, aes(date, vol_30)) +
  geom_line(color = "darkorange") +
  theme_minimal() +
  labs(
    title = "30-Day Rolling Volatility (Std Dev)",
    x = "Date",
    y = "Volatility"
  )

print(p_vol)

message("✅ Daily EDA completed.")
