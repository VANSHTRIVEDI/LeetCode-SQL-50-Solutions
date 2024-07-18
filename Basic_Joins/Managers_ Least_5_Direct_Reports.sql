
/*
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.





*/


SELECT A.name 
   FROM 
      Employee AS A  
      LEFT JOIN Employee AS B 
      ON A.id=B.managerId 
      GROUP BY B.managerId 
      HAVING B.managerId IS NOT NULL 
      AND COUNT(B.managerId)>=5;