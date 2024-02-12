SELECT
    emp.null_employee_id_rows_count,
    store.null_store_id_rows_count
FROM
(
    SELECT
        count(*) AS null_store_id_rows_count
    FROM
        nexus_stores.cashier_shifts
    WHERE
        store_id IS NULL
) AS store
NATURAL JOIN
(
    SELECT
        count(*) AS null_employee_id_rows_count
    FROM
        nexus_stores.cashier_shifts
    WHERE
        employee_id IS NULL
) AS emp
