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

# ADD CARD TYPE (from cc_num)

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


# Simple risk score calculation
df['risk_score'] = 0.0

# Amount percentile (0-40 points)
df['risk_score'] += df['amt'].rank(pct=True) * 40

# Distance percentile (0-30 points)
df['risk_score'] += df['distance_km'].rank(pct=True) * 30

# Time risk (0-20 points)
df.loc[df['is_night'] == 1, 'risk_score'] += 15
df.loc[df['is_weekend'] == 1, 'risk_score'] += 5

# Category risk (0-10 points)
category_risk = {
    'shopping_net': 10,
    'misc_net': 9,
    'grocery_pos': 8,
    'shopping_pos': 5,
    'gas_transport': 4,
    'misc_pos': 3,
    'grocery_net': 3,
    'travel': 3,
    'entertainment': 2,
    'personal_care': 2,
    'kids_pets': 2,
    'food_dining': 1,
    'home': 1,
    'health_fitness': 1
}
df['risk_score'] += df['category'].map(category_risk).fillna(5)

# Normalize to 0-100
df['risk_score'] = (df['risk_score'] / df['risk_score'].max()) * 100

# Create risk categories
df['risk_category'] = pd.cut(df['risk_score'], 
                               bins=[0, 30, 60, 80, 100],
                               labels=['Low', 'Medium', 'High', 'Critical'])

print(f"\n✓ Added risk_score and risk_category")

# ============================================================================
# SELECT COLUMNS FOR TABLEAU
# ============================================================================

columns_for_looker = [
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
    'distance_km',
    
    # Time features
    'transaction_hour',
    'transaction_day',
    'transaction_day_of_week',
    'transaction_month',
    'transaction_year',
    'is_weekend',
    'is_night',
    
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
available_columns = [col for col in columns_for_looker if col in df.columns]
print(f"\n✓ Selected {len(available_columns)} columns for Tableau")

tableau_df = df[available_columns].copy()

# ============================================================================
# OPTIONAL: SAMPLE FOR FASTER PERFORMANCE
# ============================================================================

final_df = tableau_df.sample(min(100000, len(tableau_df)), random_state=42)
print(f"\n✓ Sampled to {len(final_df):,} rows for better performance")


# Create tableau directory if it doesn't exist
import os
os.makedirs('../visualization/Lookerstudio', exist_ok=True)

output_path = '../visualizations/LookerStudio/fraud_data_for_looker.csv'
final_df.to_csv(output_path, index=False)

print(f"\n✓ Saved Tableau dataset:")
print(f"  File: {output_path}")
print(f"  Rows: {len(final_df):,}")
print(f"  Columns: {len(final_df.columns)}")
print(f"\n✓ Ready to import into Tableau!")

# Show summary
print("\n" + "="*60)
print("TABLEAU DATA SUMMARY")
print("="*60)
print(f"\nFraud Statistics:")
print(f"  Total Transactions: {len(final_df):,}")
print(f"  Fraudulent: {final_df['is_fraud'].sum():,}")
print(f"  Fraud Rate: {final_df['is_fraud'].mean()*100:.2f}%")
print(f"\nCard Type Distribution:")
print(final_df['card_type'].value_counts())
print(f"\nCategory Distribution:")
print(final_df['category'].value_counts())
print("\n" + "="*60)