-- 1) Gender wise distribution
SELECT 
    Gender,
    COUNT(Gender) AS total_count,
    COUNT(Gender) * 100 / (SELECT 
            COUNT(*)
        FROM
            stg_churn) AS Percentage
FROM
    stg_churn
GROUP BY Gender;

-- Contract wise distribution

SELECT 
    Contract,
    COUNT(Contract) AS TotalCount,
    COUNT(Contract) * 100 / (SELECT 
            COUNT(*)
        FROM
            stg_churn) AS Percentage
FROM
    stg_churn
GROUP BY Contract;

-- (M-IMP) Customer status distribution of data along with total revenue

SELECT 
    Customer_Status,
    COUNT(Customer_Status) AS TotalCount,
    SUM(Total_Revenue) AS TotalRev,
    SUM(Total_Revenue) * 100 / (SELECT 
            SUM(Total_Revenue)
        FROM
            stg_churn) AS RevPercentage
FROM
    stg_churn
GROUP BY Customer_Status;

-- state wise contribution or count

SELECT 
    state,
    COUNT(state) AS Total_Count,
    COUNT(state) * 100 / (SELECT 
            COUNT(*)
        FROM
            stg_churn) AS Percentage
FROM
    stg_churn
GROUP BY state
ORDER BY percentage DESC;

-- to check what are the unique internet types present in our dataset

SELECT DISTINCT
    Internet_Type
FROM
    stg_churn;
    




