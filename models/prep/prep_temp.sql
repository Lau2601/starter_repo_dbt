WITH temp_daily AS (
    SELECT * 
    FROM {{ref('staging_weather')}}
),
add_weekday AS (
    SELECT *,
        to_char(date,'day') AS weekday,
        to_char(date,'DD') AS day_num,
        to_char(date,'MM') AS month_num,
        to_char(date,'Month') AS month,
        to_char(date,'YYYY') AS year,
        to_char(date, 'WW') AS week
    FROM temp_daily
)
SELECT *
FROM add_weekday
