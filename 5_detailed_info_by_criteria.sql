SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object('file_name', f.file_name, 'url', f.url) AS poster,
    json_build_object('id', d.id, 'first_name', d.first_name, 'last_name', d.last_name) AS director
FROM 
    Movie m
JOIN 
    Country c ON m.country = c.id
JOIN 
    Person d ON m.director = d.id
JOIN 
    Movie_Genre mg ON m.id = mg.movie
JOIN 
    Genre g ON mg.genre = g.id
LEFT JOIN 
    File f ON m.poster = f.id
WHERE 
    c.id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND g.name IN ('Action', 'Drama')
GROUP BY 
    m.id, m.title, m.release_date, m.duration, m.description, f.file_name, f.url, d.id, d.first_name, d.last_name;
