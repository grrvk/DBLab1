--create review

CREATE OR REPLACE PROCEDURE create_review(
    r_exhibition_id INT,
    r_reviewer_name VARCHAR(20),
    r_review_mark INT,
    r_information VARCHAR(150)
)
LANGUAGE plpgsql
AS $$
    BEGIN
        INSERT INTO review(exhibition_id, reviewer_name, review_mark, review_information)
        VALUES (r_exhibition_id, r_reviewer_name, r_review_mark, r_information);
    END;
$$;