INSERT INTO scrooge_eats_orders (id, account_id, ordered_at, total_price)
SELECT
    10000 AS id,
    sea.id AS account_id,
    now() AS ordered_at,
    0 AS total_price
FROM scrooge_eats_accounts AS sea, companies
WHERE companies.id = company_id AND name = 'DTF';
