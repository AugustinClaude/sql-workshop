INSERT INTO scrooge_eats_basket_items (order_id, item_id, quantity) VALUES (
    10000, (SELECT id FROM scrooge_eats_items WHERE name = 'Tacos'), 1
),
(10000, (SELECT id FROM scrooge_eats_items WHERE name = 'Coca-Cola'), 1),
(
    10000,
    (SELECT id FROM scrooge_eats_items WHERE name = 'Kinder Bueno White'),
    1
);
