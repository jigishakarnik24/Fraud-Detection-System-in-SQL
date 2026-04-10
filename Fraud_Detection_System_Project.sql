CREATE DATABASE fraud_monitoring_system;
USE fraud_monitoring_system;

-- USERS
CREATE TABLE customers_profile (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- BANK CARDS
CREATE TABLE payment_cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    card_number VARCHAR(20),
    card_type VARCHAR(20), -- Debit/Credit
    bank VARCHAR(50),
    status VARCHAR(20), -- Active/Blocked
    FOREIGN KEY (customer_id) REFERENCES customers_profile(customer_id)
);

-- TRANSACTIONS
CREATE TABLE transaction_logs (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT,
    txn_time DATETIME,
    amount DECIMAL(10,2),
    merchant VARCHAR(100),
    country VARCHAR(50),
    channel VARCHAR(20), -- POS/ONLINE/ATM
    is_international TINYINT(1),
    is_fraud TINYINT(1),
    FOREIGN KEY (card_id) REFERENCES payment_cards(card_id)
);

-- FRAUD RECORDS
CREATE TABLE fraud_alerts (
    fraud_id INT AUTO_INCREMENT PRIMARY KEY,
    txn_id INT,
    rule_triggered VARCHAR(100),
    detected_date DATE,
    status VARCHAR(20) DEFAULT "Open",
    FOREIGN KEY (txn_id) REFERENCES transaction_logs(txn_id)
);

INSERT INTO customers_profile (name, city, country) VALUES
('Aarav Mehta','Mumbai','India'),
('Riya Kapoor','Delhi','India'),
('Kabir Shah','Pune','India'),
('Simran Arora','Bangalore','India'),
('Rehan Siddiqui','Lucknow','India'),
('Zara Khan','Hyderabad','India'),
('Mahi Verma','Chennai','India'),
('Yash Malhotra','Jaipur','India'),
('Anaya Joshi','Nagpur','India'),
('Devansh Shetty','Goa','India'),
('Mira Fernandes','Kochi','India'),
('Aryan Patel','Ahmedabad','India'),
('Neel Bhatt','Surat','India'),
('Tanya Oberoi','Indore','India'),
('Samar Khurana','Noida','India'),
('Aisha Sheikh','Dubai','UAE'),
('Rayyan Malik','Doha','Qatar'),
('Huda Rahman','London','UK'),
('Jason Miller','New York','USA'),
('Sophia Lewis','Toronto','Canada'),
('Ethan Walker','Sydney','Australia'),
('Kim Hana','Seoul','South Korea'),
('Hiro Tanaka','Tokyo','Japan'),
('Liam Scott','Berlin','Germany'),
('Noah Adams','Paris','France'),
('Oliver White','Rome','Italy'),
('Lucas Gray','Madrid','Spain'),
('Emma Green','Melbourne','Australia'),
('Daniel King','Singapore','Singapore'),
('Ava Taylor','Cape Town','South Africa');

INSERT INTO payment_cards (customer_id, card_number, card_type, bank, status) VALUES
-- Customers 1–10
(1,'4111-XXXX-0011','Credit','HDFC Bank','Active'),
(1,'5222-XXXX-0012','Debit','HDFC Bank','Active'),
(2,'4333-XXXX-0021','Credit','SBI Bank','Active'),
(3,'4444-XXXX-0031','Credit','ICICI Bank','Active'),
(4,'4555-XXXX-0041','Credit','Axis Bank','Blocked'),
(5,'4666-XXXX-0051','Debit','SBI Bank','Active'),
(6,'4777-XXXX-0061','Credit','Kotak Bank','Active'),
(7,'4888-XXXX-0071','Debit','Yes Bank','Active'),
(8,'4999-XXXX-0081','Credit','Citi Bank','Active'),
(9,'5000-XXXX-0091','Debit','HSBC Bank','Active'),
(10,'5111-XXXX-0101','Credit','Axis Bank','Active'),

-- Customers 11–20
(11,'5222-XXXX-0111','Credit','ICICI Bank','Blocked'),
(11,'5333-XXXX-0112','Debit','ICICI Bank','Active'),
(12,'5444-XXXX-0121','Credit','SBI Bank','Active'),
(13,'5555-XXXX-0131','Debit','HDFC Bank','Active'),
(14,'5666-XXXX-0141','Credit','Kotak Bank','Active'),
(14,'5777-XXXX-0142','Debit','Kotak Bank','Active'),
(15,'5888-XXXX-0151','Credit','Axis Bank','Active'),
(16,'5999-XXXX-0161','Credit','Emirates NBD','Active'),
(17,'6000-XXXX-0171','Credit','QNB Bank','Blocked'),
(18,'6111-XXXX-0181','Debit','Barclays','Active'),
(19,'6222-XXXX-0191','Credit','Chase Bank','Active'),

-- Customers 21–30
(20,'6333-XXXX-0201','Debit','RBC Bank','Active'),
(21,'6444-XXXX-0211','Credit','Commonwealth Bank','Active'),
(21,'6555-XXXX-0212','Debit','Commonwealth Bank','Active'),
(22,'6666-XXXX-0221','Debit','Korea Exchange Bank','Active'),
(23,'6777-XXXX-0231','Credit','Mizuho Bank','Active'),
(23,'6888-XXXX-0232','Debit','Mizuho Bank','Active'),
(24,'6999-XXXX-0241','Credit','Deutsche Bank','Active'),
(24,'7000-XXXX-0242','Debit','Deutsche Bank','Blocked'),
(25,'7111-XXXX-0251','Credit','BNP Paribas','Active'),
(26,'7222-XXXX-0261','Debit','UniCredit Bank','Active'),
(26,'7333-XXXX-0262','Credit','UniCredit Bank','Active'),

(27,'7444-XXXX-0271','Credit','Santander','Active'),
(27,'7555-XXXX-0272','Debit','Santander','Active'),
(28,'7666-XXXX-0281','Credit','NAB Australia','Active'),
(29,'7777-XXXX-0291','Debit','ANZ Bank','Active'),
(29,'7888-XXXX-0292','Credit','ANZ Bank','Blocked'),
(30,'7999-XXXX-0301','Credit','Standard Bank','Active'),
(30,'8000-XXXX-0302','Debit','Standard Bank','Active'),

-- Final 5 extra to reach total 45 (as before)
(5,'8111-XXXX-0311','Credit','SBI Bank','Active'),
(9,'8222-XXXX-0322','Credit','HSBC Bank','Active'),
(13,'8333-XXXX-0333','Credit','HDFC Bank','Blocked'),
(17,'8444-XXXX-0344','Debit','QNB Bank','Active'),
(22,'8555-XXXX-0355','Credit','Korea Exchange Bank','Active');

INSERT INTO transaction_logs (card_id, txn_time, amount, merchant, country, channel, is_international, is_fraud) VALUES
(1,'2025-01-01 10:15:00',1200,'Amazon India','India','ONLINE',0,0),
(1,'2025-01-03 16:40:00',550,'Swiggy','India','ONLINE',0,0),
(2,'2025-01-04 11:00:00',2400,'DMart','India','POS',0,0),
(3,'2025-01-05 18:25:00',900,'Zomato','India','ONLINE',0,0),
(4,'2025-01-06 10:50:00',3200,'Reliance Trends','India','POS',0,0),
(5,'2025-01-06 19:45:00',450,'Blinkit','India','ONLINE',0,0),
(6,'2025-01-07 14:12:00',1800,'Croma','India','POS',0,0),
(7,'2025-01-08 20:30:00',600,'McDonalds','India','POS',0,0),
(8,'2025-01-09 13:55:00',1100,'Nykaa','India','ONLINE',0,0),
(9,'2025-01-10 17:15:00',1750,'Amazon India','India','ONLINE',0,0),

(10,'2025-01-11 15:32:00',900,'Dominos','India','ONLINE',0,0),
(11,'2025-01-12 12:40:00',670,'Pizza Hut','India','ONLINE',0,0),
(12,'2025-01-12 21:35:00',320,'Uber India','India','ONLINE',0,0),
(13,'2025-01-13 09:22:00',1400,'BigBazaar','India','POS',0,0),
(14,'2025-01-14 18:30:00',600,'Starbucks','India','POS',0,0),
(15,'2025-01-15 14:10:00',2400,'DMart','India','POS',0,0),
(16,'2025-01-16 20:45:00',820,'Swiggy','India','ONLINE',0,0),
(17,'2025-01-17 10:55:00',2700,'Croma','India','POS',0,0),
(18,'2025-01-18 13:22:00',780,'Zudio','India','POS',0,0),
(19,'2025-01-19 21:05:00',330,'Uber India','India','ONLINE',0,0),

(20,'2025-01-20 11:18:00',1250,'Big Basket','India','ONLINE',0,0),
(21,'2025-01-21 19:32:00',950,'KFC','India','POS',0,0),
(22,'2025-01-22 15:40:00',1690,'Amazon India','India','ONLINE',0,0),
(23,'2025-01-23 17:50:00',2300,'Reliance Smart','India','POS',0,0),
(24,'2025-01-24 12:07:00',540,'Zomato','India','ONLINE',0,0),
(25,'2025-01-25 16:48:00',880,'Blinkit','India','ONLINE',0,0),
(26,'2025-01-26 20:35:00',1530,'DMart','India','POS',0,0),
(27,'2025-01-27 09:42:00',470,'Swiggy','India','ONLINE',0,0),
(28,'2025-01-27 19:58:00',2900,'Croma','India','POS',0,0),
(29,'2025-01-28 11:30:00',750,'Dominos','India','ONLINE',0,0),
-- Rapid repeated ATM withdrawals (Risky)
(30,'2025-02-01 22:15:00',5000,'ATM Withdrawal','India','ATM',0,0),
(30,'2025-02-01 22:18:00',5100,'ATM Withdrawal','India','ATM',0,0),
(30,'2025-02-01 22:22:00',5200,'ATM Withdrawal','India','ATM',0,1),

-- Unusual late night retail spending
(28,'2025-02-02 01:40:00',8900,'Electronics Store','India','POS',0,1),
(28,'2025-02-02 01:48:00',9100,'Fashion Hub','India','POS',0,1),

-- Multiple failed-looking test charges
(15,'2025-02-03 09:10:00',99,'TestTxn1','India','ONLINE',0,0),
(15,'2025-02-03 09:12:00',110,'TestTxn2','India','ONLINE',0,0),
(15,'2025-02-03 09:14:00',95,'TestTxn3','India','ONLINE',0,1),

-- High spend immediately after small spend (classic fraud signal)
(17,'2025-02-04 14:22:00',450,'Blinkit','India','ONLINE',0,0),
(17,'2025-02-04 14:45:00',87500,'LuxuryMall','India','POS',0,1),

-- Card with BLOCKED status used → risk
(4,'2025-02-05 18:34:00',320,'Zomato','India','ONLINE',0,1),
(4,'2025-02-05 18:50:00',2100,'Electronics Store','India','POS',0,1),

-- Multiple swipes at same store within minutes
(11,'2025-02-06 20:05:00',1500,'Reliance Smart','India','POS',0,0),
(11,'2025-02-06 20:08:00',1450,'Reliance Smart','India','POS',0,0),
(11,'2025-02-06 20:14:00',16200,'Reliance Smart','India','POS',0,1),

-- High-value ATM withdrawal pattern
(22,'2025-02-07 21:30:00',20000,'ATM Withdrawal','India','ATM',0,0),
(22,'2025-02-07 21:32:00',24000,'ATM Withdrawal','India','ATM',0,1),

-- Repeated gaming or online charges
(9,'2025-02-08 17:35:00',550,'GameTopUp','India','ONLINE',0,0),
(9,'2025-02-08 17:50:00',799,'GameTopUp','India','ONLINE',0,0),
(9,'2025-02-08 18:10:00',18200,'GameTopUp','India','ONLINE',0,1),

-- Card used in different Indian states within 2 hours
(21,'2025-02-09 11:10:00',1100,'Zudio Mumbai','India','POS',0,0),
(21,'2025-02-09 13:25:00',12400,'Zudio Chennai','India','POS',0,1),

-- Low consistent rides → sudden spike
(2,'2025-02-10 15:19:00',380,'Uber India','India','ONLINE',0,0),
(2,'2025-02-10 23:51:00',45000,'TravelBooking','India','ONLINE',0,1),

-- Attempt to use blocked card again
(17,'2025-02-11 14:40:00',300,'Blinkit','India','ONLINE',0,1),

-- Many micro-transactions = card testing
(5,'2025-02-12 10:01:00',45,'SmallCharge','India','ONLINE',0,0),
(5,'2025-02-12 10:02:00',51,'SmallCharge','India','ONLINE',0,0),
(5,'2025-02-12 10:05:00',49,'SmallCharge','India','ONLINE',0,1),

-- Suspicious POS + ATM same day
(14,'2025-02-13 09:15:00',2200,'Big Bazaar','India','POS',0,0),
(14,'2025-02-13 09:40:00',50000,'ATM Withdrawal','India','ATM',0,1),

(1,'2025-03-01 02:45:00',78000,'CryptoHub','Singapore','ONLINE',1,1),
(3,'2025-03-01 03:12:00',92000,'LuxuryBrands UK','UK','ONLINE',1,1),
(5,'2025-03-02 01:30:00',45000,'NFTMarket','USA','ONLINE',1,1),
(6,'2025-03-02 23:40:00',68000,'DubaiGoldStore','UAE','ONLINE',1,1),
(7,'2025-03-03 00:14:00',85000,'CryptoKings','Japan','ONLINE',1,1),

(9,'2025-03-03 03:10:00',102500,'LuxuryMall USA','USA','POS',1,1),
(10,'2025-03-03 23:50:00',56000,'ParisFashion','France','ONLINE',1,1),
(12,'2025-03-04 04:55:00',72000,'Shopex Tokyo','Japan','ONLINE',1,1),
(13,'2025-03-04 02:42:00',91000,'CryptoEU','Germany','ONLINE',1,1),
(14,'2025-03-05 00:05:00',115000,'RolexStore','Switzerland','POS',1,1),

(16,'2025-03-05 03:30:00',64000,'SmartBuy Canada','Canada','ONLINE',1,1),
(17,'2025-03-05 04:22:00',93500,'LuxuryParis','France','ONLINE',1,1),
(18,'2025-03-06 02:05:00',128000,'CryptoX','USA','ONLINE',1,1),
(19,'2025-03-06 23:45:00',82000,'TechWorld','UK','ONLINE',1,1),
(20,'2025-03-07 03:10:00',97000,'DubaiElectronics','UAE','ONLINE',1,1),

(21,'2025-03-07 01:30:00',54000,'FashionNewYork','USA','POS',1,1),
(22,'2025-03-08 02:18:00',65500,'CryptoSeoul','South Korea','ONLINE',1,1),
(23,'2025-03-08 23:59:00',120000,'NFTCanada','Canada','ONLINE',1,1),
(24,'2025-03-09 03:44:00',88000,'TokyoMall','Japan','ONLINE',1,1),
(25,'2025-03-09 04:20:00',77000,'CryptoMexico','Mexico','ONLINE',1,1),

(26,'2025-03-10 01:02:00',139000,'LuxuryRome','Italy','ONLINE',1,1),
(27,'2025-03-10 23:49:00',64500,'ParisJewels','France','ONLINE',1,1),
(28,'2025-03-11 03:13:00',99000,'CryptoUK','UK','ONLINE',1,1),
(29,'2025-03-11 04:42:00',113000,'LuxuryBerlin','Germany','POS',1,1),
(30,'2025-03-12 00:50:00',94000,'DubaiCrypto','UAE','ONLINE',1,1),

-- Few more cards to diversify usage
(32,'2025-03-12 03:28:00',127500,'NewYorkNFT','USA','ONLINE',1,1),
(33,'2025-03-13 02:10:00',74000,'SwissWatches','Switzerland','POS',1,1),
(34,'2025-03-13 23:55:00',86000,'ParisMall','France','ONLINE',1,1),
(36,'2025-03-14 01:22:00',144900,'CryptoSingapore','Singapore','ONLINE',1,1),
(38,'2025-03-14 03:55:00',102200,'DubaiGoldMarket','UAE','ONLINE',1,1);

INSERT INTO fraud_alerts (txn_id, rule_triggered, detected_date, status) VALUES
-- High-value International Charges
(61,'High International Transaction','2025-03-01','Open'),
(62,'Repeated Foreign High Spend','2025-03-01','Investigating'),
(63,'Crypto Purchase Suspected','2025-03-02','Open'),
(64,'Unusual High Amount','2025-03-02','Open'),
(65,'Foreign Merchant Purchase Risk','2025-03-03','Open'),

-- Blocked Card Misuse
(45,'Blocked Card Attempted','2025-02-05','Open'),
(46,'Repeated Blocked Card Usage','2025-02-05','Investigating'),

-- Late Night Suspicious Spending
(70,'Odd-Hour Transaction Activity','2025-03-05','Open'),
(72,'Night Transaction Spike','2025-03-06','Investigating'),

-- ATM Withdrawal Bursts
(33,'Multiple ATM Withdrawals Detected','2025-02-01','Investigating'),
(34,'ATM Withdrawal Spike','2025-02-01','Open'),

-- Small Value Micro-Testing Transactions
(38,'Micro-Transaction Pattern','2025-02-03','Resolved'),
(39,'Card Testing Suspected','2025-02-03','Open'),

-- Geographic Risk / Country jump
(74,'Location Shift India→Dubai/UK','2025-03-07','Investigating'),
(77,'Different Country Same Day','2025-03-08','Open'),

-- NFT / Crypto Related Fraud
(82,'NFT Purchase Alert','2025-03-08','Open'),
(83,'Crypto Transaction Flagged','2025-03-09','Open'),
(85,'High Crypto Spend Risk','2025-03-10','Open'),
(87,'NFT Transaction Suspicious','2025-03-08','Investigating'),
(89,'Crypto Cross-Border Alert','2025-03-11','Open'),

-- Luxury International Transactions
(90,'Multiple Foreign Purchases','2025-03-12','Open'),
(72,'Luxury Europe Purchase Trace','2025-03-06','Open'), -- Repeated alert possible
(65,'High-End Watch/Jewelry Attempt','2025-03-03','Investigating'),

-- Final 2 Alerts — pattern reinforced
(64,'Back-to-Back High Spending','2025-03-02','Investigating'),
(33,'Unusual Withdrawal + Card Testing Correlation','2025-02-01','Open');

-- 1. BASIC QUERY & ANALYSIS (4 Questions)
#Q1. Find total number of users, cards, transactions & fraud alerts.
SELECT 
    (SELECT COUNT(*) FROM customers_profile) AS total_customers,
    (SELECT COUNT(*) FROM payment_cards) AS total_cards,
    (SELECT COUNT(*) FROM transaction_logs) AS total_transactions,
    (SELECT COUNT(*) FROM fraud_alerts) AS total_fraud_alerts;
    
#Q1. List all international transactions with amount > ₹50,000
SELECT txn_id, card_id, amount, merchant, country, txn_time
FROM transaction_logs
WHERE is_international = 1 AND amount > 50000
ORDER BY amount DESC;

#Q2. Count fraud vs non-fraud transactions
SELECT 
    is_fraud,
    COUNT(*) AS total_txn
FROM transaction_logs
GROUP BY is_fraud;

#Q3. Find top 5 merchants with highest fraud occurrences
SELECT merchant, COUNT(*) AS fraud_count
FROM transaction_logs
WHERE is_fraud = 1
GROUP BY merchant
ORDER BY fraud_count DESC
LIMIT 5;

-- Calculate the number of fraud vs non-fraud transactions
SELECT 
    is_fraud,
    COUNT(*) AS transaction_count
FROM transaction_logs
GROUP BY is_fraud;

SELECT 
    card_id,
    COUNT(txn_id) AS total_transactions
FROM transaction_logs
GROUP BY card_id
ORDER BY total_transactions DESC;


-- 2. WINDOW FUNCTIONS (4 Questions)
#Q1Running total of spending per card (cumulative use tracking)
SELECT 
    card_id,
    txn_time,
    amount,
    SUM(amount) OVER (PARTITION BY card_id ORDER BY txn_time) AS cumulative_spending
FROM transaction_logs;

#Q2Rank highest 10 transactions by amount
SELECT 
    txn_id, card_id, amount,
    RANK() OVER (ORDER BY amount DESC) AS risk_rank
FROM transaction_logs
LIMIT 10;

#Q3Monthly spend per card with average spend comparison
SELECT 
    card_id,
    DATE_FORMAT(txn_time,'%Y-%m') AS month,
    SUM(amount) AS monthly_spend,
    AVG(SUM(amount)) OVER (PARTITION BY card_id) AS avg_spend
FROM transaction_logs
GROUP BY card_id, month;

-- Rank transactions by highest amount (fraud risk index)
SELECT 
    txn_id,
    card_id,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS risk_rank
FROM transaction_logs;

SELECT 
    card_id,
    txn_id,
    amount,
    AVG(amount) OVER (PARTITION BY card_id) AS avg_card_spend
FROM transaction_logs;

-- 3. JOINS (4 Questions)
-- #Q1List user details for every fraud transaction
SELECT cp.name, cp.city, tl.amount, tl.merchant, tl.country
FROM transaction_logs tl
JOIN payment_cards pc ON tl.card_id = pc.card_id
JOIN customers_profile cp ON pc.customer_id = cp.customer_id
WHERE tl.is_fraud = 1;

-- #Fraud alerts with corresponding card + user name
SELECT fa.fraud_id, cp.name, tl.amount, fa.rule_triggered, fa.detected_date
FROM fraud_alerts fa
JOIN transaction_logs tl ON fa.txn_id = tl.txn_id
JOIN payment_cards pc ON tl.card_id = pc.card_id
JOIN customers_profile cp ON pc.customer_id = cp.customer_id;

-- #Q3Find cards used in more than one country
SELECT card_id, COUNT(DISTINCT country) AS countries_used
FROM transaction_logs
GROUP BY card_id
HAVING COUNT(DISTINCT country) > 1;

#Q4Customers with more than one active card
SELECT cp.customer_id, cp.name, COUNT(pc.card_id) AS total_cards
FROM customers_profile cp
JOIN payment_cards pc ON cp.customer_id = pc.customer_id
WHERE pc.status = 'Active'
GROUP BY cp.customer_id
HAVING total_cards > 1;

-- #Q5Compare Fraud Count Between Debit & Credit Cards
SELECT 
    pc.card_type,
    COUNT(tl.txn_id) AS total_transactions,
    SUM(tl.is_fraud) AS fraud_transactions
FROM payment_cards pc
JOIN transaction_logs tl ON pc.card_id = tl.card_id
GROUP BY pc.card_type;

-- #Q6Show All Fraud Transactions with Card Details
SELECT 
    cp.name AS customer_name,
    pc.card_number,
    pc.card_type,
    tl.amount,
    tl.country,
    tl.txn_time
FROM transaction_logs tl
JOIN payment_cards pc ON tl.card_id = pc.card_id
JOIN customers_profile cp ON pc.customer_id = cp.customer_id
WHERE tl.is_fraud = 1
ORDER BY tl.amount DESC LIMIT 5;


SELECT 
    fa.fraud_id,
    cp.name AS customer_name,
    pc.card_type,
    tl.amount,
    fa.detected_date
FROM fraud_alerts fa
JOIN transaction_logs tl ON fa.txn_id = tl.txn_id
JOIN payment_cards pc ON tl.card_id = pc.card_id
JOIN customers_profile cp ON pc.customer_id = cp.customer_id
ORDER BY fa.fraud_id
LIMIT 5;

SELECT 
    cp.name,
    pc.card_type,
    tl.amount,
    tl.country
FROM customers_profile cp
JOIN payment_cards pc ON cp.customer_id = pc.customer_id
JOIN transaction_logs tl ON pc.card_id = tl.card_id
WHERE tl.is_fraud = 1 AND tl.is_international = 1
LIMIT 5;


-- 4. SUBQUERIES (4 Questions)
#Q1List transactions above average transaction value
SELECT * FROM transaction_logs
WHERE amount > (SELECT AVG(amount) FROM transaction_logs);

-- #Q2Find merchants involved in more than average fraud count
SELECT merchant FROM transaction_logs
WHERE merchant IN (
    SELECT merchant
    FROM transaction_logs
    WHERE is_fraud = 1
    GROUP BY merchant
    HAVING COUNT(*) > (SELECT AVG(fcount) FROM (
        SELECT COUNT(*) AS fcount FROM transaction_logs WHERE is_fraud = 1 GROUP BY merchant
    ) AS t)
);

-- #Q3Customers whose total spend is higher than system average
SELECT name, customer_id FROM customers_profile
WHERE customer_id IN (
    SELECT pc.customer_id
    FROM payment_cards pc
    JOIN transaction_logs tl ON pc.card_id = tl.card_id
    GROUP BY pc.customer_id
    HAVING SUM(tl.amount) > (SELECT AVG(amount) FROM transaction_logs)
);

-- #Q4List fraud transactions that DO NOT have alerts yet
SELECT txn_id, amount, merchant FROM transaction_logs
WHERE is_fraud = 1
AND txn_id NOT IN (SELECT txn_id FROM fraud_alerts);

-- #Q5Find Which Card Type Has Higher Avg Transaction Amount
SELECT card_type, AVG(amount) AS avg_spent
FROM transaction_logs tl
JOIN payment_cards pc ON tl.card_id = pc.card_id
GROUP BY card_type
HAVING AVG(amount) > (
    SELECT AVG(amount) FROM transaction_logs
);

-- #Q6List Customers Who Have Both Debit and Credit Cards
SELECT cp.customer_id, cp.name
FROM customers_profile cp
WHERE cp.customer_id IN (
    SELECT customer_id FROM payment_cards WHERE card_type = 'Debit'
)
AND cp.customer_id IN (
    SELECT customer_id FROM payment_cards WHERE card_type = 'Credit'
);

DESCRIBE customers_profile;

DESCRIBE payment_cards;

DESCRIBE fraud_alerts;

DESCRIBE transaction_logs;

SELECT * FROM customers_profile;

SELECT * FROM payment_cards;

SELECT * FROM transaction_logs;

SELECT * FROM fraud_alerts;

SELECT cp.name, tl.amount
FROM transaction_logs tl
JOIN payment_cards pc ON tl.card_id = pc.card_id
JOIN customers_profile cp ON pc.customer_id = cp.customer_id
WHERE tl.amount > (SELECT AVG(amount) FROM transaction_logs)
ORDER BY tl.amount DESC
LIMIT 5;

SELECT card_id, 
       (SELECT COUNT(*) FROM transaction_logs t1 
        WHERE t1.card_id = tl.card_id AND t1.is_fraud = 1) AS fraud_count
FROM transaction_logs tl
GROUP BY card_id
HAVING fraud_count > (
        SELECT COUNT(*)/2 FROM transaction_logs t2 
        WHERE t2.card_id = tl.card_id
    )
LIMIT 5;

SELECT DISTINCT cp.name
FROM customers_profile cp
WHERE cp.customer_id IN (
    SELECT pc.customer_id
    FROM payment_cards pc
    JOIN transaction_logs tl ON pc.card_id = tl.card_id
    WHERE tl.is_fraud = 1)
AND cp.customer_id IN (
    SELECT pc.customer_id
    FROM payment_cards pc
    JOIN transaction_logs tl ON pc.card_id = tl.card_id
    WHERE tl.is_fraud = 0)
LIMIT 5;

SELECT merchant, fraud_count
FROM (
    SELECT merchant, COUNT(*) AS fraud_count
    FROM transaction_logs
    WHERE is_fraud = 1
    GROUP BY merchant
) AS fraud_data
ORDER BY fraud_count DESC
LIMIT 1;
