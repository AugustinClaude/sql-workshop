SELECT
    people.id AS person_id,
    people.first_name,
    people.last_name,
    people.birth_date,
    out.created_at AS conviction_date,
    out.serving_time,
    CASE
        WHEN (out.created_at + (out.serving_time || ' months')::interval) <= timestamp '2059-12-03 00:00:00'
            THEN 't'
        ELSE 'f'
    END AS could_be_released
INTO outcome_status
FROM
    justice.records AS rec,
    justice.outcomes AS out,
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
    out.outcome = 'GUILTY' AND
    cases.classification = 'CRIME'
;
