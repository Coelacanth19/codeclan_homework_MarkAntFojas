/*Question 1.
How many employee records are lacking both a grade and salary?
*/

SELECT
    count(id)
FROM
    employees
WHERE
    grade IS NULL AND salary is NULL

    /* Question 2.
Produce a table with the two following fields (columns):

the department
the employees full name (first and last name)
Order your resulting table alphabetically by department, and then by last name

*/

SELECT
    department
    concat(last_name ' ' first name)
FROM
    employees
ORDER BY
    department, last_name
    
    
/*Question 3.
Find the details of the top ten highest paid employees who have a last_name beginning with ‘A’.
*/

SELECT *
FROM EMPLOYEES
WHERE last_name like 'A%'
ORDER BY
    salary DESC NULLS LAST
    LIMIT 10
    

SELECT
    department,
    count(id) AS employees_2003
FROM EMPLOYEES
WHERE start_date between '2003-01-01' AND '2003-12-31'
GROUP BY department


/*Question 5.
Obtain a table showing department, fte_hours and the number of employees in each department who work each fte_hours pattern. Order the table alphabetically by department, and then in ascending order of fte_hours. 
 Hint You need to GROUP BY two columns here. */

SELECT
    department,
    fte_hours,
    count(id) as employee_count
FROM 
    EMPLOYEES
GROUP BY
    department,
    fte_hours
ORDER BY
    department, fte_hours
    

/* Question 6.
Provide a breakdown of the numbers of employees enrolled, not enrolled, 
and with unknown enrollment status in the corporation pension scheme
*/

SELECT
    pension_enrol,
    count(id)
FROM
    employees    
GROUP BY 
    pension_enrol

/*Question 7.
Obtain the details for the employee with the highest salary in the ‘Accounting’ department who is not enrolled in the pension scheme? */
SELECT *
FROM
    employees
WHERE
    department = 'Accounting' AND pension_enrol = FALSE
ORDER BY
    salary DESC NULLS LAST
    LIMIT 1

/* Question 8.
Get a table of country, number of employees in that country, 
and the average salary of employees in that country for any countries 
in which more than 30 employees are based. 
Order the table by average salary descending.
*/

SELECT
    country,
    avg(salary) AS AVG_SALARY,
    count(id)
FROM
    employees
GROUP BY 
    country
HAVING count(id) > 30
ORDER BY
    avg(salary) DESC NULLS LAST

/* Question 9.
11. Return a table containing each employees 
first_name, last_name, full-time equivalent hours (fte_hours), salary, 
and a new column effective_yearly_salary 
which should contain fte_hours multiplied by salary.
 Return only rows where effective_yearly_salary is more than 30000
*/

SELECT
    first_name,
    last_name,
    fte_hours,
    salary,
    fte_hours * salary AS effective_yearly_salary
FROM employees
WHERE fte_hours * salary > 30000
GROUP BY
    last_name,
    first_name,
    fte_hours,
    salary

/* Question 10
Find the details of all employees in either Data Team 1 or Data Team 2 
 Hint
name is a field in table `teams */

SELECT *
FROM employees as e 
    LEFT JOIN teams as t
    ON e.team_id = t.id
WHERE t.name = 'Data Team 1' OR t.name = 'Data Team 2'

/* Question 11
Find the first name and last name of all employees who lack a local_tax_code.
*/

SELECT
    e.first_name,
    e.last_name,
    pd.local_tax_code
FROM employees as e
LEFT JOIN pay_details as pd
ON e.pay_detail_id = pd.id
WHERE pd.local_tax_code IS NULL
ORDER BY
    last_name,
    first_name
  
    

/* Question 12.
The expected_profit of an employee is defined as (48 * 35 * charge_cost - salary) 
* fte_hours, where charge_cost depends upon the team to which the employee belongs. 
* Get a table showing expected_profit for each employee.
*/

SELECT
    t.charge_cost,
    e.salary,
    e.fte_hours,
    t.name,
    1680 * CAST(t.charge_cost AS int) - e.salary AS expected_profit
FROM employees as e
    LEFT JOIN teams as t
    ON e.team_id = t.id
ORDER BY salary DESC NULLS LAST


/* Question 13. [Tough]
Find the first_name, last_name and salary of the lowest paid employee in Japan who works the least common full-time equivalent hours across the corporation.”

 Hint
You will need to use a subquery to calculate the mode
*/

SELECT
    first_name,
    last_name,
    salary,
    fte_hours
FROM employees
WHERE country = 'Japan' AND fte_hours = (
    SELECT fte_hours
    FROM employees
    GROUP BY fte_hours
    ORDER BY count(fte_hours) ASC
    LIMIT 1)

ORDER BY salary ASC NULLS LAST
LIMIT 1
    
/* Question 14.
Obtain a table showing any departments in which there are two or more employees 
lacking a stored first name. Order the table in descending order of the number 
of employees lacking a first name, and then in alphabetical order by department.
*/
SELECT 
    first_name,
    department,
    count(id) AS two_or_more
FROM
    employees
WHERE
     first_name IS NULL
GROUP BY 
    department,
    first_name
HAVING 
    count(id) >= 2
ORDER BY
    count(id) desc, department

/*Question 15. [Bit tougher]
Return a table of those employee first_names shared by more than one employee, 
together with a count of the number of times each first_name occurs. 
Omit employees without a stored first_name from the table. Order the table 
descending by count, and then alphabetically by first_name. */

SELECT
    first_name,
    count(id) AS repeats
FROM
    employees
GROUP BY
    first_name
HAVING
    first_name IS NOT NULL AND count(id) > 1
ORDER BY
    repeats DESC, first_name ASC
    

    

    
    

/* 16. Question 16. [Tough]
Find the proportion of employees in each department who are grade 1. 
 Hints Think of the desired proportion for a given department as the number of employees in that department who are grade 1, divided by the total number of employees in that department.


You can write an expression in a SELECT statement, e.g. grade = 1. This would result in BOOLEAN values.
*/
SELECT
        department,
       sum(CAST(grade ='1' AS int)) / CAST(count(id) AS REAL) AS prop_grade3_1
FROM employees
GROUP BY department




--CAM method

WITH department_count_grade1 AS (
    SELECT 
        department ,
        CAST(count(*) AS REAL) AS employ_num 
    FROM employees 
    WHERE grade = 1
    GROUP BY department  
),
department_count_all AS (
    SELECT 
        department ,
        CAST(count(*) AS REAL) AS employ_num
    FROM employees 
    GROUP BY department  
)
SELECT 
    d_grade.department,
    d_grade.employ_num AS grade1_count,
    d_all.employ_num AS all_count,
    (d_grade.employ_num / d_all.employ_num) AS dep_percentage
FROM department_count_grade1 AS d_grade
INNER JOIN department_count_all AS d_all 
ON d_grade.department = d_all.department;
   


--Order of Execution

/*
From
Where
Group BY
Havimg
Select
Order BY
Limit
*/
    

    
    