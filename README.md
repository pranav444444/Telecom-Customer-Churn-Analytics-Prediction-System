# 📊 Telecom Customer Churn Analytics & Prediction System

### *End-to-End Data Analytics Project using SQL, Power BI & Machine Learning*

---

## 📌 Project Overview

Customer churn is a critical challenge for telecom businesses, directly impacting revenue and long-term growth.
In this project, I designed and implemented a **complete end-to-end churn analytics and prediction system** that combines:

* **SQL-based data preparation**
* **Exploratory and descriptive analytics**
* **Machine Learning–based churn prediction**
* **Interactive Power BI dashboards for business users**

The solution not only explains **why customers churned in the past**, but also identifies **which current customers are at risk of churning**, enabling proactive retention strategies.

---

## 🎯 Project Objectives

* Analyze historical customer data to understand **churn drivers**
* Build a **machine learning model** to predict customer churn
* Improve churn recall using **probability-based threshold tuning**
* Design **business-ready Power BI dashboards** for:

  * Churn overview & insights
  * Predicted customers at risk
* Deliver actionable **business recommendations** based on insights

---

## 🧠 End-to-End Project Workflow

1. **Data Understanding & Exploration**
2. **Data Cleaning & Transformation (SQL + Python)**
3. **Exploratory Data Analysis**
4. **Machine Learning Model Development**
5. **Churn Prediction on New Customers**
6. **Power BI Dashboard Design**
7. **Business Insights & Recommendations**

---

## 🗄️ Data Preparation & SQL Layer

I used SQL to:

* Handle missing and inconsistent values
* Create analytical views for churn analysis
* Prepare structured datasets for Power BI and ML

📁 **SQL Folder**

```
SQL_queries/
│── sql_customer_churn.sql
│── sql_customer_churn_queries.sql
│── sql_customer_churn_views.sql
│── sql_customer_churn_nullvalues.sql
│── sql_customer_churn_handlingNullValues.sql
```

These queries ensure **clean, analysis-ready data** and follow best practices for analytics workflows.

---

## 🤖 Machine Learning – Churn Prediction Model

### 🔹 Model Used

* **Random Forest Classifier**

### 🔹 Baseline Evaluation (Default Threshold = 0.50)

| Class        | Precision | Recall | F1-Score |
| ------------ | --------- | ------ | -------- |
| Stayed (0)   | 0.86      | 0.92   | 0.89     |
| Churned (1)  | 0.78      | 0.65   | 0.71     |
| **Accuracy** |           |        | **0.84** |

**Observation:**
The model was accurate but missed a significant number of churned customers (lower recall).

---

### 🔹 Model Improvement – Probability Threshold Tuning

To better identify churn-risk customers, I used `predict_proba()` and applied a **custom threshold of 0.40**.

### ✅ Improved Evaluation (Threshold = 0.40)

| Class        | Precision | Recall   | F1-Score |
| ------------ | --------- | -------- | -------- |
| Stayed (0)   | 0.89      | 0.87     | 0.88     |
| Churned (1)  | 0.70      | **0.73** | 0.71     |
| **Accuracy** |           |          | **0.83** |

### ✔ Key Improvement

* **Churn Recall improved from 0.65 → 0.73**
* Better identification of **customers at risk**, which is more valuable for business than raw accuracy

---

## 🔮 Prediction on New Customers

I applied the trained model to **new joiner/customer data**:

* Encoded categorical features using saved encoders
* Predicted churn probability using `predict_proba`
* Filtered customers **predicted as churned**
* Exported results for Power BI consumption

📄 Output File:

```
Churn_Risk_Customers_Predictions.xlsx
```

This dataset serves as the **foundation for the prediction dashboard**.

---

## 📊 Power BI Dashboards

### 1️⃣ Dashboard 1 – Churn Overview & Insights

**Purpose:**
Understand historical churn behavior and identify key churn drivers.

**Key Insights:**

* Churn rate is highest among **Month-to-Month contracts**
* **Fiber Optic users** show the highest churn
* Higher churn observed in **older age groups**
* Competitive reasons dominate churn category
* Short tenure customers are more likely to churn

📷 *Overview Dashboard*

  <img width="1338" height="742" alt="image" src="https://github.com/user-attachments/assets/a6780145-773c-444b-97ee-d28d381a873b" />


---

### 2️⃣ Dashboard 2 – Churn Prediction: Customers at Risk

**Purpose:**
Enable business teams to take **proactive retention actions**.

**Key Features:**

* Count of predicted churners
* Demographic breakdown (age, gender, marital status)
* State-wise distribution of churn-risk customers
* Tenure, payment method & contract insights
* **Detailed customer list** for direct action

📷 *Prediction dashboard*

  <img width="1346" height="744" alt="image" src="https://github.com/user-attachments/assets/d848bf0f-d758-42ee-b3d0-df72a56edbfc" />


---

## 💡 Key Business Insights

* Customers on **month-to-month contracts** are the highest churn risk
* **Fiber Optic services** require service quality or pricing review
* Customers with **low tenure** and **high monthly charges** churn more
* Competitive offers strongly influence churn decisions
* Predictive modeling enables **early intervention**

---

## 🧭 Business Recommendations

* Offer **contract upgrades** to month-to-month customers
* Target **high-risk customers** with personalized retention offers
* Improve service experience for Fiber Optic users
* Focus retention efforts on customers within their **first 12 months**
* Use churn prediction list as a **weekly retention action pipeline**

---

## 🏢 How This Project Helps Businesses

* Reduces churn through **data-driven decision making**
* Enables **proactive customer retention**
* Improves marketing ROI by targeting the right customers
* Bridges analytics, ML, and business intelligence into one system
* Scales easily across telecom, subscription, and SaaS businesses

---

## 📁 Project Folder Structure

```
Customer Churn Analytics Project/
│
├── SQL_queries/                 # SQL scripts for data preparation
├── images/                      # Dashboard screenshots & icons
├── documentations for understanding/
│   └── Dataset_Project_understanding_And_Project.docx
│
├── Customer_Data.xlsx           # Raw customer dataset
├── Prediction_data.xlsx         # Input data for prediction
├── Churn_Risk_Customers_Predictions.xlsx
│
├── customer_churn_prediction_ML.ipynb
├── customer_churn_analytics_dashboard.pbix
├── README.md
└── LICENSE
```

---

## 🚀 Tools & Technologies Used

* **Python** (Pandas, NumPy, Scikit-Learn)
* **SQL (MySQL)**
* **Power BI**
* **Machine Learning (Random Forest)**
* **Git & GitHub**

---

## 👤 Author

**Pranav Patel**

📌 Aspiring Data Analyst | Business Analytics | Machine Learning
🔗 LinkedIn & GitHub linked directly inside the dashboards

---


