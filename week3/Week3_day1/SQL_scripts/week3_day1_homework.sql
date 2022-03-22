/* 1 MVP


Question 1.
Find all the employees who work in the ‘Human Resources’ department.

*/

SELECT *
FROM employees 
WHERE department = 'Human Resources'
ORDER BY
    last_name ASC NULLS LAST

/*

Question 2.
Get the first_name, last_name, and country of the employees who work
 in the ‘Legal’ department.
*/

SELECT
    first_name,
    last_name,
    country,
    department 
FROM employees 
WHERE department = 'Legal'
ORDER BY
    country ASC NULLS LAST
    
    

/* Question 3.
Count the number of employees based in Portugal.
*/
    
SELECT
    count(*) AS employees_portugal
FROM employees 
WHERE country = 'Portugal'




/*
Question 4.
Count the number of employees based in either Portugal or Spain.
*/

SELECT
    count(*) AS employees_num_iberia
FROM employees 
WHERE (country= 'Portugal' OR country = 'Spain');



/*

Question 5.
Count the number of pay_details records lacking a local_account_no. 
 
 */

SELECT
    pay_details,
    local_account_no,
    id,
    count(*)
FROM pay_details 
WHERE local_account_no IS NULL
GROUP BY id;

--25 records lacking local_account_no
--


/* Question 6.
Are there any pay_details records lacking both a local_account_no and iban number?
*/

SELECT *
FROM employees 
WHERE pay_detail_id IS NULL

SELECT
    local_account_no,
    iban,    
    id,
    count(*)
FROM pay_details
WHERE (local_account_no IS NULL AND iban IS NULL)
GROUP BY id;    

-- there seems to be no records where both local account no and iban are zero
/*
Question 7.
Get a table with employees first_name and last_name ordered alphabetically by last_name (put any NULLs last).
*/

SELECT
    first_name,
    last_name 
FROM employees 
ORDER BY last_name ASC NULLS LAST



Question 8.
Get a table of employees first_name, last_name and country, ordered alphabetically first by country and then by last_name (put any NULLs last).

SELECT
    first_name,
    last_name,
    country 
FROM employees 
ORDER BY
    country ASC NULLS LAST,
    last_name ASC NULLS LAST;

Question 9.
Find the details of the top ten highest paid employees in the corporation.

SELECT
    first_name,
    last_name,
    salary 
FROM employees 
ORDER BY salary DESC NULLS LAST
LIMIT 10

Question 10.
Find the first_name, last_name and salary of the lowest paid employee in Hungary.

SELECT
    first_name,
    last_name,
    salary,
    country 
FROM employees
WHERE country = 'Hungary'
ORDER BY salary ASC NULLS LAST
LIMIT 1


Question 11.
How many employees have a first_name beginning with ‘F’?

SELECT
    first_name,
    last_name 
FROM employees 
WHERE first_name ~ '^F'

Question 12.
Find all the details of any employees with a ‘yahoo’ email address?

SELECT * 
FROM employees 
WHERE email ~* '@yahoo'
ORDER BY last_name ASC NULLS LAST;

/*Question 13. Count the number of pension enrolled employees not based in either France or Germany.
*/
SELECT *, 
    Count(*) AS employees_france_germany
FROM employees 
WHERE (country != 'France' OR country != 'Germany') AND
    pension_enrol = TRUE
GROUP BY id;

--488 pension enrolled employees

/*Question 14.
What is the maximum salary among those employees in the ‘Engineering’ department who work 1.0 full-time equivalent hours (fte_hours)?
*/

SELECT *,
--   salary,
--    department,
--    last_name,
    max(salary) AS maximum_salary
FROM employees 
WHERE department = 'Engineering' AND fte_hours = 1.0
GROUP by
      employees.id 
--    employees.salary,
--    employees.last_name,
--    employees.department
ORDER BY
    salary DESC NULLS LAST
LIMIT 1;  
--The maximimum salary for fte_hours = 1.0 is 83370

/*
Question 15.
Return a table containing each employees first_name, last_name, full-time equivalent hours (fte_hours), salary, and a new column effective_yearly_salary which should contain fte_hours multiplied by salary.
*/

select *,
    sum(fte_hours * salary) AS effective_yearly_salary 
FROM employees
group by 
    employees.id

/*2 Extension


Question 16.
The corporation wants to make name badges for a forthcoming conference. Return a column badge_label showing employees’ first_name and last_name 
joined together with their department in the following style: ‘Bob Smith - Legal’. Restrict output to only those employees with stored first_name, last_name and department.
*/

SELECT
    first_name, 
    last_name, 
    start_date, 
    department,
    concat(first_name ' ', last_name , " - ", department) AS badge_format
    FROM employees 


Question 17.
One of the conference organisers thinks it would be nice to add the year of the employees’ start_date to the badge_label to celebrate long-standing colleagues, in the following style ‘Bob Smith - Legal (joined 1998)’. Further restrict output to only those employees with a stored start_date. 

[If you’re really keen - try adding the month as a string: ‘Bob Smith - Legal (joined July 1998)’] 

 Hints


Question 18.
Return the first_name, last_name and salary of all employees together with a new column called salary_class with a value 'low' where salary is less than 40,000 and value 'high' where salary is greater than or equal to 40,000. 

 Hints