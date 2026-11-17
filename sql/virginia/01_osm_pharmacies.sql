-- Query 1: Pharmacy Locations
-- Purpose: Extract all pharmacy points of interest in Virginia.
SELECT osm_id, name, fclass, geom
FROM pois
WHERE fclass = 'pharmacy';