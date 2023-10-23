--Updates updated_at field with current time value

CREATE FUNCTION before_update_object() RETURNS trigger AS $before_update_object$
    BEGIN
        NEW.updated_at := CURRENT_TIMESTAMP;
        RETURN NEW;
    END;
$before_update_object$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_object
    BEFORE UPDATE ON object
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_artist
    BEFORE UPDATE ON artist
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_exhibition
    BEFORE UPDATE ON exhibition
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_gallery
    BEFORE UPDATE ON gallery
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_personnel
    BEFORE UPDATE ON personnel
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_position
    BEFORE UPDATE ON position
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_publication
    BEFORE UPDATE ON publication
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_publication_author
    BEFORE UPDATE ON publication_author
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_room
    BEFORE UPDATE ON room
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();

CREATE TRIGGER before_update_ticket
    BEFORE UPDATE ON ticket
    FOR EACH ROW EXECUTE PROCEDURE before_update_object();