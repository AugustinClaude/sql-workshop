DELETE FROM epix_posts AS posts
USING
    epix_hashtags AS ht,
    epix_accounts AS acc,
    people
WHERE
    acc.person_id = people.id
    AND acc.id = posts.author_id
    AND posts.hashtag_id = ht.id
    AND ht.name ILIKE 'EndSurveillance'
RETURNING first_name, last_name, username, body AS post_content
;
