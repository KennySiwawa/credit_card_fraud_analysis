
# Fraud Detection Analytics for Card Transactions

A comprehensive data analytics project that analyzes online payment transaction dat to identify fraudulent behaviour patterns and financial risk indicators.

## 🎯 Project Overview

This project focuses on detenting anomalies, classifying transactions, and evaluating fraud probability based on transaction behavior and account balance changes in digital payment systems.

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

**Source:** [Credit Card Transactions Fraud Detection Dataset | Kaggle](https://www.kaggle.com/datasets)

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
SQL database (PostgreSQL/MySQL/SQLite)
Tableau Desktop or Tableau Public
Jupyter Notebook
```

### Installation

```bash
# Clone the repository
git clone https://github.com/KennySiwawa/fraud_detection_card_transactions.git
cd fraud-detection-card-transactions

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
│   ├── processed/              # Cleaned and transformed data
│   └── database/               # SQL database files
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_fraud_analysis.ipynb
│   └── 04_risk_assessment.ipynb
├── sql/
│   ├── queries/                # SQL queries for analysis
│   └── schema.sql              # Database schema
├── visualizations/
│   ├── tableau/                # Tableau workbooks
│   └── charts/                 # Exported charts and graphs
├── reports/
│   └── findings/               # Analysis reports
├── scripts/
│   ├── data_processing.py
│   ├── anomaly_detection.py
│   └── fraud_classifier.py
└── README.md
```

## 🔍 Analysis Approach

### 1. Data Exploration
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
- Interactive Tableau dashboards
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

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Kaggle for providing the fraud detection dataset
- Financial analytics research community
- Open-source data analysis tools and libraries

## 📧 Contact

For questions or collaboration opportunities, please open an issue in this repository.

---

**Disclaimer**: This project is for educational and portfolio purposes. Any insights or models should be validated before use in production environments.
```