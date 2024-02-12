SELECT
    sales.id AS sales_id,
    product_id,
    sales.checkout_id,
    sale_timestamp,
    cs.id AS shift_id,
    employee_id,
    cs.start_timestamp AS shift_start_timestamp,
    cs.end_timestamp AS shift_end_timestamp
INTO TABLE dtf.shifts_and_sales_78
FROM
    nexus_stores.sales AS sales
INNER JOIN
    nexus_stores.cashier_shifts AS cs
    ON sales.checkout_id = cs.checkout_id
WHERE
    sales.store_id = 78
    AND cs.start_timestamp = '2059-12-01 13:00'
    AND cs.end_timestamp = '2059-12-01 15:00';
