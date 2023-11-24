--get average exhibition rating based on reviews

CREATE OR REPLACE FUNCTION get_exhibition_average_rating_by_reviews(
    exhID INT
) RETURNS FLOAT
LANGUAGE plpgsql
AS $$
    DECLARE rating FLOAT;
BEGIN
        SELECT AVG(review_mark) INTO rating FROM review WHERE exhibition_id = exhID;
        RETURN rating;
END;
$$;

