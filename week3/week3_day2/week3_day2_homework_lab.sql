1 MVP


/*Question 1.
(a). Find the first name, last name and team name of employees who are members of teams. 

*/

employees.team_id
teams.id

SELECT *
FROM employees as e
INNER JOIN teams as t
ON e.team_id = t.id


/*
 Hint
We only want employees who are also in the teams table. So which type of join should we use?


(b). Find the first name, last name and team name of employees who are members 
of teams and are enrolled in the pension scheme.

*/

SELECT *
FROM employees as e
INNER JOIN teams as t
ON e.team_id = t.id
WHERE pension_enrol = TRUE

/*(c). Find the first name, last name and team name of employees who are members of teams,
  where their team has a charge cost greater than 80.
  */

SELECT
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM employees as e
INNER JOIN teams as t
ON e.team_id = t.id
WHERE CAST(charge_cost AS int) > 80

/* Hint


Question 2.
(a). Get a table of all employees details, together with their local_account_no 
and local_sort_code, if they have them. 

 Hints
 */

SELECT
    e.*,
    pd.local_account_no,
    pd.local_sort_code
FROM employees AS e
LEFT JOIN pay_details as pd 
ON e.pay_detail_id = pd.id 


/*(b). Amend your query above to also return the name of the team that each employee belongs to. 
*/

SELECT
    e.*,
    pd.local_account_no,
    pd.local_sort_code
FROM (employees AS e
LEFT JOIN pay_details as pd 
ON e.pay_detail_id = pd.id)
INNER JOIN teams AS t 
ON e.team_id = t.id 


/*Question 3.
(a). Make a table, which has each employee id along with the team that employee belongs to.
*/
SELECT
    e.id AS employee_id,
    t.name AS team_name
FROM employees AS e
LEFT JOIN teams AS t
ON e.team_id = t.id

    


(b). Breakdown the number of employees in each of the teams. 

SELECT
    count(e.id),
    e.id AS employee_id,
    t.name AS team_name,
    t.id AS team_id    
FROM employees AS e
LEFT JOIN teams as t
ON e.team_id = t.id 
GROUP BY 
    t.name,
    e.id,
    t.id


(c). Order the table above by so that the teams with the least employees come first.

SELECT
    count(t.id) AS teams_count
    e.id AS employee_id,
    t.name AS team_name
FROM(employees AS e LEFT JOIN  pay_details AS pd 
ON e.pay_detail_id = pd.id)
INNER JOIN teams AS t 
ON e.team_id = t.id 
GROUP by 
    t.name,
    e.id,
    t.id
  

 

Question 4.
(a). Create a table with the team id, team name and the count of the number of employees in each team.



(b). The total_day_charge of a team is defined as the charge_cost of the team multiplied by the number of employees in the team. Calculate the total_day_charge for each team. 

 Hint


(c). How would you amend your query from above to show only those teams with a total_day_charge greater than 5000?


2 Extension


Question 5.
How many of the employees serve on one or more committees?


 Hints


Question 6.
How many of the employees do not serve on a committee?


 Hints
