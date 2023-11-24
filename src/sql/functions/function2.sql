--get open galleries

CREATE OR REPLACE FUNCTION get_open_galleries(request_time TIME)
    RETURNS TABLE (gallery_res_name VARCHAR, gallery_res_description VARCHAR,
                    gallery_res_address VARCHAR, gallery_res_phone VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
        SELECT gallery_name, gallery_description, gallery_address, gallery_phone
            FROM gallery WHERE (gallery_is_open = TRUE
                AND  (request_time between gallery_open_hours_start and gallery_open_hours_end));
END;
$$;

