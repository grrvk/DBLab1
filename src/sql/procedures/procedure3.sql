--check ticket if not checked

CREATE OR REPLACE PROCEDURE check_ticket(
    tID INT
)
LANGUAGE plpgsql
AS $$
    DECLARE
        t_is_checked BOOLEAN;
    BEGIN
        SELECT ticket_is_checked INTO t_is_checked FROM ticket WHERE ticket_id = tID;

        IF NOT t_is_checked THEN
            UPDATE ticket SET ticket_is_checked = TRUE WHERE ticket_id = tID;
        END IF;
    END;
$$;