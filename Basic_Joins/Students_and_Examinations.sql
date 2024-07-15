/*

Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.
 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.


*/


















WITH StudentSubjects AS (
    SELECT 
        s.student_id as student_id, 
        s.student_name as student_name, 
        sub.subject_name AS subject_name
    FROM 
        Students s
    CROSS JOIN 
        Subjects sub
),

EXAM AS (
    SELECT
         student_id,
         subject_name,
         COUNT(student_id) as attended_exams   
    FROM  
        Examinations 
    GROUP BY student_id, subject_name
)

SELECT 
    ss.student_id,
    ss.student_name,
    ss.subject_name,
    COALESCE(e.attended_exams, 0) as attended_exams
FROM 
    StudentSubjects ss
LEFT JOIN 
    EXAM e ON ss.student_id = e.student_id AND ss.subject_name = e.subject_name
ORDER BY 
    ss.student_id, ss.subject_name;