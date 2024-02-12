SELECT
    mf.owner,
    sub.min_nb AS num_files
FROM
    dtf.madelines_files AS mf,
    (
        SELECT
            min(sub2.num_files) AS min_nb
        FROM
        (
            SELECT
                count(*) AS num_files
            FROM
                dtf.madelines_files
            GROUP BY owner
        ) AS sub2
    ) AS sub
GROUP BY
    mf.owner,
    num_files
HAVING
    count(*) = sub.min_nb
ORDER BY
    mf.owner ASC
;
