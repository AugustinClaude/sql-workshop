SELECT
    id,
    size AS stored_size,
    decrypted,
    CASE
        WHEN size IS NULL
            THEN (
                CASE
                    WHEN decrypted
                        THEN (
                            SELECT avg(size) AS new_size FROM dtf.madelines_files_results WHERE decrypted AND parent_id IS NOT NULL
                        )::bigint
                    ELSE (
                        SELECT avg(size) AS new_size FROM dtf.madelines_files_results WHERE NOT decrypted AND parent_id IS NOT NULL
                    )::bigint
                END
            )
        ELSE size
    END AS calculated_size
FROM
    dtf.madelines_files_results AS mfr
WHERE
    parent_id IS NOT NULL
ORDER BY
    id ASC
;
