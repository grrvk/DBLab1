--Fills gallery NULL fields with mock values

CREATE FUNCTION before_insert_gallery() RETURNS trigger AS $before_insert_gallery$
    BEGIN
        IF NEW.gallery_description IS NULL THEN
            NEW.gallery_description := 'Mock description';
        END IF;
        IF NEW.gallery_address IS NULL THEN
             NEW.gallery_address := 'Mock address';
        END IF;
        IF NEW.gallery_phone IS NULL THEN
            NEW.gallery_phone := '380939999999';
        END IF;
        RETURN NEW;
    END;
$before_insert_gallery$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_gallery
    BEFORE INSERT OR UPDATE ON gallery
    FOR EACH ROW EXECUTE PROCEDURE before_insert_gallery()

