-- Dashboard KPI cards for BigQuery

SELECT
    COUNT(*) AS `TOTAL TRANSACTIONS`,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS `FRAUD TRANSACTIONS`,
    ROUND(100 * SAFE_DIVIDE(SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END), COUNT(*)), 2) AS `FRAUD RATE %`,
    ROUND(SUM(amt), 2) AS `TOTAL AMOUNT`,
    ROUND(SUM(CASE WHEN is_fraud = 1 THEN amt ELSE 0 END), 2) AS `FRAUDULENT AMOUNT`,
    ROUND(100 * SAFE_DIVIDE(SUM(CASE WHEN is_fraud = 1 THEN amt ELSE 0 END), SUM(amt)), 2) AS `FRAUDULENT AMOUNT %`
FROM `Credit_Card_Fraud_Analytics.fraud_data`;


-- Donut chart: fraud cases by category for BigQuery

SELECT
    category,
    COUNT(*) AS fraud_count,
    ROUND(100 * SAFE_DIVIDE(COUNT(*), SUM(COUNT(*)) OVER ()), 2) AS fraud_pct
FROM `Credit_Card_Fraud_Analytics.fraud_data`
WHERE is_fraud = 1
GROUP BY category
ORDER BY fraud_count DESC;

-- Map chart: fraud cases by state for BigQuery

SELECT
  state,
  COUNT(*) AS fraud_count
FROM `Credit_Card_Fraud_Analytics.fraud_data`
WHERE is_fraud = 1
GROUP BY state
ORDER BY fraud_count DESC;

-- Line chart: monthly fraud count for BigQuery

SELECT
    transaction_year,
    transaction_month,
    COUNT(*) AS fraud_count
FROM `Credit_Card_Fraud_Analytics.fraud_data`
WHERE is_fraud = 1
GROUP BY transaction_year, transaction_month
ORDER BY transaction_year;

-- Table: top high-risk merchants for BigQuery

SELECT
    merchant,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_count,
    ROUND(100 * SAFE_DIVIDE(SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END), COUNT(*)), 2) AS fraud_rate_pct,
    ROUND(SUM(amt), 2) AS total_amount,
    ROUND(SUM(CASE WHEN is_fraud = 1 THEN amt ELSE 0 END), 2) AS fraudulent_amount
FROM `Credit_Card_Fraud_Analytics.fraud_data`
GROUP BY merchant
HAVING SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) > 0
ORDER BY fraud_count DESC, fraud_rate_pct DESC, total_amount DESC
LIMIT 10;

-- Filter support queries for BigQuery dashboard controls

SELECT DISTINCT transaction_year
FROM `Credit_Card_Fraud_Analytics.fraud_data`
ORDER BY transaction_year;

SELECT DISTINCT card_type
FROM `Credit_Card_Fraud_Analytics.fraud_data`
ORDER BY card_type;

-- Example of a filtered KPI query
SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(100 * SAFE_DIVIDE(SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END), COUNT(*)), 2) AS fraud_rate_pct,
    ROUND(SUM(amt), 2) AS total_amount,
    ROUND(SUM(CASE WHEN is_fraud = 1 THEN amt ELSE 0 END), 2) AS fraudulent_amount,
    ROUND(100 * SAFE_DIVIDE(SUM(CASE WHEN is_fraud = 1 THEN amt ELSE 0 END), SUM(amt)), 2) AS fraudulent_amount_pct
FROM `Credit_Card_Fraud_Analytics.fraud_data`
WHERE transaction_year = 2019
  AND card_type = 'Visa';