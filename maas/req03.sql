CREATE VIEW memorin.zoned_devices_logs AS
SELECT
    device_serial,
    dl.version_id,
    zone_id,
    latitude AS lat,
    longitude AS long,
    temperature AS temp,
    battery_percentage AS battery,
    signal_strength
FROM
    memorin.device_logs AS dl
WHERE
    temperature BETWEEN 34 AND 45
    AND signal_strength BETWEEN 0 AND 5
    AND battery_percentage BETWEEN 0 AND 100
    AND latitude IN (
        SELECT
            latitude
        FROM
            memorin.geographic_zones AS gz
        WHERE
            dl.zone_id = gz.id
            AND latitude BETWEEN min_latitude AND max_latitude
        )
    AND longitude IN (
        SELECT
            longitude
        FROM
            memorin.geographic_zones AS gz
        WHERE
            dl.zone_id = gz.id
            AND longitude BETWEEN min_longitude AND max_longitude
        )
    AND device_serial IN (SELECT serial_number FROM memorin.devices WHERE deactivated_at IS NULL)
    AND dl.version_id IN (SELECT id FROM memorin.device_versions)
WITH CHECK OPTION;
