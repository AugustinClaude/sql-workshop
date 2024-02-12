SELECT
    people.id AS person_id,
    people.first_name,
    people.last_name,
    out.created_at,
    out.serving_time,
    CASE
        WHEN out.id IN (SELECT sr.outcome_id FROM justice.sentence_reductions AS sr WHERE sr.outcome_id = out.id)
            THEN (out.created_at + (out.serving_time || ' months')::interval - (sr.amount || ' months')::interval)
        ELSE (out.created_at + (out.serving_time || ' months')::interval)
    END AS release_date
INTO release_dates
FROM
    justice.records AS rec,
    justice.outcomes AS out LEFT JOIN justice.sentence_reductions AS sr ON out.id = sr.outcome_id,
    justice.trials AS trials,
    justice.cases AS cases,
    justice.defendants AS def,
    people
WHERE
    rec.outcome_id = out.id AND
    rec.defendants_id = def.id AND
    out.trial_id = trials.id AND
    cases.id = trials.case_id AND
    def.person_id = people.id AND
    def.trial_id = trials.id AND
    out.outcome = 'GUILTY'
ORDER BY
    release_date DESC,
    out.serving_time DESC
;
