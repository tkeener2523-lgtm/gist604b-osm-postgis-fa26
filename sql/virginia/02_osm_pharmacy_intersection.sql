-- Query 2: Pharmacies by Jurisdiction
-- Purpose: Count pharmacies in each Virginia county or independent city.
SELECT a.name AS area_name,
       a.fclass AS area_type,
       COUNT(p.osm_id) AS pharmacy_count
FROM adminareas_a AS a
LEFT JOIN pois AS p
  ON ST_Intersects(p.geom, a.geom)
 AND p.fclass = 'pharmacy'
GROUP BY a.name, a.fclass
ORDER BY pharmacy_count DESC, a.name;