SELECT 
    nse.id AS employee_id,
    people.id AS person_id,
    first_name,
    last_name
FROM
    people
INNER JOIN
    nexus_stores.employees AS nse
ON nse.person_id = people.id
INNER JOIN
    nexus_stores.cashier_shifts AS cs
ON cs.employee_id = nse.id
WHERE
    cs.store_id = 78
    AND position = 'CASHIER'

EXCEPT

SELECT DISTINCT
    nse.id AS employee_id,
    people.id AS person_id,
    first_name,
    last_name
FROM
    people
INNER JOIN
    nexus_stores.employees AS nse
ON nse.person_id = people.id
INNER JOIN
    nexus_stores.cashier_shifts AS cs
ON cs.employee_id = nse.id
WHERE
    cs.store_id = 78
    AND position = 'CASHIER'
    AND start_timestamp = '2059-12-01 13:00'
;
