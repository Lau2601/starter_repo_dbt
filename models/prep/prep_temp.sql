WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        date_part('weekday',add_weekday) AS weekday,
        date_part('day_num', add_weekday) AS day_num
    FROM temp_daily
)
SELECT *
FROM add_weekday