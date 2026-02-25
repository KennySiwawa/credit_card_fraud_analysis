
# Credit Card Fraud Analysis

A comprehensive data analytics project that analyzes online payment transaction data to identify fraudulent behaviour patterns and financial risk indicators.

## 🎯 Project Overview

This project focuses on detecting anomalies, classifying transactions, and evaluating fraud probability based on transaction behavior and account balance changes in digital payment systems.

📋 Objectives

- **Identify fraudulent behavior patterns** in digital payment transactions
- **Detect anomalies** in transaction data
- **Classify transactions** as legitimate or fraudulent
- **Evaluate fraud probability** based on transaction behavior
- **Analyse account balance changes** to identify suspicious activities
- **Assess financial risk indicators** accross payment plartforms

## ✨ Key Features

- Transaction behavior analysis
- Account balance change tracking
- Fraud probability scoring
- Anomaly detection in payment patterns
- Risk indicator identification
- Interactive data visualizations
- Comprehensive fraud reports

## 🛠️ Technologies Used

- **Python** - Data analysis and processing
- **SQL** - Database querying and data manipulation
- **Tableau** - Data visualization and dashboards
- **Jupyter Notebook** - Exploratory data analysis
- **Google Sheets** - Data collaboration and reporting

## 📊 Dataset

**Source:** [Credit Card Transactions Fraud Detection Dataset | Kaggle](https://www.kaggle.com/datasets/kartik2112/fraud-detection)

The dataset includes:
- Transaction amounts
- Transaction timestamps
- Merchant information
- Account balances
- Transaction types
- Customer demographics
- Geographic data

## 🚀 Getting Started

### Prerequisites

```bash
Python 3.8+
SQL database (Google BigQuery)
Looker Studio
Jupyter Notebook
```

### Installation

```bash
# Clone the repository
git clone https://github.com/credit_card_fraud_analysis.git
cd credit_card_fraud_analysis

# Install required Python packages
pip install -r requirements.txt

# Launch Jupyter Notebook
jupyter notebook
```

### Required Python Libraries

```txt
pandas
numpy
matplotlib
seaborn
sqlalchemy
plotly
scipy
```

## 📁 Project Structure

```
├── data/
│   ├── raw/                    # raw data
│   └── cleaned/                # Cleaned and transformed data
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_Explaratory_Data_Analysis.ipynb
│   └── 04_sql_analysis.ipynb
├── reports/
│   └──                         # Analysis reports
├── scripts/
│   └── prepare_looker_data.py
├── sql/
│   ├── queries/                # SQL queries for analysis
├── visualizations/
│   ├── charts/                 # Final Dashboard
│   └── LookerStudio/           # Final Dashboard
└── README.md
```

## 🔍 Analysis Approach

### 1. Data Understanding
- Understanding transaction patterns
- Identifying data quality issues
- Statistical summary of transactions

### 2. Data Cleaning & Preprocessing
- Handling missing values
- Removing duplicates
- Feature engineering
- Data normalization

### 3. Fraud Detection Analysis
- **Transaction Behavior Analysis**
  - Transaction frequency patterns
  - Unusual transaction amounts
  - Time-based anomalies
  
- **Account Balance Analysis**
  - Balance depletion patterns
  - Rapid balance changes
  - Negative balance occurrences

- **Risk Indicators**
  - High-value transactions
  - Geographic anomalies
  - Merchant category risks

### 4. Classification & Scoring
- Binary classification (Fraud/Legitimate)
- Fraud probability scoring
- Risk level categorization (Low/Medium/High)

### 5. Visualization & Reporting
- Interactive Looker Studio dashboards
- Trend analysis charts
- Geographic heat maps
- Risk distribution graphs

## 📈 Key Metrics & KPIs

- **Fraud Rate**: Percentage of fraudulent transactions
- **Average Fraud Amount**: Mean value of fraudulent transactions
- **Detection Accuracy**: Correctly identified fraud cases
- **False Positive Rate**: Legitimate transactions flagged as fraud
- **Risk Score Distribution**: Breakdown of transaction risk levels

## 📊 Sample Visualizations

The project includes:
- Transaction volume over time
- Fraud vs. legitimate transaction comparison
- Geographic distribution of fraud
- Fraud probability distribution
- Account balance change patterns
- Top risk indicators dashboard

## 🔎 Key Findings

*This section will be updated with analysis results*


## 👨‍💻 Author

**Kenny Siwawa Chikwama**
- GitHub: [@KennySiwawa](https://github.com/KennySiwawa)
- Project Focus: Financial Data Analytics, Fraud Detection, Transaction Analysis, Risk Analysis, Data Visualization

## 🤝 Contributing

This is an academic/portfolio project. Suggestions and feedback are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request


## 🙏 Acknowledgments

- Kaggle for providing the fraud detection dataset
- Open-source data analysis tools and libraries

## 📧 Contact

For questions or collaboration opportunities, please open an issue in this repository.

---

**Disclaimer**: This project is for educational and portfolio purposes. Any insights or models should be validated before use in production environments.
```
