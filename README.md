## Credit Card Fraud Analysis

An end-to-end data analytics project that explores credit card transaction data to identify fraud patterns, quantify financial exposure, and highlight high-risk categories, merchants, states, and time periods.

---

## 🎯 Project Overview

This project analyzes traansaction-level credit card data to uncover fraud trends and support risk-based decision-making. The workflow combines data exploration in Python, query-based analysis in Bigquery, and dashboard development in Looker Studio to turn raw transaction data into actionable fraud insights.

---

## 📋 BUsiness Objectives

The goal of this project is to answer key fraud-monitoring questions such as: this is 

* How frequent are fraudelent transactions?
* What share of transaction value is lost to fraud?
* Which categories, merchants, and states show higher fraud concentration?
* How does fraud activity change over time?

This type of analysis can support fraud analysts, risk teams, and financial institutions in prioritizing monitoring efforts and improving fraud prevention strategies.

---

## 📊 Dataset

**Source:**  [Credit Card Transactions Fraud Detection Dataset | Kaggle](https://www.kaggle.com/datasets/kartik2112/fraud-detection)

The dataset includes transaction-level attributes such as:

* Transaction ID and timestamp
* Card type
* Transaction amount
* Merchant and category
* State and city
* Geographic information
* Frad flag
* Risk-related engineered fields

---
## Tech Stack

- **Python**: Pandas, NumPy, Matplotlib, Seaborn
- **SQL**: BigQuery Standard SQL
- **Dash Visualisation**: Looker Studio
- **Environment**: Jupyter Notebook

---

## 📁 Project Structure

```
├── data/
│   ├── raw/                    # Original Dataset
│   └── cleaned/                # Cleaned and transformed data
├── notebooks/
│   ├──  01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_Explaratory_Data_Analysis.ipynb
├── reports/
│   └──                         # Analysis reports
├── sql/
│   └── bigquery/
│   │   ├── 01_kpis_bigquery.sql
│   │   ├── 02_fraud_by_category_bigquery.sql
│   │   ├── 03_fraud_by_state_bigquery.sql
│   │   ├── 04_monthly_fraud_count_bigquery.sql
│   │   ├── 05_top_high_risk_merchants_bigquery.sql
│   │   ├── 06_filter_support_bigquery.sql
│   │   └── 07_data_quality_checks_bigquery.sql
├── visualizations/
│   └── LookerStudio/
│       └── Credit Card Fraud Analysis Dashboard.png
└── README.md
```

---

## 🔍 Analysis Approach

### 1. Data Understanding

* Reviewed dataset structure and column types
* Explored transaction distribution and fraud frequency
* Assessed data quality issues

### 2. Data Preparation

* Cleaned and standardized fields
* Validated key analytical columns
* Prepared the dataset for SQL-based reporting

### 3. SQL Analysis

* KPI cards
* Fraud by category
* Fraud by state
* Monthly fraud trend
* Top high-risk merchants
* Filter support and data quality checks

### 4. Dashboard Development

Created an interactive dashboard in Looker Studio to visualize fraud exposure, category concentration, geographic distribution, merchant risk, and time-based trends.

---

## Key Metrics 

The dashboard tracks:

* **Total Transactions**
* **Fraud Transactions**
* **Fraud Rate (%)**
* **Total Transaction Amount**
* **Fraudulent Amount**
* **Fraudulent Amount (%)**
* **Fraud Count by Category**
* **Fraud Count by State**
* **Monthly Fraud Count**
* **Top High-Risk Merchants**

---

## 📈 Key Insights

* **Fraud Rate**
* **Fraudulent Transaction Value (%)**
* **Fraud Count by Category**
* **Fraud by Time (Monthly Trends)**
* **Fraud Distribution by Geography**

---

## 🔎 Key Insights

* Fraud represented a small share of total transactions (**0.60%**) but a much larger share of transaction value (**4.62%**), indicating disproportionate financial exposure.

* Fraud is concentrated in specific categories, particularly **online shopping and point-of-sale transactions**, making them critical monitoring areas.

* **High-value transactions** are significantly more likely to be fraudulent, making transaction size a strong risk indicator.

* Fraud activity shows **clear temporal patterns**, with peaks during certain months, suggesting non-random behavior.

* Fraud is **geographically concentrated**, indicating that regional risk-based monitoring could improve detection.

* A small number of merchants contribute disproportionately to fraud cases, highlighting **merchant-specific vulnerabilities**.

---

## 💼 Business Impact

This analysis shows how transaction data can be transformed into a monitoring layer for fraud detection and risk reporting. In a real business setting, the same logic could help teams:

* Prioritizing **high-value and high-risk category transactions** can reduce financial losses
* **Time-based monitoring systems** can improve fraud detection efficiency
* **Merchant-level risk scoring** can help identify weak points in the transaction ecosystem
* Geographic insights enable **targeted fraud prevention strategies**

---

## Dashboard Preview

<img src="visualizations/LookerStudio/Credit Card Fraud Analysis Dashboard.png" alt="Credit Card Fraud Analysis dashboard screenshot" width="1000">

---

## 🚀 Getting Started

```bash
git clone https://github.com/credit_card_fraud_analysis.git
cd credit_card_fraud_analysis
pip install -r requirements.txt
jupyter notebook
```

---

## 👨‍💻 Author

**Kenny Siwawa Chikwama**
Focus: Data Analytics | Financial Analysis | Financial Risk Insights

---

## 📌 Note

This project is for analytical and educational purposes. Insights should be validated before real-world deployment.
