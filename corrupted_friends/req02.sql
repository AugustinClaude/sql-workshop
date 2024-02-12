INSERT INTO dtf.madelines_contacts (id, title, first_name, last_name, phone, email, favorite, created_at)
SELECT
    id,
    upper(regexp_replace(trim(trailing ' ' from regexp_replace(full_name, '[^\x00-\x7F]+|[0-9]+', '', 'g')), '([^ ]*) ([^ ]*) ([^ ]*)', '\1', 'g'))::prefix AS title,
    initcap(regexp_replace(trim(trailing ' ' from regexp_replace(full_name, '[^\x00-\x7F]+|[0-9]+', '', 'g')), '([^ ]*) ([^ ]*) ([^ ]*)', '\2', 'g')) AS first_name,
    initcap(regexp_replace(trim(trailing ' ' from regexp_replace(full_name, '[^\x00-\x7F]+|[0-9]+', '', 'g')), '([^ ]*) ([^ ]*) ([^ ]*)', '\3', 'g')) AS last_name,
    lpad(regexp_replace(trim(trailing ' ' from regexp_replace(phone, '[^\x00-\x7F]+|[^0-9.-]+', '', 'g')), '([0-9]+)[.-]([0-9]+)[.-]([0-9]+)', '\1', 'g'), 3, '0') || '.' || lpad(regexp_replace(trim(trailing ' ' from regexp_replace(phone, '[^\x00-\x7F]+|[^0-9.-]+', '', 'g')), '([0-9]+)[.-]([0-9]+)[.-]([0-9]+)', '\2', 'g'), 3, '0') || '.' || lpad(regexp_replace(trim(trailing ' ' from regexp_replace(phone, '[^\x00-\x7F]+|[^0-9.-]+', '', 'g')), '([0-9]+)[.-]([0-9]+)[.-]([0-9]+)', '\3', 'g'), 3, '0') AS phone,
    trim(trailing ' ' from regexp_replace(email, '[^\x00-\x7F]+', '', 'g')) AS email,
    trim(trailing ' ' from regexp_replace(favorite, '[^\x00-\x7F]+|[^01]+', '', 'g'))::boolean AS favorite,
    trim(trailing ' ' from regexp_replace(created_at, '[^\x00-\x7F]+', '', 'g'))::timestamp AS created_at
FROM
    dtf.madelines_contacts_corrupted
;
