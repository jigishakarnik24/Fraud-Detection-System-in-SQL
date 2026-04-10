# Fraud Monitoring System (SQL-Based Data Analysis Project)

## Overview
The Fraud Monitoring System is a structured SQL-based project designed to detect and analyze suspicious credit/debit card transactions. It simulates how financial institutions monitor transactional data to identify high-risk activities and generate fraud alerts.

The system uses a relational database model to store customer profiles, payment card details, transaction logs, and fraud alerts. Advanced SQL techniques such as joins, window functions, and subqueries are used to uncover fraud patterns and support decision-making.

---

## Objectives
- Design a relational database for transaction monitoring
- Analyze transaction behavior to detect fraud patterns
- Generate fraud alerts based on predefined rules
- Simulate real-world banking fraud detection workflows

---

## Database Schema

### Tables Used
1. **customers_profile**
   - Stores customer details (name, city, country)

2. **payment_cards**
   - Stores card information (card type, bank, status)
   - Linked to customers via foreign key

3. **transaction_logs**
   - Stores transaction data (amount, merchant, time, country)
   - Includes fraud indicators (is_fraud, is_international)

4. **fraud_alerts**
   - Stores detected fraud cases
   - Includes rule triggered, detection date, and status

---

## Key Features

### 1. Transaction Analysis
- Total transactions per card
- Fraud vs non-fraud transaction count
- Identification of high-activity cards

### 2. Fraud Detection Patterns
- High-value transactions
- International transactions
- ATM withdrawal bursts
- Use of blocked cards
- Micro-transaction testing patterns
- Sudden spikes in spending

### 3. Merchant Risk Analysis
- Top merchants with highest fraud occurrences
- Identification of high-risk transaction channels (ATM, POS, Online)

---

## SQL Techniques Used

### 1. Basic Queries
- Aggregations using COUNT, SUM
- Filtering using WHERE conditions
- Grouping using GROUP BY

### 2. Joins
- Combining customer, card, and transaction data
- Extracting fraud cases with user details
- Comparing fraud across card types

### 3. Window Functions
- Ranking transactions by amount (risk index)
- Running total of spending per card
- Average spending comparison per card

### 4. Subqueries
- Transactions above average spending
- Cards with higher fraud than normal usage
- Fraud transactions without alerts
- Customers with abnormal spending patterns

---

## Key Insights

- Cards with high transaction frequency may indicate misuse
- ATM withdrawals are a major fraud-prone channel
- International transactions often involve high-value fraud
- Sudden spikes in spending are strong fraud indicators
- Blocked cards being used indicate serious security breaches
- Micro-transactions suggest card testing behavior

---

## Sample Fraud Scenarios Detected

- Rapid multiple ATM withdrawals within minutes
- High-value purchase immediately after small transaction
- Late-night unusual spending
- Cross-country transactions in short time
- Crypto and NFT-related suspicious transactions

---

## Outcomes

- Successfully identified high-risk transactions using SQL
- Built a scalable fraud detection structure using relational databases
- Generated actionable fraud alerts for investigation
- Demonstrated real-world financial risk analysis using data

---

## Future Enhancements

- Integration with Power BI/Tableau dashboards
- Real-time fraud alert system
- Machine Learning-based fraud prediction models
- Automation of fraud detection workflows

---

## Conclusion
This project demonstrates how SQL can be effectively used for fraud detection and financial data analysis. It provides a strong foundation for building advanced analytics systems in banking, fintech, and cybersecurity domains.
