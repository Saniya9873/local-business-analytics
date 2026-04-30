# 📊 Local Business Analytics Project

## 🚀 Overview

This project analyzes local business data using **Python, Pandas, MySQL, and Power BI**.
It builds a complete data pipeline from raw JSON files to structured insights and interactive dashboards.

---

## 🛠️ Tech Stack

* Python
* Pandas
* MySQL
* Power BI
* Jupyter Notebook

---

## 📁 Project Structure

```
business_project/
│
├── data/
│   ├── raw/              # Raw JSON files (ignored in Git)
│   ├── interim/          # Intermediate data (ignored)
│   ├── processed/        # Final dataset (ignored)
│   └── sample_data.csv   # Sample dataset for demo
│
├── notebooks/
│   └── local_business_project.ipynb
│
├── src/
│   ├── insert_mysql.py
│   └── make_sample.py
│
├── sql/
│   └── project_databasefile.sql
│
├── powerbi/
│   └── screenshots/
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

## 🔄 Data Pipeline

```
Raw JSON Files
      ↓
Data Merging
      ↓
JSON → CSV Conversion
      ↓
Data Cleaning (Pandas)
      ↓
Final Dataset
      ↓
MySQL Database
      ↓
Power BI Dashboards
```

---

## 📊 Features

* Data cleaning and preprocessing using Pandas
* Sentiment analysis on reviews
* Business insights (ratings, categories, locations)
* MySQL database integration
* Power BI dashboards for visualization

---

## ⚠️ Note on Data

Full dataset is not included due to large size.
Only **sample_data.csv** is provided for demonstration.

---

## ▶️ How to Run

### 1. Install dependencies

```
pip install -r requirements.txt
```

### 2. Generate sample data

```
python src/make_sample.py
```

### 3. Insert data into MySQL

```
python src/insert_mysql.py
```

---

## 📈 Power BI Dashboard

Dashboards include:

* Business performance overview
* Customer sentiment analysis
* Location-based insights
* Ratings distribution

(Add screenshots in `powerbi/screenshots/`)

---

## 📌 Future Improvements

* Deploy dashboards online
* Add real-time data processing
* Improve sentiment analysis

---

## ⭐ Acknowledgement

Dataset inspired by real-world business review data.
