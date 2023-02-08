/*Task 1: Have a view of all the columns in the table */

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'records_jan22';

/*2: How many rows does the data has?*/

select count(record_id) from records_jan22;

/*3: There is a record that was wrongly entered and needs to be removed. It is the record of a CEO that is late. 
The record_id is 430.*/ 

delete from records_jan22 where record_id = 430;

/*4: There is a record that wasn’t entered, please insert it*/

insert into records_jan22
values (430,'2020-10-31',1012,'David','Wells','1997-09-19',495.71,202.0,'Florida','13888','Adams-Rice','Financial','davids.wells@Adams.io');

/*5: A CEO’s company’s state was mistakenly omitted (has Null value) for records associated with it.
Please, fill these state name with “Texas”.*/

update records_jan22
set state = 'Texas' where state is NULL;

/*6: Display the unique states in the data.*/

select distinct state from records_jan22;
 
/*7: The state “New York” was misspelt as “New Yoke” in the dataset. Correct this in the dataset.*/

update records_jan22
set state = 'New York' where state = 'New Yoke';

/*8: Assuming the profit is total revenue – total expenses, find the total profit made by all companies in the 3 
years.*/

alter table records_jan22
add column total_profit REAL;

update records_jan22
set total_profit= total_revenue - total_expenses;

/*9: Find the company with the lowest profit in the 3 years.*/

select * from records_jan22
order by Total_profit asc
limit 1;


/*10: Find the state where the highest mean profit was generated in the 3 years.*/

select state, avg(total_profit) as Avg_Profit from records_jan22
group by state
order by avg_profit desc;

/*11: Who is the youngest CEO? (display his/her first name, last name, ceo_id, and date of birth)*/

select ceo_id,first_name,last_name,date_of_birth from records_jan22
order by date_of_birth desc
limit 1;

/*12: Find the CEO(s) whose company are in the IT industry and in California State. (Return only the CEO’s first 
name).*/

select first_name from records_jan22
where industry = 'IT' and state = 'California';

/*13: Find the postal code in New York with the highest revenue.*/

select postal_codes from records_jan22
where state = 'New York'
order by total_revenue desc
limit 1;

/*14: How many CEO’s email address have a top level domain (last four characters) as .com?*/

select ceo_id, first_name, last_name,email from records_jan22
where email like '%.com';

/*15: Which first name(s) is bore by most number of CEOs?*/

select first_name, count (first_name) from records_jan22
group by first_name;
