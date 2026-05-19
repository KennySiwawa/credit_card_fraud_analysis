-- BigQuery dashboard queries for the credit card fraud analysis project.
-- Replace `project_id.dataset_id.fraud_transactions` with your actual table name before running.

-- 1) Executive summary KPIs
SELECT
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  COUNTIF(is_fraud = 0) AS legitimate_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(SUM(amt), 2) AS total_transaction_amount_usd,
  ROUND(SUM(IF(is_fraud = 1, amt, 0)), 2) AS total_fraud_amount_usd,
  ROUND(SAFE_DIVIDE(SUM(IF(is_fraud = 1, amt, 0)), SUM(amt)) * 100, 2) AS fraud_amount_share_pct,
  ROUND(AVG(IF(is_fraud = 1, amt, NULL)), 2) AS avg_fraud_transaction_usd,
  ROUND(AVG(IF(is_fraud = 0, amt, NULL)), 2) AS avg_legitimate_transaction_usd,
  COUNT(DISTINCT merchant) AS unique_merchants,
  COUNT(DISTINCT cc_num) AS unique_cardholders
FROM `project_id.dataset_id.fraud_transactions`;

-- 2) Monthly fraud trend
SELECT
  DATE_TRUNC(DATE(trans_date_trans_time), MONTH) AS transaction_month,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SUM(amt), 2) AS total_transaction_amount_usd,
  ROUND(SUM(IF(is_fraud = 1, amt, 0)), 2) AS total_fraud_amount_usd,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct
FROM `project_id.dataset_id.fraud_transactions`
GROUP BY transaction_month
ORDER BY transaction_month;

-- 3) Fraud performance by transaction category
SELECT
  category,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(AVG(amt), 2) AS avg_transaction_amount_usd,
  ROUND(AVG(IF(is_fraud = 1, amt, NULL)), 2) AS avg_fraud_transaction_usd,
  ROUND(SUM(IF(is_fraud = 1, amt, 0)), 2) AS total_fraud_amount_usd
FROM `project_id.dataset_id.fraud_transactions`
GROUP BY category
ORDER BY fraud_rate_pct DESC, fraudulent_transactions DESC;

-- 4) Top states by fraud count and rate
SELECT
  state,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(SUM(IF(is_fraud = 1, amt, 0)), 2) AS total_fraud_amount_usd
FROM `project_id.dataset_id.fraud_transactions`
GROUP BY state
ORDER BY fraudulent_transactions DESC, fraud_rate_pct DESC
LIMIT 15;

-- 5) Fraud pattern by hour of day
SELECT
  EXTRACT(HOUR FROM trans_date_trans_time) AS transaction_hour,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(AVG(amt), 2) AS avg_transaction_amount_usd
FROM `project_id.dataset_id.fraud_transactions`
GROUP BY transaction_hour
ORDER BY transaction_hour;

-- 6) Fraud pattern by day of week
SELECT
  FORMAT_DATE('%A', DATE(trans_date_trans_time)) AS transaction_day,
  MOD(EXTRACT(DAYOFWEEK FROM DATE(trans_date_trans_time)) + 5, 7) + 1 AS day_of_week_number,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct
FROM `project_id.dataset_id.fraud_transactions`
GROUP BY transaction_day, day_of_week_number
ORDER BY day_of_week_number;

-- 7) High-risk merchants with enough transaction volume
SELECT
  merchant,
  category,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(SUM(IF(is_fraud = 1, amt, 0)), 2) AS total_fraud_amount_usd
FROM `project_id.dataset_id.fraud_transactions`
GROUP BY merchant, category
HAVING COUNT(*) >= 25
ORDER BY fraudulent_transactions DESC, fraud_rate_pct DESC
LIMIT 20;

-- 8) Fraud risk by transaction amount band
WITH amount_bands AS (
  SELECT
    CASE
      WHEN amt < 10 THEN 'Very Small'
      WHEN amt < 50 THEN 'Small'
      WHEN amt < 100 THEN 'Medium'
      WHEN amt < 500 THEN 'Large'
      ELSE 'Very Large'
    END AS amount_category,
    CASE
      WHEN amt < 10 THEN 1
      WHEN amt < 50 THEN 2
      WHEN amt < 100 THEN 3
      WHEN amt < 500 THEN 4
      ELSE 5
    END AS amount_category_order,
    amt,
    is_fraud
  FROM `project_id.dataset_id.fraud_transactions`
)
SELECT
  amount_category,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(AVG(amt), 2) AS avg_transaction_amount_usd
FROM amount_bands
GROUP BY amount_category, amount_category_order
ORDER BY amount_category_order;

-- 9) Fraud risk by distance from merchant
WITH distance_analysis AS (
  SELECT
    CASE
      WHEN distance_from_merchant_km IS NULL THEN 'Unknown'
      WHEN distance_from_merchant_km <= 10 THEN '0-10 km'
      WHEN distance_from_merchant_km <= 50 THEN '10-50 km'
      WHEN distance_from_merchant_km <= 100 THEN '50-100 km'
      WHEN distance_from_merchant_km <= 500 THEN '100-500 km'
      ELSE '500+ km'
    END AS distance_band,
    CASE
      WHEN distance_from_merchant_km IS NULL THEN 6
      WHEN distance_from_merchant_km <= 10 THEN 1
      WHEN distance_from_merchant_km <= 50 THEN 2
      WHEN distance_from_merchant_km <= 100 THEN 3
      WHEN distance_from_merchant_km <= 500 THEN 4
      ELSE 5
    END AS distance_band_order,
    is_fraud,
    amt
  FROM (
    SELECT
      *,
      2 * 6371 * ASIN(
        SQRT(
          POW(SIN(RADIANS(merch_lat - lat) / 2), 2) +
          COS(RADIANS(lat)) * COS(RADIANS(merch_lat)) *
          POW(SIN(RADIANS(merch_long - long) / 2), 2)
        )
      ) AS distance_from_merchant_km
    FROM `project_id.dataset_id.fraud_transactions`
  )
)
SELECT
  distance_band,
  COUNT(*) AS total_transactions,
  COUNTIF(is_fraud = 1) AS fraudulent_transactions,
  ROUND(SAFE_DIVIDE(COUNTIF(is_fraud = 1), COUNT(*)) * 100, 4) AS fraud_rate_pct,
  ROUND(AVG(amt), 2) AS avg_transaction_amount_usd
FROM distance_analysis
GROUP BY distance_band, distance_band_order
ORDER BY distance_band_order;
