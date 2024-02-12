SELECT
    'metro' AS place_type,
    count(*) AS entries,
    station_id AS place_id
FROM
    transport.metro_usage_logs AS mul
GROUP BY station_id

UNION

SELECT
    'shop' AS place_type,
    count(*) AS entries,
    shop_id AS place_id
FROM
    shop_entrance_logs AS sel
WHERE
    transit_type = 'ENTER'
GROUP BY shop_id
ORDER BY
    entries DESC,
    place_id ASC,
    place_type DESC
;
