CREATE VIEW memorin.devices_summary AS
SELECT
    count(*) AS total_devices,
    count(*) FILTER (WHERE deactivated_at IS NULL) AS active_devices,
    count(*) FILTER (WHERE deactivated_at IS NOT NULL) AS inactive_devices
FROM
    memorin.devices
;
