SELECT
    cs.id,
    checkout_id,
    employee_id,
    cs.store_id AS shift_store_id,
    nsc.store_id AS checkout_store_id,
    start_timestamp,
    end_timestamp
FROM
    nexus_stores.checkouts AS nsc
INNER JOIN
    nexus_stores.cashier_shifts AS cs
    ON nsc.id = cs.checkout_id
;
