CREATE MATERIALIZED VIEW memorin.outdated_devices AS
SELECT
    serial_number,
    version_id,
    released_at,
    eol_timestamp,
    (
        SELECT
            count(*)
        FROM
            memorin.device_versions
        WHERE
            released_at > dv.released_at
    ) AS versions_behind
FROM
    memorin.devices AS md,
    memorin.device_versions AS dv
WHERE
    md.version_id = dv.id
    AND eol_timestamp IS NOT NULL
    AND deactivated_at IS NULL
;
