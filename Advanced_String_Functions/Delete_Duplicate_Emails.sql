WITH CTE AS 
(
SELECT MIN(id) as min FROM Person GROUP BY email
)

DELETE FROM Person
WHERE id NOT IN (
    SELECT min 
    FROM CTE
);