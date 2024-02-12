SELECT
    purchase_date,
    first_name,
    last_name,
    email,
    name,
    price,
    category
FROM nexus_stores.receipt_items AS receipt_items,
    nexus_stores.receipts AS receipts, nexus_stores.products AS products
WHERE
    receipt_items.receipt_id = receipts.id AND receipt_items.product_id = products.id AND name ~* 'apple' AND email ~ 's[ae]m[a-z]{3,6}_w[a-z]{6}[0-9]*@roger_[a-z]+.[a-z]{3}';
