/*

Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.

*/

SELECT 
      x,y,z
      ,IF( x+y>z AND y+z>x AND z+x>y,"Yes","No") as triangle  
      
      FROM Triangle; 

--USING CASE

select x,y,z,
 case when  x+y>z AND x+z>y AND z+y>x THEN 'Yes'
 Else 'No'
 END as triangle
 from Triangle