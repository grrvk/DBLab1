--get objects from exhibitions in open galleries

CREATE OR REPLACE FUNCTION get_objects_for_exhibitions_in_open_galleries(request_time TIME)
    RETURNS TABLE (gallery_res_name VARCHAR, exhibition_res_title VARCHAR,
                    object_res_name VARCHAR, object_res_description VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
        SELECT gallery_name, exhibition_title, object_name, object_description
            FROM (exhibition JOIN gallery
                ON gallery.gallery_id = exhibition.gallery_id)
                    JOIN object ON object.exhibition_id = exhibition.exhibition_id
            WHERE (gallery_is_open = TRUE
                AND  (request_time between gallery_open_hours_start and gallery_open_hours_end));
END;
$$;

