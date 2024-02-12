CREATE TEMPORARY VIEW devices_metrics AS
SELECT
    device_serial,
    dl.version_id,
    dl.id AS log_id,
    latitude AS lat,
    longitude AS long,
    temperature AS temp,
    battery_percentage AS battery,
    signal_strength
FROM
    memorin.devices AS md,
    memorin.device_logs AS dl
WHERE
    dl.device_serial = md.serial_number
    AND md.deactivated_at IS NULL
ORDER BY
    device_serial ASC,
    dl.version_id DESC,
    log_id ASC
;
