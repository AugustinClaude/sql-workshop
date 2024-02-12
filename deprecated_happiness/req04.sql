ALTER TABLE migration.patients_records
ADD person_id integer;

ALTER TABLE migration.patients_records
ADD CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES people(id);

UPDATE migration.patients_records AS prec
SET person_id = sub.person_id
FROM
    (
        SELECT
            pids.person_id,
            pids.patient_id
        FROM
            medical_confidential.patients_ids AS pids,
            people
        WHERE
            pids.person_id = people.id
    ) AS sub
WHERE prec.id = sub.patient_id;

ALTER TABLE migration.patients_records
ALTER COLUMN person_id SET NOT NULL;
