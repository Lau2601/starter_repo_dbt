WITH total_avg AS (
    SELECT city,
            country,
            week,
            year,
            lat,
            lon,
            avg(avgtemp_c) as avg_temp_week,
            max(maxtemp_c) as max_temp_week,
            min(mintemp_c) as min_temp_week
    FROM {{ref('prep_temp')}}
    GROUP BY city, country, year, week, lat,lon
)
SELECT *
FROM total_avg


