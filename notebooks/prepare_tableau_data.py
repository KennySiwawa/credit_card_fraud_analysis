# ============================================================================
# PREPARE DATA FOR TABLEAU
# ============================================================================

import pandas as pd
import numpy as np

# Load your EXISTING cleaned data (from Day 2)
df = pd.read_csv('../data/cleaned/fraudTrain_cleaned.csv')

print(f"Original dataset: {df.shape[0]:,} rows × {df.shape[1]} columns")

# Convert dates
df['trans_date_trans_time'] = pd.to_datetime(df['trans_date_trans_time'])
df['dob'] = pd.to_datetime(df['dob'])
df['transaction_date'] = pd.to_datetime(df['transaction_date'])

# ============================================================================
# ADD CARD TYPE (from cc_num)
# ============================================================================

def get_card_type(cc_num):
    """Extract card type from credit card number"""
    cc_str = str(cc_num)
    
    if cc_str.startswith('34') or cc_str.startswith('37'):
        return 'Amex'
    elif cc_str.startswith('4'):
        return 'Visa'
    elif cc_str.startswith('51') or cc_str.startswith('52') or \
         cc_str.startswith('53') or cc_str.startswith('54') or cc_str.startswith('55'):
        return 'MasterCard'
    elif cc_str.startswith('6011') or cc_str.startswith('65'):
        return 'Discover'
    else:
        return 'Other'

df['card_type'] = df['cc_num'].apply(get_card_type)
print(f"\n✓ Added card_type column")
print(f"  Card type distribution:")
print(df['card_type'].value_counts())

#============================================================================
# SELECT COLUMNS FOR TABLEAU
# ============================================================================

columns_for_tableau = [
    # Identifiers
    'trans_num',
    'cc_num',
    'card_type',  # NEW!
    
    # Transaction details
    'trans_date_trans_time',
    'amt',
    'category',
    'merchant',
    
    # Location
    'state',
    'city',
    'lat',
    'long',
    'merch_lat',
    'merch_long',
    'distance_from_merchant_km',
    
    # Time features
    'transaction_hour',
    'transaction_day',
    'transaction_day_of_week',
    'transaction_month',
    'transaction_year',
    'is_weekend',
    'is_night',
    
    # Customer
    'gender',
    'age_group',
    'customer_age',
    
    # Fraud indicators
    'is_fraud',
    'risk_score',
    'risk_category',
    
    # Flags (if you have them from Day 2)
    'is_high_value',
    'is_far_transaction',
    'amount_category'
]

# Only keep columns that exist
available_columns = [col for col in columns_for_tableau if col in df.columns]
print(f"\n✓ Selected {len(available_columns)} columns for Tableau")

tableau_df = df[available_columns].copy()
