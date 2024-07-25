SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object('file_name', f.file_name, 'url', f.url) AS poster,
    json_build_object(
        'id', d.id, 
        'first_name', d.first_name, 
        'last_name', d.last_name, 
        'photo', json_build_object('file_name', pf.file_name, 'url', pf.url)
    ) AS director,
    json_agg(
        json_build_object(
            'id', a.id,
            'first_name', a.first_name,
            'last_name', a.last_name,
            'photo', json_build_object('file_name', af.file_name, 'url', af.url)
        )
    ) FILTER (WHERE a.id IS NOT NULL) AS actors,
    json_agg(
        json_build_object(
            'id', g.id,
            'name', g.name
        )
    ) FILTER (WHERE g.id IS NOT NULL) AS genres
FROM 
    Movie m
LEFT JOIN 
    File f ON m.poster = f.id
JOIN 
    Person d ON m.director = d.id
LEFT JOIN 
    File pf ON d.avatar_file_id = pf.id
LEFT JOIN 
    Character c ON m.id = c.movie
LEFT JOIN 
    Person a ON c.actor = a.id
LEFT JOIN 
    File af ON a.avatar_file_id = af.id
LEFT JOIN 
    Movie_Genre mg ON m.id = mg.movie
LEFT JOIN 
    Genre g ON mg.genre = g.id
WHERE 
    m.id = 1
GROUP BY 
    m.id, m.title, m.release_date, m.duration, m.description, f.file_name, f.url, d.id, d.first_name, d.last_name, pf.file_name, pf.url;
