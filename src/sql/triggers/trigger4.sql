--Raises error if review mark is less than zero or more than five

CREATE FUNCTION before_insert_review() RETURNS trigger AS $before_insert_review$
    BEGIN
        IF NEW.review_mark < 0 OR NEW.review_mark > 5 THEN
            RAISE EXCEPTION '% must be from 0 to 5', NEW.review_mark;
        END IF;
        RETURN NEW;
    END;
$before_insert_review$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_review
    BEFORE INSERT OR UPDATE ON review
    FOR EACH ROW EXECUTE PROCEDURE before_insert_review()