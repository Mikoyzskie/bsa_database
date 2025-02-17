SELECT 
    m.id,
    m.title,
    COUNT(c.actor_id) AS actors_count
FROM 
    Movie m
LEFT JOIN 
    Character c ON m.id = c.movie_id
WHERE 
    m.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY 
    m.id, m.title;