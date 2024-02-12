INSERT INTO scrooge_eats_reviews (
    account_id, order_id, rating, review
) VALUES (
    (
        SELECT sea.id
        FROM scrooge_eats_accounts AS sea, companies
        WHERE companies.id = company_id AND name = 'DTF'
    ),
    NULL,
    5,
    'Couscous miam !'
);
