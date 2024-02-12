SELECT
    cast(avg(sub.rsa_time) AS numeric(10, 2)) AS avg_rsa_time,
    cast(avg(sub.hyper_pulse_time) AS numeric(10, 2)) AS avg_hyper_pulse_time,
    cast(avg(sub.quantum_x_time) AS numeric(10, 2)) AS avg_quantum_x_time,
    cast(avg(sub.aes_time) AS numeric(10, 2)) AS avg_aes_time,
    cast(avg(sub.d_crypt_time) AS numeric(10, 2)) AS avg_d_crypt_time
FROM
    (
        SELECT
            coalesce(
                nullif(rsa_time, 0),
                (
                    SELECT max(rsa_time)
                    FROM dtf.madelines_files_results
                    WHERE rsa_time IS NOT NULL
                )
            ) AS rsa_time,
            coalesce(
                nullif(hyper_pulse_time, 0),
                (
                    SELECT max(hyper_pulse_time)
                    FROM dtf.madelines_files_results
                    WHERE hyper_pulse_time IS NOT NULL
                )
            ) AS hyper_pulse_time,
            coalesce(
                nullif(quantum_x_time, 0),
                (
                    SELECT max(quantum_x_time)
                    FROM dtf.madelines_files_results
                    WHERE quantum_x_time IS NOT NULL
                )
            ) AS quantum_x_time,
            coalesce(
                nullif(aes_time, 0),
                (
                    SELECT max(aes_time)
                    FROM dtf.madelines_files_results
                    WHERE aes_time IS NOT NULL
                )
            ) AS aes_time,
            coalesce(
                nullif(d_crypt_time, 0),
                (
                    SELECT max(d_crypt_time)
                    FROM dtf.madelines_files_results
                    WHERE d_crypt_time IS NOT NULL
                )
            ) AS d_crypt_time
        FROM
            dtf.madelines_files_results
    ) AS sub;
