<<<<<<< HEAD
# 📊 Local Business Analytics Project

## 🚀 Overview

This project focuses on analyzing local business data using **Python, Pandas, MySQL, and Power BI**.
The pipeline processes raw JSON data, transforms it into a structured format, and generates insights for business performance and customer sentiment.

---

## 🛠️ Tech Stack

* **Python**
* **Pandas**
* **MySQL**
* **Power BI**
* **Jupyter Notebook**

---

## 📁 Project Structure

```
business_project/
│
├── data/
│   ├── raw/              # Raw JSON files (ignored in Git)
│   ├── interim/          # Intermediate data (ignored)
│   ├── processed/        # Final cleaned dataset (ignored)
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
│   └── screenshots/      # Dashboard images
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
* Sentiment analysis on customer reviews
* Business insights (ratings, categories, locations)
* MySQL database integration
* Interactive dashboards using Power BI

---

## ⚠️ Note on Data

Due to large file sizes, the full dataset is not included in this repository.
Only a **sample dataset (`sample_data.csv`)** is provided for demonstration purposes.

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

The dashboards provide:

* Business performance overview
* Customer sentiment analysis
* Location-based insights
* Ratings distribution

(Screenshots available in `powerbi/screenshots/`)

---

## 📌 Future Improvements

* Deploy dashboards online
* Add real-time data processing
* Improve sentiment analysis model

---

## 👤 Author

**Your Name**

---

## ⭐ Acknowledgement

Dataset inspired by real-world business review data for analytical learning purposes.
=======
# 📊 Local Business Analytics Project

## 🚀 Overview
This project focuses on analyzing local business data using **Python, Pandas, MySQL, and Power BI**.  
The pipeline processes raw JSON data, transforms it into structured format, and generates insights for business performance and customer sentiment.

---

## 🛠️ Tech Stack
- **Python**
- **Pandas**
- **MySQL**
- **Power BI**
- **Jupyter Notebook**

---


