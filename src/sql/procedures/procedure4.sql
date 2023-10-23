--open/close gallery

CREATE OR REPLACE PROCEDURE toggle_gallery_open(
    gID INT
)
LANGUAGE plpgsql
AS $$
    DECLARE
        g_is_open BOOLEAN;
    BEGIN
        SELECT gallery_is_open INTO g_is_open FROM gallery WHERE gallery_id = gID;

        IF g_is_open
        THEN
            UPDATE gallery SET gallery_is_open = FALSE WHERE gallery_id = gID;
        ELSE
            UPDATE gallery SET gallery_is_open = TRUE WHERE gallery_id = gID;
        END IF;
    END;
$$;