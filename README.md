# 📈 Daily Bitcoin Time Series Analysis (2014–2025)

**Author:** Hans Darmawan  
**Language:** R  
**Domain:** Financial Time Series & Forecasting  
**Frequency:** Daily  

---

## 📌 Project Overview

This repository presents a **comprehensive daily Bitcoin time series analysis** covering the period **2014–2025**, implemented using a **modern tidy time-series workflow** in R.

The project focuses on:
- Reproducible financial time-series pipelines
- Explicit temporal data structures using `tsibble`
- Exploratory analysis of price, trend, and volatility regimes
- Establishing **strong baseline forecasting benchmarks**

This work is intended as a **modeling and analytical foundation**, not as a trading system.

---

## 🎯 Objectives

- Validate and structure long-horizon Bitcoin price data  
- Explore long-term trends, short-term dynamics, and volatility clustering  
- Establish interpretable baseline forecasting models  
- Provide a benchmark for more advanced time-series methods  

---

## 📂 Repository Structure

```text
bitcoin-ts-2/
│
├── data/
│   └── btc_2014_2025.csv
│
├── notebooks/
│   ├── notebook.Rmd
│   └── notebook.pdf
│
├── scripts/
│   ├── 01_load_data.R
│   ├── 02_eda.R
│   ├── 03_models.R
│   └── 04_evaluation.R
│
├── renv/
├── renv.lock
├── bitcoin-ts-2.Rproj
├── README.md
└── .gitignore
````

All file paths are handled using the **`here` package**, ensuring portability.

---

## 🧰 Environment & Reproducibility

This project uses **`renv`** for dependency management.

```r
renv::restore()
```

This guarantees identical package versions across systems.

---

## 📦 Core Libraries

* **tidyverse** — data manipulation & visualization
* **tsibble** — tidy temporal data structures
* **lubridate** — date handling
* **slider** — rolling-window statistics
* **fable** — forecasting models
* **here** — reproducible file paths

---

## 📥 Data Description

**File:** `btc_2014_2025.csv`
**Observations:** 4,121 daily rows

Key fields:

* `date` — calendar date
* `close` — daily closing price

Additional OHLCV fields are retained for extensibility.

---

## 🧹 Data Processing

The dataset is:

* Parsed into proper date and numeric formats
* Sorted chronologically
* Converted into a **daily tsibble**

The resulting structure explicitly encodes time and supports:

* Gap detection
* Rolling statistics
* Time-aware forecasting

---

## ✅ Sanity Checks

Sanity checks reveal:

* ⚠️ **Missing calendar days detected**
* ✅ **No missing values in the `close` price**

This indicates **structural gaps (missing dates)** rather than data corruption.
Such gaps are common in historical crypto data and must be handled deliberately in modeling.

---

## 📊 Exploratory Data Analysis (EDA)

EDA reveals several key characteristics of Bitcoin price behavior:

* Strong long-term upward trend
* Extreme volatility relative to traditional assets
* Clear bull–bear market cycles
* Pronounced volatility clustering

### Key Visual Analyses

* Full price history (2014–2025)
* Last 2 years (short-term dynamics)
* 30-day rolling mean (trend smoothing)
* 30-day rolling volatility (risk regimes)

These analyses confirm **non-stationarity and regime-dependent behavior**, motivating careful model selection.

---

## 🔮 Baseline Forecasting Models

Three baseline models are evaluated:

* **Naive** — last observed value
* **Random Walk with Drift** — extrapolates recent average change
* **ARIMA** — automatic order selection

Baseline models are intentionally simple but often highly competitive in financial time series.

---

## 🧪 Train–Test Design

* **Training observations:** 4,108
* **Test observations:** 13
* **Forecast horizon:** 14 days

The split preserves temporal ordering and avoids information leakage.

A warning indicates **one missing future observation (2025-12-28)**, which is treated as `NA` and does not invalidate comparative evaluation.

---

## 📏 Model Evaluation

Out-of-sample accuracy is evaluated using:

* MAE — Mean Absolute Error
* RMSE — Root Mean Squared Error
* MAPE — Mean Absolute Percentage Error

### 🔢 Accuracy Summary

| Model                    | MAE         | RMSE        | MAPE      |
| ------------------------ | ----------- | ----------- | --------- |
| **Random Walk w/ Drift** | **1195.58** | **1304.07** | **1.36%** |
| ARIMA                    | 1275.78     | 1370.92     | 1.45%     |
| Naive                    | 1327.61     | 1429.76     | 1.51%     |

---

## 🧠 Key Findings

* **Random Walk with Drift** achieves the best overall performance across all metrics
* **ARIMA** improves slightly over Naive but does **not outperform Drift**
* **Naive** remains a useful lower-bound benchmark
* Added model complexity does **not guarantee better accuracy** in short-horizon Bitcoin forecasting

These results reinforce a key principle in financial time series:

> *Simple models often capture most short-term predictive power.*

---

## 🚀 Future Extensions

Potential extensions include:

* Log-return modeling
* Volatility-aware models (GARCH)
* Weekly or monthly aggregation
* Regime-switching and structural break detection
* Integration of macro or on-chain indicators

---

## ⚠️ Disclaimer

This project is for **educational and research purposes only**.
It does **not** constitute financial or investment advice.

---

## 👤 Author

**Hans Darmawan**
Data Science • Time Series • Financial Analytics