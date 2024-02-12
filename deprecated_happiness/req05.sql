UPDATE migration.medical_record_entries
SET description = left(description, 97) || '...'
WHERE length(description) > 100;

ALTER TABLE migration.medical_record_entries
ALTER COLUMN description TYPE varchar(100);
