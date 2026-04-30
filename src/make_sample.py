import pandas as pd

df = pd.read_csv("data/processed/final_reviews_cleaned.csv")

sample = df.sample(n=min(200, len(df)), random_state=42)

sample.to_csv("data/sample_data.csv", index=False)

print("sample_data.csv created successfully")