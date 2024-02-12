SELECT
    receipt_id,
    name,
    quantity,
    price
FROM nexus_stores.receipt_items AS receipt_items,
    nexus_stores.products AS products
WHERE
    products.id = receipt_items.product_id AND quantity > 10 AND name ~* 'apple';
