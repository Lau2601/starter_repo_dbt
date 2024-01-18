WITH add_season AS (
    SELECT *,
            CASE
                WHEN EXTRACT(MONTH FROM date) IN (3,4,5) THEN 'Spring'
                WHEN EXTRACT(MONTH FROM date) IN (6,7,8) THEN 'Summer'
                WHEN EXTRACT(MONTH FROM date) IN (9,10,11) THEN 'Fall'
                ELSE 'Winter'
            END AS season
    FROM {{ref('prep_temp')}}           
)
SELECT city,
        country,
        lat,
        lon,
        year,
        season,
        AVG(avgtemp_c) AS avg_temp_season,
        MAX(maxtemp_c) AS max_temp_season,
        MIN(mintemp_c) AS min_temp_season
FROM add_season
WHERE city = ('Berlin','Madrid')
GROUP BY city, country, year, season, lat,lon
