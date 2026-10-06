-- =====================================================
-- CARSHARING PROJECT - SQL QUERIES
-- =====================================================

-- 6(a) Date and time with the highest demand in 2017

SELECT
    timestamp,
    demand
FROM CarSharing_df
WHERE strftime('%Y', timestamp) = '2017'
ORDER BY demand DESC
LIMIT 1;


-- 6(b) Weekday, month and season with highest average demand

SELECT
    t.weekday_name,
    t.month_name,
    t.season,
    AVG(c.demand) AS average_demand
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY
    t.weekday_name,
    t.month_name,
    t.season
ORDER BY average_demand DESC;


-- 6(b) Weekday, month and season with lowest average demand

SELECT
    t.weekday_name,
    t.month_name,
    t.season,
    AVG(c.demand) AS average_demand
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY
    t.weekday_name,
    t.month_name,
    t.season
ORDER BY average_demand ASC;


-- 6(c) Average demand at different hours
-- for the weekdays selected in 6(b)

SELECT
    t.weekday_name,
    t.hour,
    AVG(c.demand) AS average_demand
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
    AND t.weekday_name IN ('Sunday', 'Monday')
GROUP BY
    t.weekday_name,
    t.hour
ORDER BY average_demand DESC;


-- 6(d) Temperature category prevalence in 2017

SELECT
    temp.temp_category,
    COUNT(*) AS number_of_records
FROM CarSharing_df c
JOIN temperature temp
    ON c.temp_code = temp.temp_code
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY temp.temp_category
ORDER BY number_of_records DESC;


-- 6(d) Weather condition prevalence in 2017

SELECT
    w.weather,
    COUNT(*) AS number_of_records
FROM CarSharing_df c
JOIN weather w
    ON c.weather_code = w.weather_code
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY w.weather
ORDER BY number_of_records DESC;


-- 6(d) Monthly wind speed statistics in 2017

SELECT
    t.month_name,
    AVG(c.windspeed) AS average_wind_speed,
    MAX(c.windspeed) AS highest_wind_speed,
    MIN(c.windspeed) AS lowest_wind_speed
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY t.month_name
ORDER BY
    CASE t.month_name
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


-- 6(d) Monthly humidity statistics in 2017

SELECT
    t.month_name,
    AVG(c.humidity) AS average_humidity,
    MAX(c.humidity) AS highest_humidity,
    MIN(c.humidity) AS lowest_humidity
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY t.month_name
ORDER BY
    CASE t.month_name
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;


-- 6(d) Average demand by temperature category in 2017

SELECT
    temp.temp_category,
    AVG(c.demand) AS average_demand
FROM CarSharing_df c
JOIN temperature temp
    ON c.temp_code = temp.temp_code
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY temp.temp_category
ORDER BY average_demand DESC;


-- 6(e) Month with the highest average demand in 2017

SELECT
    t.month_name,
    AVG(c.demand) AS average_demand
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
GROUP BY t.month_name
ORDER BY average_demand DESC
LIMIT 1;


-- 6(e) Temperature category prevalence in July 2017

SELECT
    temp.temp_category,
    COUNT(*) AS number_of_records
FROM CarSharing_df c
JOIN temperature temp
    ON c.temp_code = temp.temp_code
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
    AND t.month_name = 'July'
GROUP BY temp.temp_category
ORDER BY number_of_records DESC;


-- 6(e) Weather prevalence in July 2017

SELECT
    w.weather,
    COUNT(*) AS number_of_records
FROM CarSharing_df c
JOIN weather w
    ON c.weather_code = w.weather_code
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
    AND t.month_name = 'July'
GROUP BY w.weather
ORDER BY number_of_records DESC;


-- 6(e) Wind speed statistics for July 2017

SELECT
    AVG(c.windspeed) AS average_wind_speed,
    MAX(c.windspeed) AS highest_wind_speed,
    MIN(c.windspeed) AS lowest_wind_speed
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
    AND t.month_name = 'July';


-- 6(e) Humidity statistics for July 2017

SELECT
    AVG(c.humidity) AS average_humidity,
    MAX(c.humidity) AS highest_humidity,
    MIN(c.humidity) AS lowest_humidity
FROM CarSharing_df c
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
    AND t.month_name = 'July';


-- 6(e) Average demand by temperature category in July 2017

SELECT
    temp.temp_category,
    AVG(c.demand) AS average_demand
FROM CarSharing_df c
JOIN temperature temp
    ON c.temp_code = temp.temp_code
JOIN time t
    ON c.id = t.id
WHERE strftime('%Y', c.timestamp) = '2017'
    AND t.month_name = 'July'
GROUP BY temp.temp_category
ORDER BY average_demand DESC;