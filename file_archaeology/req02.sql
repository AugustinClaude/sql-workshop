SELECT
    filename,
    sub.max_size AS size
FROM
    dtf.madelines_files,
    (
        SELECT max(size) AS max_size
        FROM dtf.madelines_files
        WHERE created_at BETWEEN (
                timestamp '2059-12-03' - interval '6d'
            ) AND '2059-12-03'
    ) AS sub
WHERE
    sub.max_size = size
    AND created_at BETWEEN (timestamp '2059-12-03' - interval '6d') AND '2059-12-03'
ORDER BY filename ASC;
