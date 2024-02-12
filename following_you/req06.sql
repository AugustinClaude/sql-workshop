SELECT
    people.id AS person_id,
    validation,
    created_at
FROM
    people,
    transport.metro_usage_logs
WHERE
    person_id = people.id
    AND created_at BETWEEN '2059-12-03 12:00' AND '2059-12-03 14:00'
 
UNION

(
SELECT
    people.id AS person_id,
    validation,
    created_at
FROM
    people,
    transport.metro_usage_logs
WHERE
    person_id = people.id
    AND created_at BETWEEN '2059-12-03 20:00' AND '2059-12-03 22:00'
LIMIT 10
)
ORDER BY
    created_at DESC
;
