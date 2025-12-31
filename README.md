# 📈 Daily Bitcoin Time Series Analysis (2014–2025)

**Author:** Hans Darmawan  
**Language:** R  
**Domain:** Financial Time Series & Forecasting  
**Frequency:** Daily (2014–2025)

---

## 📌 Project Overview

This repository contains a **comprehensive daily Bitcoin time series analysis** spanning **2014–2025**, implemented using a **modern tidy time-series workflow** in R.

The project emphasizes:

- Reproducible financial time series pipelines
- Explicit temporal data structures using `tsibble`
- Exploratory analysis of price and volatility regimes
- Strong **baseline forecasting benchmarks** using `fable`

The analysis is designed as a **foundation for advanced financial modeling**, not as a trading system.

---

## 🎯 Objectives

- Validate and clean long-horizon cryptocurrency price data  
- Explore Bitcoin’s trend, volatility, and regime behavior  
- Establish interpretable baseline forecasting models  
- Enable future extensions (returns, volatility, regime models)

---

## 📂 Repository Structure

```text
bitcoin-ts-2/
│
├── data/
│   └── btc_2014_2025.csv        # Daily Bitcoin OHLCV data
│
├── notebooks/
│   ├── notebook.Rmd            # Main exploratory + modeling notebook
│   └── notebook.html           # Rendered HTML output
│
├── reports/
│   └── bitcoin_analysis.Rmd    # Formal analysis report
│
├── scripts/
│   ├── 01_load_data.R          # Data loading & validation
│   ├── 02_eda.R                # Exploratory data analysis
│   ├── 03_models.R             # Baseline forecasting models
│   └── 04_evaluation.R         # Model evaluation
│
├── renv/
│   ├── activate.R              # renv activation
│   └── library/                # Local package cache
│
├── renv.lock                   # Exact dependency versions
├── bitcoin-ts-2.Rproj          # RStudio project
├── README.md
└── .gitignore
````

All file paths are handled using the **`here` package**, ensuring portability across machines and operating systems.

---

## 🧰 Environment & Reproducibility

This project uses **`renv`** for dependency management.

### Restore the exact environment

```r
renv::restore()
```

This guarantees identical package versions across collaborators and systems.

---

## 📦 Core Libraries

The analysis relies on:

* **tidyverse** — data wrangling & visualization
* **tsibble** — tidy temporal data structures
* **lubridate** — date manipulation
* **slider** — rolling window statistics
* **fable** — modern forecasting models
* **here** — reproducible relative paths

All libraries are loaded explicitly to ensure deterministic execution.

---

## 📥 Data Description

**File:** `data/btc_2014_2025.csv`
**Frequency:** Daily

Required columns:

* `date` — calendar date
* `close` — daily closing price

Additional OHLCV fields are retained for extensibility.

---

## 🧹 Data Processing

Key preprocessing steps:

* Convert `date` to `Date`
* Cast prices to numeric
* Chronological ordering
* Conversion to a **daily tsibble**

This enables:

* Gap detection
* Rolling statistics
* Time-aware forecasting

---

## ✅ Sanity Checks

* Calendar gap detection
* Missing value validation on `close`

These checks are critical in financial time series to avoid biased estimates.

---

## 📊 Exploratory Data Analysis (EDA)

EDA focuses on understanding Bitcoin’s structural behavior:

* Long-term growth trend
* Extreme volatility relative to traditional assets
* Volatility clustering
* Bull / bear market regimes

### Key Analyses

* Full history price (2014–2025)
* Last 2 years zoom-in
* 30-day rolling mean
* 30-day rolling volatility (standard deviation)

---

## 🔮 Forecasting Models

Baseline models provide performance benchmarks:

* **Naive**
* **Random Walk with Drift**
* **ARIMA (automatic order selection)**

Despite simplicity, these models often perform competitively over short horizons.

---

## 🧪 Train–Test Design

* Rolling-origin split
* Last **14 days** used for testing
* No future information leakage

---

## 📏 Evaluation Metrics

Out-of-sample accuracy is assessed using:

* MAE — Mean Absolute Error
* RMSE — Root Mean Squared Error
* MAPE — Mean Absolute Percentage Error

### Result Summary (RMSE Ranking)

| Model                | Performance |
| -------------------- | ----------- |
| Random Walk w/ Drift | Best        |
| ARIMA                | Moderate    |
| Naive                | Worst       |

---

## 🧠 Key Takeaways

✔ Daily Bitcoin data validated and structured
✔ Clear trend and volatility regimes identified
✔ Strong baseline forecasting benchmarks established
✔ Fully reproducible R + renv pipeline

---

## 🚀 Future Extensions

Planned or suggested extensions:

* Log-return modeling
* Volatility models (GARCH family)
* Weekly / monthly aggregation
* Regime-switching & structural breaks
* Macro or on-chain feature integration

---

## ⚠️ Disclaimer

This project is **for educational and research purposes only**.
It does **not** constitute financial or investment advice.

---

## 👤 Author

**Hans Darmawan**
Data Science • Time Series • Financial Analytics