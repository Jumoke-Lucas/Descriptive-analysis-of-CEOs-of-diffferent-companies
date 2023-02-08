# Descriptive-analysis-of-CEOs-of-different-companies
An analysis carried out on 50 CEOs of different companies in January 2022 using SQL


### ABOUT THE DATASET
This dataset (*records_jan22.csv) contains the data of 50 CEOs of different countries from January 2022.


**The columns contained in the dataset includes:**
1. Records_id
2. Date
3. Ceo_id
4. First_name
5. Last_name
6. Date_of_birth
7. Total_revenue
8. Total_expenses
9. State
10. Postal_codes
11. Company_name
12. Industry
13. Email

### Analysis using SQL queries (*file: SQL analysis.sql*).

First, I created a database and a table where i imported the csv file containing the datasets
```
Create database CEO;

Create Table records_jan22(
record_id INTEGER, 
date DATE,
ceo_id INTEGER, 
first_name TEXT, 
last_name TEXT, 
date_of_birth DATE, 
total_revenue REAL, 
total_expenses REAL, 
state VARCHAR(14), 
postal_codes CHAR(5), 
company_name TEXT, 
industry TEXT, 
email TEXT, 
PRIMARY KEY(record_id));
```


