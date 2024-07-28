/*
Table: Teacher

+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
 

Write a solution to calculate the number of unique subjects each teacher teaches in the university.

Return the result table in any order.

*/
WITH CTE AS (
SELECT teacher_id,subject_id    FROM Teacher GROUP BY teacher_id,subject_id
)

SELECT teacher_id,COUNT(subject_id) as cnt  FROM CTE GROUP BY teacher_id;