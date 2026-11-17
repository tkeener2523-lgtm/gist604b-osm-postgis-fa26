-- Query 3: Pharmacies Near Schools
-- Purpose: Count pharmacies within 1 km of each school (proximity analysis).
SELECT s.osm_id,
       s.name AS school_name,
       COUNT(p.osm_id) AS pharmacies_within_1km,
       s.geom
FROM pois AS s
LEFT JOIN pois AS p
  ON p.fclass = 'pharmacy'
 AND ST_DWithin(s.geom::geography, p.geom::geography, 1000)
WHERE s.fclass = 'school'
GROUP BY s.osm_id, s.name, s.geom
ORDER BY pharmacies_within_1km DESC, s.name;