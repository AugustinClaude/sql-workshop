SELECT
    people.id AS person_id,
    people.first_name,
    people.last_name,
    people.birth_date,
    cases.classification,
    cases.description
INTO TEMPORARY not_guilty
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
    out.outcome = 'NOT_GUILTY'
;
