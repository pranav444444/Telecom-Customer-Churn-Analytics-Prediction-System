-- Remove null and insert the new data into Prod table which will be our final source dataset 

CREATE TABLE prod_churn AS
SELECT 
    Customer_ID,

    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,

    IFNULL(NULLIF(Value_Deal, ''), 'None') AS Value_Deal,

	Phone_Service,
    IFNULL(NULLIF(Multiple_Lines, ''), 'No') AS Multiple_Lines,

    Internet_Service,
    IFNULL(NULLIF(Internet_Type, ''), 'None') AS Internet_Type,

    IFNULL(NULLIF(Online_Security, ''), 'No') AS Online_Security,
    IFNULL(NULLIF(Online_Backup, ''), 'No') AS Online_Backup,
    IFNULL(NULLIF(Device_Protection_Plan, ''), 'No') AS Device_Protection_Plan,
    IFNULL(NULLIF(Premium_Support, ''), 'No') AS Premium_Support,

    IFNULL(NULLIF(Streaming_TV, ''), 'No') AS Streaming_TV,
    IFNULL(NULLIF(Streaming_Movies, ''), 'No') AS Streaming_Movies,
    IFNULL(NULLIF(Streaming_Music, ''), 'No') AS Streaming_Music,
    IFNULL(NULLIF(Unlimited_Data, ''), 'No') AS Unlimited_Data,

    Contract,
    Paperless_Billing,
    Payment_Method,

    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,

    Customer_Status,

    IFNULL(NULLIF(Churn_Category, ''), 'Others') AS Churn_Category,
    IFNULL(NULLIF(Churn_Reason, ''), 'Others') AS Churn_Reason

FROM stg_churn;


