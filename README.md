# 📊 Telecom Customer Churn Analytics & Prediction System

### *End-to-End Data Analytics, Machine Learning & Business Intelligence Project*

---

## 📌 Project Overview

Customer churn is a major challenge for telecom businesses because losing customers directly affects revenue and long-term growth.

This project presents an **end-to-end Telecom Customer Churn Analytics & Prediction System** that combines:

- **MySQL** for data preparation and analytical querying
- **Python** for data cleaning, exploratory analysis, feature engineering and machine learning
- **Scikit-Learn** for churn prediction
- **Power BI** for business intelligence and interactive dashboards
- **Predictive analytics** to identify newly joined customers who are at higher risk of churning

The project was initially developed as a churn analytics solution and was later **reworked with a more structured machine-learning workflow**, including improved data validation, business-oriented feature engineering, model comparison, hyperparameter tuning and probability-threshold optimization.

---

## 🎯 Project Objectives

- Analyze historical customer data to understand **churn patterns and drivers**
- Clean and validate the customer dataset
- Handle missing and invalid values using business context
- Perform business-oriented exploratory data analysis
- Engineer meaningful customer and service-level features
- Compare multiple classification models
- Tune the strongest models using cross-validation
- Optimize the classification threshold to improve churn detection
- Predict churn risk for newly joined customers
- Export prediction results for Power BI
- Build interactive dashboards for both **historical churn analysis** and **customer risk identification**
- Translate analytical findings into actionable business recommendations

---

## 🔄 End-to-End Workflow

```text
Raw Customer Data
       │
       ▼
MySQL Data Preparation
       │
       ▼
Data Understanding & Validation
       │
       ▼
Data Cleaning
       │
       ▼
Business-Oriented EDA
       │
       ▼
Feature Engineering
       │
       ▼
Train / Test Split
       │
       ▼
Preprocessing Pipeline
       │
       ▼
Model Comparison
       │
       ▼
Hyperparameter Tuning
       │
       ▼
Threshold Optimization
       │
       ▼
Final Gradient Boosting Model
       │
       ▼
Prediction on New Joiners
       │
       ▼
CSV Export
       │
       ▼
Power BI Dashboard
```

---

## 🗄️ SQL & Data Preparation

MySQL was used as the initial data preparation and analytics layer.

The SQL workflow was used to:

- Prepare structured customer data
- Handle null and inconsistent values
- Create analytical views
- Perform exploratory business queries
- Prepare datasets for Power BI and machine learning

### SQL Files

```text
SQL_queries/
│── sql_customer_churn.sql
│── sql_customer_churn_queries.sql
│── sql_customer_churn_views.sql
│── sql_customer_churn_nullvalues.sql
│── sql_customer_churn_handlingNullValues.sql
```

---

## 📊 Dataset Overview

The historical dataset contains:

- **6,007 customers**
- **32 original columns**
- **4,275 Stayed customers**
- **1,732 Churned customers**

### Target Distribution

| Customer Status | Customers | Percentage |
|---|---:|---:|
| Stayed | 4,275 | 71.17% |
| Churned | 1,732 | 28.83% |

The target distribution is moderately imbalanced, so model evaluation focused on multiple metrics rather than accuracy alone.

---

## 🧹 Data Cleaning & Validation

Several data-quality issues were identified and handled before modelling.

### Missing Values

Two important columns contained missing values:

| Feature | Missing Values | Percentage |
|---|---:|---:|
| `Value_Deal` | 3,297 | 54.89% |
| `Internet_Type` | 1,223 | 20.36% |

### Internet Type

Missing `Internet_Type` values corresponded to customers without internet service.

These values were represented as:

```text
No Internet
```

rather than dropping the affected customers.

### Value Deal

Because missing `Value_Deal` values could not reliably be assigned to a specific business category, they were represented as:

```text
Missing/Unknown
```

A separate missingness indicator was also created:

```text
Value_Deal_Missing
```

### Invalid Monthly Charges

The dataset contained **101 negative Monthly Charge values**, which were treated as invalid.

The invalid values were replaced using a business-group median based on:

```text
Contract
+
Internet_Service
+
Payment_Method
```

After cleaning:

- Invalid Monthly Charges: **0**
- Missing values: **0**
- Duplicate rows: **0**
- Duplicate Customer IDs: **0**

---

## 🔍 Business-Oriented Exploratory Data Analysis

EDA was performed to understand how customer characteristics relate to churn.

### Contract

| Contract | Churn Rate |
|---|---:|
| Two Year | 2.77% |
| One Year | 11.23% |
| Month-to-Month | 52.38% |

Month-to-month customers showed substantially higher historical churn.

### Internet Type

| Internet Type | Churn Rate |
|---|---:|
| Fiber Optic | 42.47% |
| Cable | 27.57% |
| DSL | 20.82% |
| No Internet | 8.91% |

### Payment Method

| Payment Method | Churn Rate |
|---|---:|
| Mailed Check | 42.86% |
| Bank Withdrawal | 36.05% |
| Credit Card | 16.16% |

### Value Deal

| Value Deal | Churn Rate |
|---|---:|
| Deal 5 | 68.69% |
| Missing/Unknown | 29.51% |
| Deal 4 | 27.22% |
| Deal 3 | 22.47% |
| Deal 2 | 12.93% |
| Deal 1 | 7.46% |

### Service Features

Customers without services such as Online Security, Online Backup, Device Protection and Premium Support generally showed higher historical churn rates.

These findings represent **observed associations in the dataset**, not causal relationships.

---

## 🧠 Feature Engineering

Only a small number of business-oriented features were retained rather than creating a large number of unnecessary variables.

### `Value_Deal_Missing`

Indicates whether the original `Value_Deal` value was missing.

### `Service_Count`

Counts the number of additional services subscribed to by each customer.

### `Avg_Monthly_Revenue`

Calculated as:

```text
Avg_Monthly_Revenue =
Total_Revenue / Tenure_in_Months
```

These engineered features were evaluated as part of the modelling workflow.

---

## 🤖 Machine Learning

### Models Compared

Three classification algorithms were evaluated:

- Gradient Boosting
- Random Forest
- Logistic Regression

### Cross-Validation Results

| Model | Accuracy | Precision | Recall | F1 | F2 | ROC-AUC |
|---|---:|---:|---:|---:|---:|---:|
| **Gradient Boosting** | **85.24%** | 78.51% | 67.29% | **72.45%** | **69.26%** | **90.59%** |
| Random Forest | 85.31% | **80.77%** | 64.48% | 71.65% | 67.16% | 90.30% |
| Logistic Regression | 83.37% | 72.95% | 67.29% | 69.99% | 68.34% | 88.62% |

Gradient Boosting provided the strongest overall balance and was selected for further tuning.

---

## ⚙️ Hyperparameter Tuning

`GridSearchCV` with 5-fold cross-validation was used to tune the Gradient Boosting and Random Forest models.

### Best Gradient Boosting Parameters

```text
learning_rate = 0.05
max_depth     = 3
n_estimators  = 200
subsample     = 0.8
```

Best CV F1:

```text
0.7344
```

### Best Random Forest Parameters

```text
max_depth         = 20
max_features      = sqrt
min_samples_leaf  = 1
min_samples_split = 5
n_estimators      = 200
```

Best CV F1:

```text
0.7250
```

Gradient Boosting remained the preferred model after tuning.

---

## 📈 Final Model Evaluation

The tuned Gradient Boosting model was evaluated on a held-out test set using the default probability threshold of `0.50`.

### Threshold = 0.50

| Metric | Score |
|---|---:|
| Accuracy | 86.02% |
| Precision | 83.77% |
| Recall | 63.98% |
| F1 | 72.55% |
| F2 | 67.15% |
| ROC-AUC | 89.84% |

Although accuracy and precision were strong, the model missed a considerable number of actual churners.

Because identifying potential churners is important for retention, probability-threshold optimization was performed.

---

## 🎚️ Probability Threshold Optimization

Instead of relying only on the default `0.50` threshold, multiple probability thresholds were evaluated.

The final threshold selected for the prediction workflow was:

```text
0.36
```

The lower threshold increases the model's sensitivity toward potential churners.

### Final Test Performance — Threshold = 0.36

| Metric | Final Score |
|---|---:|
| Accuracy | **84.03%** |
| Churn Precision | **72.33%** |
| Churn Recall | **72.33%** |
| Churn F1 | **72.33%** |
| Churn F2 | **72.33%** |
| ROC-AUC | **89.55%** |

### Confusion Matrix

```text
[[759,  96],
 [ 96, 251]]
```

---

## 📊 Original Baseline vs Final Model

The original notebook used a Random Forest classifier with the default threshold.

### Original Baseline

| Metric | Original Random Forest |
|---|---:|
| Accuracy | 84.00% |
| Churn Precision | 78.00% |
| Churn Recall | 65.00% |
| Churn F1 | 71.00% |

### Final Model

| Metric | Final Gradient Boosting |
|---|---:|
| Accuracy | **84.03%** |
| Churn Precision | 72.33% |
| Churn Recall | **72.33%** |
| Churn F1 | **72.33%** |
| Churn F2 | **72.33%** |
| ROC-AUC | **89.55%** |

### Key Improvement

The main improvement was in identifying actual churners:

```text
Churn Recall:
65.00% → 72.33%
```

This represents an improvement of:

```text
+7.33 percentage points
```

Overall accuracy remained approximately **84%**.

The trade-off was lower churn precision, which is expected when lowering the classification threshold to capture more potential churners.

---

## 🔮 Prediction on Newly Joined Customers

The finalized Gradient Boosting model was applied to the `vw_joindata` dataset containing **411 newly joined customers**.

The same feature preparation used during model development was applied to the new data, including:

- Missing-value handling
- Invalid Monthly Charge treatment
- `Value_Deal_Missing`
- `Service_Count`
- `Avg_Monthly_Revenue`
- Consistent feature ordering

A feature-alignment check confirmed:

```text
Same feature columns: True
```

### Prediction Results

```text
Total New Customers : 411
Predicted Churn     : 386
Predicted Stayed    : 25
```

Predicted churn rate:

```text
93.92%
```

This **93.92% is the predicted churn rate of this particular 411-customer new-joiner population**, not the historical churn rate of the entire telecom customer base.

The new-joiner dataset has a substantially different feature distribution from the historical training population, so these predictions should be interpreted as **model-generated risk scores for this specific population**.

---

## 📁 Prediction Outputs

The final prediction workflow generates:

```text
All_Customer_Churn_Predictions.csv
Churn_Risk_Customers_Predictions.csv
```

### `All_Customer_Churn_Predictions.csv`

Contains all newly joined customers together with:

- `Customer_ID`
- `Churn_Probability`
- `Customer_Status_Predicted`
- Customer attributes
- Prediction-related fields

### `Churn_Risk_Customers_Predictions.csv`

Contains customers classified as:

```text
Customer_Status_Predicted = 1
```

These customers form the actionable churn-risk population used by the Power BI prediction dashboard.

---

## 📊 Power BI Dashboards

The project contains two major Power BI dashboards.

---

## 1️⃣ Churn Overview & Analytics Dashboard

### Purpose

Understand historical customer churn and identify important business patterns.

### Key Components

- Total Customers
- New Joiners
- Total Churn
- Overall Churn Rate
- Churn by Gender
- Churn Rate by Age Group
- Churn Rate by State
- Churn Rate by Internet Type
- Churn Rate by Payment Method
- Churn Rate by Contract
- Churn Rate by Tenure Group
- Churn by Churn Category
- Service-level churn analysis

### Dashboard Preview

<img width="1338" height="742" alt="Telecom Customer Churn Analytics Overview Dashboard" src="https://github.com/user-attachments/assets/a6780145-773c-444b-97ee-d28d381a873b" />

---

## 2️⃣ Churn Prediction — Customers at Risk

### Purpose

Help business teams identify newly joined customers who require proactive retention attention.

### Key Components

- Predicted churner count
- Gender distribution
- State-wise churn-risk distribution
- Tenure-group distribution
- Age-group distribution
- Marital-status distribution
- Payment-method distribution
- Contract distribution
- Customer-level churn probabilities
- Detailed customer risk table

### Current Prediction Dashboard

```text
Predicted Churners: 386
```

### Dashboard Preview

<img width="1337" height="755" alt="image" src="https://github.com/user-attachments/assets/a2943028-8114-41ea-a26d-67b35f2ee7a3" />

---

## 💡 Key Business Insights

The analysis identified several important churn patterns:

- **Month-to-Month customers** have substantially higher churn than customers on long-term contracts.
- **Fiber Optic customers** show significantly higher historical churn.
- Customers without services such as **Online Security and Premium Support** show higher churn rates.
- **Mailed Check** and **Bank Withdrawal** customers show higher historical churn than Credit Card customers.
- Different **Value Deal** groups show substantially different churn rates.
- Customer tenure and monthly charges provide useful signals for understanding churn behaviour.
- Predictive modelling enables customer-level risk identification beyond historical descriptive analysis.

---

## 🧭 Business Recommendations

Based on the analytical and predictive results:

- Target **Month-to-Month customers** with contract upgrade or loyalty offers.
- Prioritize high-risk customers for proactive retention campaigns.
- Investigate service quality and pricing concerns among **Fiber Optic customers**.
- Provide additional engagement and support during the early customer lifecycle.
- Personalize retention offers using customer characteristics and predicted churn probability.
- Use the prediction dashboard as an operational list for retention teams.

---

## 🏢 Business Value

The project connects historical analytics with predictive decision-making:

```text
Historical Customer Data
          ↓
Understand Churn Drivers
          ↓
Machine Learning
          ↓
Predict Customer Risk
          ↓
Power BI
          ↓
Retention Action
```

The final system transforms raw customer data into:

- Historical churn insights
- Customer-level risk predictions
- Interactive business dashboards
- Actionable retention opportunities

The approach can also be adapted to other subscription-based industries such as **SaaS, banking, insurance and e-commerce**.

---

## 🧪 Machine Learning Methodology

The final modelling workflow followed these steps:

1. Validate the dataset and target variable.
2. Remove identifiers and post-outcome leakage columns.
3. Handle missing and invalid values using business context.
4. Perform business-oriented exploratory analysis.
5. Create a limited set of meaningful engineered features.
6. Build preprocessing pipelines for numerical and categorical variables.
7. Compare multiple classification algorithms.
8. Tune the strongest models using cross-validation.
9. Evaluate the selected model on a held-out test set.
10. Optimize the probability threshold according to the churn-detection objective.
11. Apply the finalized model to newly joined customers.
12. Export predictions for Power BI.

This approach avoids relying on accuracy alone and evaluates the model using metrics relevant to the business objective.

---

## 📌 Final Model Configuration

```text
Model              : Gradient Boosting Classifier
Learning Rate      : 0.05
Maximum Depth      : 3
Estimators         : 200
Subsample          : 0.8
Classification     : Binary
Final Threshold    : 0.36
```

### Final Test Performance

```text
Accuracy   : 84.03%
Precision  : 72.33%
Recall     : 72.33%
F1-Score   : 72.33%
F2-Score   : 72.33%
ROC-AUC    : 89.55%
```

---

## 📁 Project Structure

```text
Customer Churn Analytics Project/
│
├── SQL_queries/
│   ├── sql_customer_churn.sql
│   ├── sql_customer_churn_queries.sql
│   ├── sql_customer_churn_views.sql
│   ├── sql_customer_churn_nullvalues.sql
│   └── sql_customer_churn_handlingNullValues.sql
│
├── images/
│   └── Dashboard screenshots & project assets
│
├── documentations for understanding/
│   └── Dataset_Project_understanding_And_Project.docx
│
├── Customer_Data.xlsx
├── Prediction_data.xlsx
│
├── All_Customer_Churn_Predictions.csv
├── Churn_Risk_Customers_Predictions.csv
│
├── customer_churn_prediction_ML.ipynb
├── customer_churn_analytics_dashboard.pbix
├── README.md
└── LICENSE
```

---

## 🛠️ Tools & Technologies

### Programming & Data Analysis

- Python
- Pandas
- NumPy

### Database

- MySQL
- SQL

### Machine Learning

- Scikit-Learn
- Gradient Boosting
- Random Forest
- Logistic Regression
- GridSearchCV
- Stratified Cross-Validation
- Probability Threshold Optimization

### Business Intelligence

- Microsoft Power BI
- Power Query
- DAX

### Development & Version Control

- Jupyter Notebook
- Git
- GitHub

---

## 📈 Project Outcome

The project evolved from a basic Random Forest churn classifier into a structured **analytics + machine learning + business intelligence solution**.

The final workflow combines:

```text
SQL
 ↓
Python Data Preparation
 ↓
Business EDA
 ↓
Feature Engineering
 ↓
Model Comparison
 ↓
Hyperparameter Tuning
 ↓
Threshold Optimization
 ↓
Customer Churn Prediction
 ↓
Power BI
```

The most significant modelling improvement was the increase in **churn recall from 65.00% to 72.33%**, while maintaining approximately **84% overall accuracy**.

The resulting system provides both:

- **Historical understanding** of why customers churn
- **Predictive identification** of customers who may be at risk

This makes the project suitable as an end-to-end example of applying **SQL, Python, machine learning and Power BI to a real-world business problem**.

---

## 👤 Author

**Pranav Patel**

*Aspiring Data Analyst | Business Analytics | Machine Learning*

🔗 LinkedIn & GitHub profiles are available through the project dashboards.
