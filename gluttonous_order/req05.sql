INSERT INTO scrooge_eats_orders (id, account_id, ordered_at, total_price)
SELECT
    10001 AS id,
    sea.id AS account_id,
    now() AS ordered_at,
    0 AS total_price
FROM scrooge_eats_accounts AS sea, companies
WHERE companies.id = company_id AND name = 'DTF';

INSERT INTO scrooge_eats_basket_items (order_id, item_id, quantity) VALUES (
    10001, (SELECT id FROM scrooge_eats_items WHERE name = 'Tacos'), 1
),
(10001, (SELECT id FROM scrooge_eats_items WHERE name = 'Coca-Cola'), 1),
(
    10001,
    (SELECT id FROM scrooge_eats_items WHERE name = 'Kinder Bueno White'),
    1
);
