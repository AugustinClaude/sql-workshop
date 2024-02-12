SELECT *
FROM traffic_violations
WHERE
    license_plate IN (SELECT license_plate FROM traffic_violations WHERE license_plate SIMILAR TO 'AZ__36_' AND violation_date BETWEEN timestamp '2059-12-03 21:00:00' - interval '1h' AND timestamp '2059-12-03 21:00:00' + interval '1h' AND (description = 'SPEED_AND_TRAFFIC_VIOLATION' OR description = 'RECKLESS_AND_DANGEROUS_DRIVING')) AND violation_date BETWEEN timestamp '2059-12-03 0:00:00' AND timestamp '2059-12-03 0:00:00' + interval '1d';
