SELECT name, count(name)
FROM animal_ins
WHERE name is not null
GROUP BY name
HAVING count(name)>=2
ORDER BY name
