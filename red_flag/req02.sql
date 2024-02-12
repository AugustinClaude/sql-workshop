UPDATE epix_posts
SET downvotes = (
    SELECT
        (post.upvotes * votes.average) AS new_down
    FROM
        epix_posts AS post,
        (
            SELECT
                avg(downvotes::float / upvotes::float) AS average
            FROM
                epix_posts AS posts
            WHERE
                author_id = 933
                AND id <> 139
        ) AS votes
    WHERE
        id = 139
)
WHERE id = 139
;
