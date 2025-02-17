SELECT 
    p.id AS director_id,
    CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    AVG(m.budget) AS average_budget
FROM 
    Person p
JOIN 
    Movie m ON p.id = m.director
GROUP BY 
    p.id, p.first_name, p.last_name;