CREATE RECURSIVE VIEW memorin.server_hierarchy(id, zone_id, core_count, ram, storage, data_center_id) AS
SELECT
    id,
    zone_id,
    core_count,
    ram,
    storage,
    id AS data_center_id
FROM
    memorin.servers AS serv
WHERE
    master_id IS NULL
UNION ALL
SELECT
    serv.id,
    serv.zone_id,
    serv.core_count,
    serv.ram,
    serv.storage,
    sh.data_center_id AS data_center_id
FROM memorin.servers AS serv
INNER JOIN server_hierarchy AS sh
ON serv.master_id = sh.id
;
