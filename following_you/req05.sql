SELECT
    people.id AS person_id,
    first_name AS person_first_name,
    last_name AS person_last_name,
    mul.created_at,
    'metro' AS place,
    station_id AS place_id
FROM
    people,
    transport.metro_usage_logs AS mul
WHERE
    mul.person_id = people.id
    AND mul.created_at BETWEEN '2059-12-03 17:00' AND '2059-12-03 22:00'

UNION

SELECT
    people.id AS person_id,
    first_name AS person_first_name,
    last_name AS person_last_name,
    sel.created_at,
    'shop' AS place,
    shop_id AS place_id
FROM
    people,
    shop_entrance_logs AS sel
WHERE
    sel.person_id = people.id
    AND sel.created_at BETWEEN '2059-12-03 17:00' AND '2059-12-03 22:00'

UNION

SELECT
    people.id AS person_id,
    first_name AS person_first_name,
    last_name AS person_last_name,
    sl.created_at,
    'street' AS place,
    street_id AS place_id
FROM
    people,
    street_logs AS sl
WHERE
    sl.person_id = people.id
    AND sl.created_at BETWEEN '2059-12-03 17:00' AND '2059-12-03 22:00'
ORDER BY
    created_at ASC,
    person_id ASC
;
