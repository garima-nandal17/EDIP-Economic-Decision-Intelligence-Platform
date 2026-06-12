CREATE DATABASE edip_db;
USE edip_db;

CREATE TABLE economic_indicators (
    indicator_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    inflation DECIMAL(6,2),
    repo_rate DECIMAL(5,2),
    gdp_growth DECIMAL(5,2),
    exchange_rate DECIMAL(8,2),
    oil_price DECIMAL(8,2)
);

CREATE TABLE industries (
    industry_id INT AUTO_INCREMENT PRIMARY KEY,
    industry_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE industry_sensitivity (
    industry_id INT PRIMARY KEY,
    inflation_weight DECIMAL(4,2) NOT NULL,
    repo_weight DECIMAL(4,2) NOT NULL,
    oil_weight DECIMAL(4,2) NOT NULL,
    exchange_weight DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (industry_id) REFERENCES industries(industry_id) ON DELETE CASCADE
);

CREATE TABLE risk_scores (
    industry_id INT,
    date DATE NOT NULL,
    risk_score DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (industry_id, date),
    FOREIGN KEY (industry_id) REFERENCES industries(industry_id) ON DELETE CASCADE
);
