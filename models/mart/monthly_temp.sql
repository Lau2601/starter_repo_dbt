WITH total_month_avg AS (
    SELECT city,
            country,
            year,
            lat,
            lon,
            round(avg(avgtemp_c),2) as avg_temp_month,
            max(maxtemp_c) as max_temp_month,
            min(mintemp_c) as min_temp_month
    FROM {{ref('prep_temp')}}
    GROUP BY city, country, year, month, lat,lon
)
SELECT *
FROM total_month_avg