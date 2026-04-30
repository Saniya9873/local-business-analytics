import pandas as pd
import mysql.connector

df = pd.read_csv(r"C:\Users\91995\Downloads\final_reviews_cleaned.csv")

df = df[[
    "review_id",
    "business_id",
    "text",
    "stars_review",
    "sentiment",
    "review_length",
    "rating_category",
    "name",
    "city",
    "state",
    "categories"
]]

df = df.fillna("")

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Saniya@9873",
    database="local_business_reviews"
)

cursor = conn.cursor()

query = """
INSERT INTO reviews (
    review_id, business_id, review_text, review_stars,
    sentiment, review_length, rating_category,
    business_name, city, state, categories
)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

data = list(df.itertuples(index=False, name=None))

batch_size = 5000

for i in range(0, len(data), batch_size):
    cursor.executemany(query, data[i:i + batch_size])
    conn.commit()
    print(f"Inserted {i + batch_size} rows")

cursor.close()
conn.close()

print("Data inserted successfully")
