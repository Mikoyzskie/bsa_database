SELECT 
    u.id,
    u.username,
    JSON_ARRAYAGG(fm.movie) AS favorite_movie_ids
FROM 
    users u
LEFT JOIN 
    favorite_movies fm ON u.id = fm.user_id
GROUP BY 
    u.id, u.username;