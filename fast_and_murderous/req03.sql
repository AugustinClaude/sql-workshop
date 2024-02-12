SELECT
    person_id,
    cases.id,
    content,
    description
FROM justice.testimonies, justice.cases AS cases
WHERE
    case_id = cases.id AND content LIKE '%Nexus N3%' AND description SIMILAR TO '%(speeding|speed|fast|reckless)%';
