CREATE DATABASE churn ;

USE churn;

-- Make Customer_ID NOT NULL

ALTER TABLE stg_churn
MODIFY Customer_ID VARCHAR(50) NOT NULL;

-- Set Customer_ID as Primary Key
ALTER TABLE stg_churn
ADD PRIMARY KEY (Customer_ID);

-- checking whether data has been sucessfullly loaded or not
SELECT 
    *
FROM
    stg_churn;
    
    