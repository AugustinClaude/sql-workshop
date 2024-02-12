SELECT
    social_credit_history.id,
    person_id,
    credits_change,
    action_description
FROM social_credit_history, people
WHERE people.id = social_credit_history.person_id
    AND date >= '2059-12-03 17:00'
    AND date <= '2059-12-03 22:00'
ORDER BY credits_change ASC, people.id ASC
LIMIT 10;
