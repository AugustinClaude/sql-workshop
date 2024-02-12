SELECT sea.id
FROM scrooge_eats_accounts AS sea, companies
WHERE companies.id = company_id AND name = 'DTF';
