SELECT
    CASE
        WHEN sub.parent_id IS NULL
            THEN NULL
        ELSE id
    END AS folder_id,
    sub.nb AS nb_executables
FROM
    dtf.madelines_files AS mf,
    (
        SELECT
            count(*) AS nb,
            parent_id
        FROM
            dtf.madelines_files
        WHERE
            substring(permissions, 4, 1) = 'x'
            OR substring(permissions, 7, 1) = 'x'
            OR substring(permissions, 10, 1) = 'x'
        GROUP BY parent_id
    ) AS sub
WHERE
    (
        mf.id = sub.parent_id
        OR sub.parent_id IS NULL
    )
    AND sub.nb >= 3
    AND substring(mf.permissions, 1, 1) = 'd'
GROUP BY
    folder_id,
    sub.nb
ORDER BY
    folder_id ASC NULLS FIRST
;
