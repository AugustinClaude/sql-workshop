SELECT
    people.id AS id,
    first_name,
    last_name
FROM
    people
WHERE EXISTS (
    SELECT *
    FROM
        transport.metro_usage_logs AS mul,
        transport.metro_stations AS ms
    WHERE
        mul.person_id = people.id
        AND mul.station_id = ms.id
        AND ms.name = 'Morgane Abeille'
);
