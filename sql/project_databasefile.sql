show databases;

-- new database is created 
CREATE DATABASE local_business_reviews;
USE local_business_reviews;
show tables;

-- Table named review is created 
CREATE TABLE reviews (
    review_id VARCHAR(50),
    business_id VARCHAR(50),
    review_text TEXT,
    review_stars FLOAT,
    sentiment VARCHAR(20),
    review_length INT,
    rating_category VARCHAR(20),
    business_name VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    categories TEXT
);

-- For checking if data is uploaded or not 
SELECT * FROM reviews LIMIT 10;
SELECT COUNT(*) AS total_reviews FROM reviews;

-- for checking if there are missing values or not 
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN review_text IS NULL OR review_text = '' THEN 1 ELSE 0 END) AS missing_reviews,
    SUM(CASE WHEN business_name IS NULL OR business_name = '' THEN 1 ELSE 0 END) AS missing_business,
    SUM(CASE WHEN review_stars IS NULL THEN 1 ELSE 0 END) AS missing_rating
FROM reviews;

-- retrieving sentiment summary (Positive,negative,neutral)
SELECT 
    sentiment,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY sentiment
ORDER BY total_reviews DESC;

-- retrieve rating distribution 
SELECT 
    review_stars,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_stars
ORDER BY review_stars;

-- find average of rating 
SELECT 
    ROUND(AVG(review_stars), 2) AS average_review_rating
FROM reviews;

-- business-wise performance 
SELECT 
    business_name,
    city,
    state,
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_stars), 2) AS avg_rating
FROM reviews
GROUP BY business_name, city, state
ORDER BY total_reviews DESC;

-- Find Top performing businesses 
SELECT 
    business_name,
    city,
    state,
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_stars), 2) AS avg_rating
FROM reviews
GROUP BY business_name, city, state
HAVING total_reviews >= 20
ORDER BY avg_rating DESC
LIMIT 10;

-- Finding Low performing businesses 
SELECT 
    business_name,
    city,
    state,
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_stars), 2) AS avg_rating
FROM reviews
GROUP BY business_name, city, state
HAVING total_reviews >= 20
ORDER BY avg_rating ASC
LIMIT 10;

--  Customer complaints / negative reviews
SELECT 
    business_name,
    review_stars,
    review_text
FROM reviews
WHERE sentiment = 'negative'
ORDER BY review_stars ASC
LIMIT 50;

-- Positive reviews / strengths 
SELECT 
    business_name,
    review_stars,
    review_text
FROM reviews
WHERE sentiment = 'positive'
ORDER BY review_stars DESC
LIMIT 50;

-- City-wise comparison 
SELECT 
    city,
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_stars), 2) AS avg_rating
FROM reviews
GROUP BY city
ORDER BY avg_rating DESC;

-- Competitor benchmark 
SELECT 
    business_name,
    city,
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_stars), 2) AS avg_rating,
    SUM(CASE WHEN sentiment = 'positive' THEN 1 ELSE 0 END) AS positive_reviews,
    SUM(CASE WHEN sentiment = 'negative' THEN 1 ELSE 0 END) AS negative_reviews
FROM reviews
GROUP BY business_name, city
HAVING total_reviews >= 20
ORDER BY city, avg_rating DESC;

-- Views for Power BI   
     -- Sentiment view 
CREATE VIEW sentiment_summary AS
SELECT 
    sentiment,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY sentiment;

     -- Rating View 
CREATE VIEW rating_distribution AS
SELECT 
    review_stars,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_stars;

    --  Business Performance View
CREATE VIEW business_performance AS
SELECT 
    business_name,
    city,
    state,
    COUNT(*) AS total_reviews,
    ROUND(AVG(review_stars), 2) AS avg_rating,
    SUM(CASE WHEN sentiment = 'positive' THEN 1 ELSE 0 END) AS positive_reviews,
    SUM(CASE WHEN sentiment = 'neutral' THEN 1 ELSE 0 END) AS neutral_reviews,
    SUM(CASE WHEN sentiment = 'negative' THEN 1 ELSE 0 END) AS negative_reviews
FROM reviews
GROUP BY business_name, city, state;


SELECT * FROM sentiment_summary;

SELECT * FROM rating_distribution;

SELECT * FROM business_performance LIMIT 10;

USE local_business_reviews;
ALTER TABLE reviews
ADD COLUMN review_date DATE;
UPDATE reviews
SET review_date = DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY)
WHERE review_date IS NULL;

CREATE OR REPLACE VIEW sentiment_monthly_trend AS
SELECT 
    DATE_FORMAT(review_date, '%b') AS review_month,
    MONTH(review_date) AS month_no,
    SUM(CASE WHEN sentiment = 'positive' THEN 1 ELSE 0 END) AS positive_reviews,
    SUM(CASE WHEN sentiment = 'neutral' THEN 1 ELSE 0 END) AS neutral_reviews,
    SUM(CASE WHEN sentiment = 'negative' THEN 1 ELSE 0 END) AS negative_reviews
FROM reviews
GROUP BY DATE_FORMAT(review_date, '%b'), MONTH(review_date)
ORDER BY month_no;


SELECT user, host, plugin 
FROM mysql.user;

CREATE USER 'powerbi'@'localhost' IDENTIFIED BY 'Powerbi@123';

GRANT ALL PRIVILEGES ON local_business_reviews.* TO 'powerbi'@'localhost';

ALTER USER 'powerbi'@'localhost'
IDENTIFIED WITH mysql_native_password BY 'Powerbi@123';

FLUSH PRIVILEGES;
-- ALTER USER 'root'@'localhost' 
-- IDENTIFIED WITH mysql_native_password 
-- BY 'Saniya@9873';

-- FLUSH PRIVILEGES;