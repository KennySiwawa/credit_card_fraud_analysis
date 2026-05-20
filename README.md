# Credit Card Fraud Analysis


---

## 🎯 Project Overview

This project performs **exploratory data analysis (EDA)** on credit card transactions to identify fraud trends, behavioral patterns, and key risk indicators that can support fraud prevention strategies.

---

## 📋 Objectives

* Identify **fraudulent transaction patterns**
* Detect **anomalies in transaction behavior**
* Analyze **high-risk transaction characteristics**
* Examine **account balance changes linked to fraud**
* Evaluate **financial risk indicators across transactions**

---

## 🛠️ Tech Stack

* **Python** (Pandas, NumPy, Matplotlib, Seaborn)
* **SQL** (BigQuery)
* **Data Visualization** (Tableau / Looker Studio)
* **Jupyter Notebook**

---

## 📊 Dataset

**Source:**  [Credit Card Transactions Fraud Detection Dataset | Kaggle](https://www.kaggle.com/datasets/kartik2112/fraud-detection)

The dataset includes:

* Transaction amounts and timestamps
* Merchant and transaction types
* Account balances
* Customer demographics
* Geographic information

---

## 📁 Project Structure

```
├── data/
│   ├── raw/                    # raw data
│   └── cleaned/                # Cleaned and transformed data
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_Explaratory_Data_Analysis.ipynb
├── reports/
│   └──                         # Analysis reports
├── sql/
│   └── dashboard_queries.sql   # SQL queries for analysis
├── visualizations/
│   └── LookerStudio/           # Final Dashboard
└── README.md
```

---

## 🔍 Analysis Approach

### 1. Data Understanding

* Explored transaction distributions and dataset structure
* Identified data quality issues

### 2. Data Cleaning

* Handled missing values and duplicates
* Performed feature engineering

### 3. Exploratory Data Analysis

* Transaction behavior patterns
* Fraud distribution across time, category, and geography
* Account balance change analysis

### 4. Risk Analysis

* High-value transaction patterns
* Merchant-level fraud concentration
* Geographic fraud trends

### 5. Visualization

* Interactive dashboards
* Time-series fraud trends
* Category and geographic breakdowns

---

## 📈 Key Metrics

* **Fraud Rate**
* **Fraudulent Transaction Value (%)**
* **Fraud Count by Category**
* **Fraud by Time (Monthly Trends)**
* **Fraud Distribution by Geography**

---

## 🔎 Key Insights

* Fraud transactions are rare (**0.60%**) but account for a **disproportionately high financial impact (4.62%)**, indicating targeting of high-value transactions.

* Fraud is concentrated in specific categories, particularly **online shopping and point-of-sale transactions**, making them critical monitoring areas.

* **High-value transactions** are significantly more likely to be fraudulent, making transaction size a strong risk indicator.

* Fraud activity shows **clear temporal patterns**, with peaks during certain months, suggesting non-random behavior.

* Fraud is **geographically concentrated**, indicating that regional risk-based monitoring could improve detection.

* A small number of merchants contribute disproportionately to fraud cases, highlighting **merchant-specific vulnerabilities**.

---

## 💼 Business Implications

* Prioritizing **high-value and high-risk category transactions** can reduce financial losses
* **Time-based monitoring systems** can improve fraud detection efficiency
* **Merchant-level risk scoring** can help identify weak points in the transaction ecosystem
* Geographic insights enable **targeted fraud prevention strategies**

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
Focus: Data Analytics | Financial Analysis | Fraud Detection

---

## 📌 Note

This project is for analytical and educational purposes. Insights should be validated before real-world deployment.
