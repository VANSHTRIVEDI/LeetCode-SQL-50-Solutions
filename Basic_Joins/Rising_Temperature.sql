/*

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
*/


# Write your MySQL query statement below

-- 1st way


/*
DATE_ADD(W2.recordDate, INTERVAL 1 DAY) adds one day to the recordDate of the W2 alias.
The join condition matches rows from W1 and W2 where the recordDate in W1 is one day after the
 recordDate in W2.
*/

SELECT W1.id
FROM Weather W1
JOIN Weather W2
ON W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL 1 DAY)
WHERE W1.temperature > W2.temperature;



-- 2nd way

/*
The condition DATEDIFF(w1.recordDate, w2.recordDate) = 1 ensures that we are comparing rows where w1.recordDate is exactly one day after w2.recordDate.

SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1
AND w1.temperature > w2.temperature;

*/



-- 3rd way


/*

LAG(temperature) OVER (ORDER BY recordDate): The LAG function retrieves the value of temperature from the previous row in the result set, based on the order specified by recordDate.
LAG(recordDate) OVER (ORDER BY recordDate): Similarly, the LAG function retrieves the value of recordDate from the previous row


WITH q1 AS (
  SELECT 
      *,
      LAG(temperature) OVER (ORDER BY recordDate) AS previous_day_temperature,
      LAG(recordDate) OVER (ORDER BY recordDate) AS previous_Date
  FROM Weather
)

-- Select the IDs where the temperature is higher than the previous day
-- and the previous day exists (difference is exactly 1 day)
SELECT id
FROM q1
WHERE temperature > previous_day_temperature
AND DATEDIFF(recordDate, previous_Date) = 1;

*/


