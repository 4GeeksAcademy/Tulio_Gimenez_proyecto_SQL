-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;

SELECT r.name, r.country, COUNT(DISTINCT s.scientific_name) as number_species
FROM observations as o
join regions as r
    on o.region_id = r.id
join species as s
    on o.species_id = s.id
GROUP by r.name, r.country
ORDER by number_species desc;

-- MISSION 2
-- Your query here;

SELECT strftime('%m', observations.observation_date) as month, COUNT(*) as total_activity
from observations
group by month
order by total_activity desc;

-- MISSION 3
-- Your query here;

SELECT species.scientific_name, species.common_name, SUM(observations.count) AS total_count
FROM observations
JOIN species 
    ON observations.species_id = species.id
GROUP BY species.id
ORDER BY total_count ASC;

-- MISSION 4
-- Your query here;

SELECT r.name, r.country, count(DISTINCT o.species_id) as number_species
from observations as o
join regions as r
    on o.region_id = r.id
GROUP BY r.name, r.country
order by number_species desc
LIMIT 1; 

-- MISSION 5
-- Your query here;

SELECT species.scientific_name, species.common_name, COUNT(*) AS total_observations
FROM observations
JOIN species
    ON observations.species_id = species.id
GROUP BY species.id
ORDER BY total_observations DESC;

-- MISSION 6
-- Your query here;

SELECT o.observer, count(*) as total_activity
from observations as o
GROUP by o.observer
order by total_activity desc;

-- MISSION 7
-- Your query here;

SELECT species.scientific_name
from species
join observations
    on observations.species_id = species_id
where observations.species_id is NULL;

-- MISSION 8
-- Your query here;

SELECT o.observation_date, count(DISTINCT o.species_id) as species
from observations as o
group by o.observation_date
order by species desc;

