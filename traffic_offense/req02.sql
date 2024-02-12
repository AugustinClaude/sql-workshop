SELECT *
FROM traffic_violations
WHERE
    license_plate SIMILAR TO 'AZ__36_' AND violation_date BETWEEN timestamp '2059-12-03 21:00:00' - interval '1h' AND timestamp '2059-12-03 21:00:00' + interval '1h';
