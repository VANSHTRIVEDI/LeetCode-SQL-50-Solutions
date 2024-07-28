/*

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
This table may have duplicate rows.
The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
The table shows the user activities for a social media website. 
Note that each session belongs to exactly one user.
 

Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

Return the result table in any order.

*/

WITH CTE AS (
SELECT user_id,activity_date 
    FROM Activity 
    WHERE activity_date>="2019-06-28" 
          AND 
          activity_date<="2019-07-27"         
    GROUP BY activity_date,user_id
)


SELECT activity_date as day,COUNT(user_id)as active_users  FROM CTE GROUP BY activity_date;
