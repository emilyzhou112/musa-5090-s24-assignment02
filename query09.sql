/*
With a query involving PWD parcels and census block groups,
find the geo_id of the block group that contains Meyerson Hall.
*/

WITH meyerson AS (
    SELECT *
    FROM phl.pwd_parcels
    WHERE address ILIKE '220-30 S 34TH ST'
)

SELECT bg.geoid
FROM census.blockgroups_2020 AS bg
INNER JOIN meyerson ON ST_INTERSECTS(bg.geog, meyerson.geog)
