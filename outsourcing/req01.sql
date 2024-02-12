SELECT
    trials.id AS trial_id,
    case_id,
    classification,
    description
INTO definitive_trials
FROM justice.trials AS trials, justice.cases AS cases
WHERE cases.id = trials.case_id AND trials.status = 'FINISHED';
