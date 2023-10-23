--Raises error if ticket cost is less than zero

CREATE FUNCTION before_insert_ticket() RETURNS trigger AS $before_insert_ticket$
    BEGIN
        IF NEW.ticket_cost < 0 THEN
            RAISE EXCEPTION '% cannot have a negative salary', NEW.ticket_cost;
        END IF;
        RETURN NEW;
    END;
$before_insert_ticket$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_ticket
    BEFORE INSERT OR UPDATE ON ticket
    FOR EACH ROW EXECUTE PROCEDURE before_insert_ticket()

