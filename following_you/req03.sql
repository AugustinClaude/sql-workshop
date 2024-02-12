SELECT *
FROM
    backup.street_logs AS bsl
WHERE
    bsl.id IN (SELECT id FROM street_logs)
;
