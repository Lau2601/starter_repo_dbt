WITH add_season AS (
    SELECT *,
            CASE
                WHEN month_num IN ('03','04','05') THEN 'Spring'
                WHEN month_num IN ('06','07','08') THEN 'Summer'
                WHEN month_num IN ('09','10','11') THEN 'Fall'
                ELSE 'Winter'
            END AS season
    FROM {{ref('prep_temp')}}           
),
avg_season AS(
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
                WHERE city IN ('Berlin','Madrid')
                GROUP BY city, country, year, season, lat,lon
)
SELECT add_season.*,
        avg_season.city,
        avg_season.country,
        avg_season.lat,
        avg_season.lon,
        avg_season.year,
        avg_season.season,
        avg_season.avg_temp_month,
        avg_season.max_temp_season,
        avg_season.min_temp_season
FROM add_season
LEFT JOIN avg_season
USING (month)