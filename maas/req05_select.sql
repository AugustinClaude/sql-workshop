SELECT
    gz.name AS zone_name,
    count(DISTINCT sub) AS data_center_count,
    count(*) AS total_servers,
    sum(core_count) AS total_cores,
    sum(ram) AS total_ram,
    sum(storage) AS total_storage
FROM
    memorin.server_hierarchy AS sh,
    memorin.geographic_zones AS gz,
    (
        SELECT DISTINCT
            data_center_id
        FROM
            memorin.server_hierarchy
    ) AS sub
WHERE
    gz.id = sh.zone_id
    AND sub.data_center_id = sh.data_center_id
GROUP BY
    gz.name
ORDER BY
    data_center_count DESC,
    total_servers DESC,
    zone_name ASC
;
