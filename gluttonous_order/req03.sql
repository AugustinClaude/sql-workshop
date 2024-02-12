INSERT INTO scrooge_eats_basket_items (order_id, item_id, quantity)
SELECT
    10000 AS order_id,
    sei.id,
    1 AS quantity
FROM scrooge_eats_items AS sei
WHERE sei.name = 'Kinder Bueno White';
