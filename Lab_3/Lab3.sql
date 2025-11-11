SELECT *
FROM Passengers 
WHERE gender = "male"
AND date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'\

-- 

SELECT first_name, last_name FROM Passengers
    CASE 
    