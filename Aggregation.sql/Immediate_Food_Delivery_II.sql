/*
Table: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

The result format is in the following example.
*/

--one way 

WITH CTE AS (
SELECT  
     order_date,
     customer_pref_delivery_date as P,
     RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as rank
     FROM Delivery 
)
-- SELECT order_date,P,rank FROM CTE;
SELECT ROUND(SUM(CASE WHEN rank=1 AND order_date=P THEN 1 ELSE 0 END)*100.00/SUM (CASE WHEN rank=1 THEN 1 ELSE 0 END),2) as immediate_percentage  FROM CTE;



--another way 
SELECT ROUND(COUNT (CASE WHEN A.order_date =

A.customer_pref_delivery_date THEN 1 ELSE NULL END ) * 100 / count(*),

2) immediate_percentage from delivery A WHERE A.order_date = 

(SELECT MIN(order_date) FROM  delivery B WHERE B.customer_id =

A.customer_id)