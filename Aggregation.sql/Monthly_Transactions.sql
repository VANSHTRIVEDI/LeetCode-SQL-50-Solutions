/*

Code
1193. Monthly Transactions I
Solved
Medium
Topics
Companies
SQL Schema
Pandas Schema
Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
*/

SELECT SUBSTR(trans_date,1,7)as month,
       country,
       COUNT(*)as trans_count,
       SUM(CASE WHEN state="approved" THEN 1 ELSE 0 END) as approved_count ,
       SUM(amount ) as trans_total_amount ,
       SUM(CASE WHEN state="approved" THEN amount ELSE 0 END) as approved_total_amount 
       FROM Transactions 
       GROUP BY month,country;