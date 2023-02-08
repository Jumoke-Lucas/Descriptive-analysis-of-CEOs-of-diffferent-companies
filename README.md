# Descriptive-analysis-of-CEOs-of-different-companies
An analysis carried out on 50 CEOs of different companies for 3 years in January 2022 using SQL


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
A record with record_id 430 was entered wrongly and i had to correct it 

```
delete from records_jan22 where record_id = 430;

insert into records_jan22
values (430,'2020-10-31',1012,'David','Wells','1997-09-19',495.71,202.0,'Florida','13888','Adams-Rice','Financial','davids.wells@Adams.io');
```
I calculated the total profit made by the companies in 3 years and inserted them in a new column

```
alter table records_jan22
add column total_profit REAL;

update records_jan22
set total_profit= total_revenue - total_expenses;
```
I found out the company with the lowest profit in the 3 years

```
select * from records_jan22
order by Total_profit asc
limit 1;
```
Details about the youngest CEO 

```
select ceo_id,first_name,last_name,date_of_birth from records_jan22
order by date_of_birth desc
limit 1;
```

I calculated the highest mean profit in the 3 years

```
select state, avg(total_profit) as Avg_Profit from records_jan22
group by state
order by avg_profit desc;
```

The other queries I wrote can be found [here](https://github.com/Jumoke-Lucas/Exploratory-analysis-of-international-brewery-brands-/blob/main/sql%20analysis.sql)






